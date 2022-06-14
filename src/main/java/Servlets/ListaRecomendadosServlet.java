package Servlets;

import Daos.CancionesDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ListaRecomendadosServlet", value = {"/ListaRecomendados", "/listaCanciones", ""})
public class ListaRecomendadosServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null ? "recomendados" : request.getParameter("a");
        String idbanda= request.getParameter("idbanda")==null ? "nada" : request.getParameter("idbanda");
        if(!idbanda.equals("nada")){
            action="filtrarCanciones";
        }
        CancionesDao cancionesDao= new CancionesDao();
        System.out.println(action);
        switch (action){
            case "recomendados":
                request.setAttribute("lista", cancionesDao.listarRecomendados());
                request.setAttribute("tipo", 1);
                break;
            case "listaCanciones":
                request.setAttribute("lista", cancionesDao.listarCanciones());
                request.setAttribute("tipo",2);
                break;
            case "filtrarCanciones":
                request.setAttribute("lista", cancionesDao.filtrarPorBandas(idbanda));
                request.setAttribute("tipo",3);
                break;
            case "anadFav":
                String id= request.getParameter("idC");
                //cancionesDao.anadirLista(id, "Favoritos");
                request.setAttribute("tipo",3);
                break;
        }
        RequestDispatcher view =request.getRequestDispatcher("listaRecomendados.jsp");
        view.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
