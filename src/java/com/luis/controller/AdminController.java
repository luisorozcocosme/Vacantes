package com.luis.controller;

import com.luis.dao.DbConnection;
import com.luis.dao.UsuarioDao;
import com.luis.dao.VacanteDao;
import com.luis.model.Usuario;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        //recuperamos la sesion activa 
        HttpSession session = request.getSession();
        RequestDispatcher rd;
        if (session.getAttribute("usuario") != null) {
            System.out.println(session.getAttribute("usuario"));
            System.out.println(action);
            if (action != null && action.equals("logout")) {
                session.invalidate();
                response.sendRedirect(request.getContextPath() + "/homepage");
            } else {
                DbConnection conn = new DbConnection();
                UsuarioDao usuarioDao = new UsuarioDao(conn);
                

                int cantUsuarios = usuarioDao.countUser();
                VacanteDao vacanteDao = new VacanteDao(conn);
                int cantVacantes = vacanteDao.countVacante();

                conn.disconnect();
                request.setAttribute("cantUsuarios", cantUsuarios);
                request.setAttribute("cantVacantes", cantVacantes);
                rd = request.getRequestDispatcher("/admin.jsp");
                rd.forward(request, response);
            }
            
        } else {
            rd = request.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);
        }

    }

    @Override //login 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Recibimos parametros del formulario de login
        String userParam = request.getParameter("user");
        String passParam = request.getParameter("pass");
        String msg = "";
        //recuperamos una instancia del objeto HttppSession
        HttpSession session = request.getSession();

        DbConnection conn = new DbConnection();
        UsuarioDao usuarioDao = new UsuarioDao(conn);
        //Verificamos en la Bd, si es un usuario correcto.

        Usuario usuario = usuarioDao.login(userParam, passParam);
        int cantUsuarios = usuarioDao.countUser();
        VacanteDao vacanteDao = new VacanteDao(conn);
        int cantVacantes = vacanteDao.countVacante();
        System.out.println(cantVacantes);
        conn.disconnect();

        System.out.println(usuario);
        RequestDispatcher rd;

        if (usuario.getId() > 0) {
            // Creamos una variable de session, con el registro de usuario(Bean)
            // Verificar en el administrador de aplicaciones de tomcat.
            request.setAttribute("cantUsuarios", cantUsuarios);
            request.setAttribute("cantVacantes", cantVacantes);
            session.setAttribute("usuario", usuario);
            rd = request.getRequestDispatcher("/admin.jsp");
            rd.forward(request, response);
        } else {
            msg = "usuario y/o password incorrectos";
            request.setAttribute("message", msg);
            rd = request.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);
        }

    }

}
