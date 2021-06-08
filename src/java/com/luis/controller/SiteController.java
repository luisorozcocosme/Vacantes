package com.luis.controller;

import com.luis.dao.DbConnection;
import com.luis.dao.VacanteDao;
import com.luis.model.Vacante;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SiteController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            RequestDispatcher rd;
            DbConnection conn = new DbConnection();
            VacanteDao vacanteDao = new VacanteDao(conn);
            List<Vacante> lista = vacanteDao.getUltimas();
            conn.disconnect();
            request.setAttribute("ultimas", lista);
            rd = request.getRequestDispatcher("/index.jsp");
            rd.forward(request, response);
    }

}
