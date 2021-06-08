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

public class BusquedaController extends HttpServlet {
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String q = request.getParameter("buscar");
        List <Vacante> lista = null;
        DbConnection conn = new DbConnection();
        VacanteDao vacanteDao = new VacanteDao(conn);
        lista = vacanteDao.getByQuery(q);
        conn.disconnect();
        request.setAttribute("vacantes", lista);
        RequestDispatcher rd;

        rd = request.getRequestDispatcher("/vacantes.jsp");
        rd.forward(request, response);
    }

}
