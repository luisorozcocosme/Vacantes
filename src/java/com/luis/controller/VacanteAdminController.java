
package com.luis.controller;

import com.luis.dao.DbConnection;
import com.luis.dao.VacanteDao;
import com.luis.model.Vacante;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class VacanteAdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session= request.getSession();
        RequestDispatcher rd;
        if (session.getAttribute("usuario") != null) {
            System.out.println(request.getParameter("action"));
            if (request.getParameter("buscar") != null) {
                this.buscarVacante(request, response);
            }else if (request.getParameter("action")!= null) {
                String action = request.getParameter("action");
                if (action.equals("editar")) {
                    this.mostrarVacante(request, response);
                }
                if (action.equals("eliminar")) {
                    this.eliminarVacante(request, response);
                }
            }else{
                
                DbConnection conn = new DbConnection();
                VacanteDao vacanteDao = new VacanteDao(conn);
                List<Vacante> lista = vacanteDao.getAll();
                conn.disconnect();
                request.setAttribute("vacantes", lista);
                rd = request.getRequestDispatcher("/vacantesAdmin.jsp");
                rd.forward(request, response);
            } 
        }else{
            rd = request.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session= request.getSession();
        RequestDispatcher rd;
        if (session.getAttribute("usuario") != null) {
            
        
            if (request.getParameter("editVacante") != null) {
                this.editarVacante(request, response);
            }else if (request.getParameter("crearVacante") != null) {
                this.crearVacante(request, response);
            }else{
                System.out.println("enviado al get");
                this.doGet(request, response);
            } 
        }else{
            rd = request.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);
        }   
    }
    protected void buscarVacante(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String q = request.getParameter("buscar");
        List <Vacante> lista = null;
        DbConnection conn = new DbConnection();
        VacanteDao vacanteDao = new VacanteDao(conn);
        lista = vacanteDao.getByQuery(q);
        conn.disconnect();
        request.setAttribute("vacantes", lista);
        RequestDispatcher rd;

        rd = request.getRequestDispatcher("/vacantesAdmin.jsp");
        rd.forward(request, response);
    }
    protected void mostrarVacante(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //recibimos el id de la vacante a consultar
        int idVacante = Integer.parseInt(request.getParameter("id"));
        DbConnection conn = new DbConnection();
        VacanteDao vacanteDao = new VacanteDao(conn);
        Vacante vacante = vacanteDao.getById(idVacante);
        conn.disconnect();
        
        System.out.println(vacante);
        request.setAttribute("vacante", vacante);
        RequestDispatcher rd;

        rd = request.getRequestDispatcher("/vacanteEdit.jsp");
        rd.forward(request, response);
    }
    protected void eliminarVacante(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //recibimos el id de la vacante a consultar
        int idVacante = Integer.parseInt(request.getParameter("id"));
        
        //Procesamos los datos. guardar en BD
        DbConnection conn = new DbConnection();
        VacanteDao vacanteDao = new VacanteDao(conn);
        boolean status = vacanteDao.delete(idVacante);
        
        //preparamos un mensaje para el usuario
        String msg = "";

        if (status) {
            msg = "La vacante fue eliminada correctamente ";
        } else {
            msg = "Ocurrio un error. La vacante no fue eliminada.";
        }
        conn.disconnect();
        RequestDispatcher rd;
        //compartimos la variable msg para poder acceder desde la vista con Expresion Language
        request.setAttribute("message", msg);
        //enviamos respuesta. Renderizamos la vista mensaje.jsp
        rd = request.getRequestDispatcher("/mensaje.jsp");
        rd.forward(request, response);
    }
    protected void crearVacante(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombreParam = request.getParameter("nombre");        
        String descripcionParam = request.getParameter("descripcion");
        String detalleParam = request.getParameter("detalle");
        
        Vacante vacante = new Vacante(0);
        vacante.setNombre(nombreParam);
        vacante.setDescripcion(descripcionParam);
        vacante.setDetalle(detalleParam);

        System.out.println(vacante);

        //Procesamos los datos. guardar en BD
        DbConnection conn = new DbConnection();
        VacanteDao vacanteDao = new VacanteDao(conn);
        boolean status = vacanteDao.insert(vacante);

        //preparamos un mensaje para el usuario
        String msg = "";
        boolean verdadero = false;
        if (status) {
            msg = "La vacante fue generada correctamente ";
            verdadero = true;
        } else {
            msg = "Ocurrio un error. La vacante no fue guardada.";
        }
        conn.disconnect();
        RequestDispatcher rd;
        //compartimos la variable msg para poder acceder desde la vista con Expresion Language
        request.setAttribute("message", msg);
        request.setAttribute("status", verdadero);
        //enviamos respuesta. Renderizamos la vista mensaje.jsp
        rd = request.getRequestDispatcher("/mensaje.jsp");
        rd.forward(request, response);
    }
    protected void editarVacante(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idVacante = Integer.parseInt(request.getParameter("id"));
        String nombreParam = request.getParameter("nombre");        
        String descripcionParam = request.getParameter("descripcion");
        String detalleParam = request.getParameter("detalle");
        
        Vacante vacante= new Vacante(idVacante);
        vacante.setNombre(nombreParam);
        vacante.setDescripcion(descripcionParam);
        vacante.setDetalle(detalleParam);
        
        //Procesamos los datos. guardar en BD
        DbConnection conn = new DbConnection();
        VacanteDao vacanteDao = new VacanteDao(conn);
        boolean status = vacanteDao.editVacante(vacante);
        conn.disconnect();
          
        //preparamos un mensaje para el usuario
        String msg = "";

        if (status) {
            msg = "La vacante fue actualizado ";
        } else {
            msg = "Ocurrio un error. La vacante no pudo actualizarse.";
        }
        RequestDispatcher rd;

        //compartimos la variable msg para poder acceder desde la vista con Expresion Language
        request.setAttribute("message", msg);
        //enviamos respuesta. Renderizamos la vista mensaje.jsp
        rd = request.getRequestDispatcher("/mensaje.jsp");
        rd.forward(request, response);
    }
    
    
}
