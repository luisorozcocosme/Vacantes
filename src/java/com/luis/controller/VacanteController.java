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

public class VacanteController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if (action.equals("ver")) {
            this.verDetalle(request, response);
        }
        if (action.equals("lista")) {
            this.verTodas(request, response);
        }
    }

    protected void verTodas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DbConnection conn = new DbConnection();
        VacanteDao vacanteDao = new VacanteDao(conn);
        List <Vacante> lista = vacanteDao.getAll();
        conn.disconnect();
        request.setAttribute("vacantes", lista);
        RequestDispatcher rd;

        rd = request.getRequestDispatcher("/vacantes.jsp");
        rd.forward(request, response);
    }

    protected void verDetalle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //recibimos el id de la vacante a consultar
        int idVacante = Integer.parseInt(request.getParameter("id"));
        DbConnection conn = new DbConnection();
        VacanteDao vacanteDao = new VacanteDao(conn);
        Vacante vacante = vacanteDao.getById(idVacante);
        conn.disconnect();

        request.setAttribute("vacante", vacante);
        RequestDispatcher rd;

        rd = request.getRequestDispatcher("/detalle.jsp");
        rd.forward(request, response);
    }

}
