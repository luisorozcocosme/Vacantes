package com.luis.controller;

import com.luis.dao.DbConnection;
import com.luis.dao.UsuarioDao;
import com.luis.model.Usuario;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserAdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session= request.getSession();
        RequestDispatcher rd;
        if (session.getAttribute("usuario") != null) {
            System.out.println(request.getParameter("action"));
            if (request.getParameter("buscar") != null) {
                this.buscarUsuario(request, response);
            }else if (request.getParameter("action")!= null) {
                String action = request.getParameter("action");
                if (action.equals("editar")) {
                    this.mostrar(request, response);
                }
                if (action.equals("eliminar")) {
                    this.eliminarUsuario(request, response);
                }
            } else  {

                DbConnection conn = new DbConnection();
                UsuarioDao usuarioDao = new UsuarioDao(conn);
                List<Usuario> lista = usuarioDao.getAll();
                conn.disconnect();
                request.setAttribute("usuarios", lista);
                rd = request.getRequestDispatcher("/usuariosAdmin.jsp");
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
        
            if (request.getParameter("editPassword") != null) {
                this.editarContraseña(request, response);       
            }else if (request.getParameter("editUsuario") != null) {
                this.editarUsuario(request, response);
            }else if (request.getParameter("crearUsuario") != null) {
                this.crear(request, response);
            }else{
                System.out.println("enviado al get");
                this.doGet(request, response);
            }  
        }else{
            rd = request.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);
        }
    }
    
    protected void mostrar(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int idUsuario = Integer.parseInt(request.getParameter("id"));
        DbConnection conn = new DbConnection();
        UsuarioDao usuarioDao = new UsuarioDao(conn);
        Usuario usuario = usuarioDao.getById(idUsuario);
        conn.disconnect();
        
        System.out.println(usuario);
        request.setAttribute("usuario", usuario);
        RequestDispatcher rd;

        rd = request.getRequestDispatcher("/usuarioEdit.jsp");
        rd.forward(request, response);
    }
    protected void editarContraseña(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int idUsuario = Integer.parseInt(request.getParameter("id"));
        String passUsuario =request.getParameter("password");
        DbConnection conn = new DbConnection();
        UsuarioDao usuarioDao = new UsuarioDao(conn);
        boolean status = usuarioDao.editPassword(idUsuario,passUsuario);
        conn.disconnect();
          
        //preparamos un mensaje para el usuario
        String msg = "";

        if (status) {
            msg = "La contraseña fue cambiada ";

        } else {
            msg = "Ocurrio un error. La contraseña no fue cambiada.";
        }
        RequestDispatcher rd;

        //compartimos la variable msg para poder acceder desde la vista con Expresion Language
        request.setAttribute("message", msg);
        //enviamos respuesta. Renderizamos la vista mensaje.jsp
        rd = request.getRequestDispatcher("/mensaje.jsp");
        rd.forward(request, response);
    }
    protected void editarUsuario(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int idUsuario = Integer.parseInt(request.getParameter("id"));
        String nombreParam = request.getParameter("nombre");        
        String emailParam = request.getParameter("email");
        String usernameParam = request.getParameter("username");
        String perfilParam = request.getParameter("perfil");
        String estatusParam = request.getParameter("estatus");
        
        Usuario usuario= new Usuario(idUsuario);
        usuario.setNombre(nombreParam);
        usuario.setEmail(emailParam);
        usuario.setUsername(usernameParam);
        usuario.setEstatus(estatusParam);
        usuario.setPerfil(perfilParam);
        //Procesamos los datos. guardar en BD
        DbConnection conn = new DbConnection();
        UsuarioDao usuarioDao = new UsuarioDao(conn);
        boolean status = usuarioDao.editUser(usuario);
        conn.disconnect();
          
        //preparamos un mensaje para el usuario
        String msg = "";

        if (status) {
            msg = "El usuario fue actualizado ";
        } else {
            msg = "Ocurrio un error. El usuario no pudo actualizarse.";
        }
        RequestDispatcher rd;

        //compartimos la variable msg para poder acceder desde la vista con Expresion Language
        request.setAttribute("message", msg);
        //enviamos respuesta. Renderizamos la vista mensaje.jsp
        rd = request.getRequestDispatcher("/mensaje.jsp");
        rd.forward(request, response);
    }
    protected void crear(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String nombreParam = request.getParameter("nombre");        
        String emailParam = request.getParameter("email");
        String usernameParam = request.getParameter("username");
        String passwordParam = request.getParameter("password");
        String perfilParam = request.getParameter("perfil");
            
        Usuario usuario= new Usuario(0);
        usuario.setNombre(nombreParam);
        usuario.setEmail(emailParam);
        usuario.setUsername(usernameParam);
        usuario.setPassword(passwordParam);
        usuario.setPerfil(perfilParam);

        System.out.println(usuario);

        //Procesamos los datos. guardar en BD
        DbConnection conn = new DbConnection();
        UsuarioDao usuarioDao = new UsuarioDao(conn);
        boolean status = usuarioDao.insert(usuario);
        
        //preparamos un mensaje para el usuario
        String msg = "";

        if (status) {
            msg = "El usuario fue generado correctamente ";
        } else {
            msg = "Ocurrio un error. El usuario no fue guardado.";
        }
        conn.disconnect();
        RequestDispatcher rd;
        //compartimos la variable msg para poder acceder desde la vista con Expresion Language
        request.setAttribute("message", msg);
        //enviamos respuesta. Renderizamos la vista mensaje.jsp
        rd = request.getRequestDispatcher("/mensaje.jsp");
        rd.forward(request, response);
    }
    protected void buscarUsuario(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String q = request.getParameter("buscar");
        List <Usuario> lista = null;
        DbConnection conn = new DbConnection();
        UsuarioDao usuarioDao = new UsuarioDao(conn);
        lista = usuarioDao.getByQuery(q);
        conn.disconnect();
        request.setAttribute("usuarios", lista);
        RequestDispatcher rd;
        rd = request.getRequestDispatcher("/usuariosAdmin.jsp");
        rd.forward(request, response);
    }
    protected void eliminarUsuario(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int idUsuario = Integer.parseInt(request.getParameter("id"));
        
        //Procesamos los datos. guardar en BD
        DbConnection conn = new DbConnection();
        UsuarioDao usuarioDao = new UsuarioDao(conn);
        boolean status = usuarioDao.delete(idUsuario);
        
        //preparamos un mensaje para el usuario
        String msg = "";

        if (status) {
            msg = "El usuario fue eliminado correctamente ";
        } else {
            msg = "Ocurrio un error. El usuario no fue eliminado.";
        }
        conn.disconnect();
        RequestDispatcher rd;
        //compartimos la variable msg para poder acceder desde la vista con Expresion Language
        request.setAttribute("message", msg);
        //enviamos respuesta. Renderizamos la vista mensaje.jsp
        rd = request.getRequestDispatcher("/mensaje.jsp");
        rd.forward(request, response);
    }
}
