package Servlets;

import Daos.CancionesDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ListaRecomendadosServlet", value = "/ListaRecomendados")
public class ListaRecomendadosServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CancionesDao cancionesDao= new CancionesDao();
        request.setAttribute("listaRecom", cancionesDao.listarRecomendados());
        RequestDispatcher view =request.getRequestDispatcher("listaRecomendados.jsp");
        view.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
