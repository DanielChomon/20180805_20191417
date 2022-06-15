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
        String idbanda= request.getParameter("idbanda")==null ? "" : request.getParameter("idbanda");
        if(!idbanda.equals("")){
            action="filtrarCanciones";
        }
        CancionesDao cancionesDao= new CancionesDao();
        switch (action){
            case "recomendados":
                request.setAttribute("lista", cancionesDao.listarRecomendados());
                request.setAttribute("tipo", 1);
                request.setAttribute("idFiltro", "");
                break;

            case "listaListas":
                request.setAttribute("lista2", cancionesDao.listarListas());
                request.setAttribute("tipo",1);
                request.setAttribute("idFiltro", "");
                break;

            case "listaCanciones":
                request.setAttribute("lista2", cancionesDao.listarCanciones());
                request.setAttribute("tipo",2);
                request.setAttribute("idFiltro", "");
                break;
            case "filtrarCanciones":
                request.setAttribute("lista", cancionesDao.filtrarPorBandas(idbanda));
                request.setAttribute("tipo",3);
                request.setAttribute("idFiltro", idbanda);
                break;
            case "anadFav":
                String id= request.getParameter("idC");
                cancionesDao.anadirListaFav(id);
                int tipo= Integer.parseInt(request.getParameter("tipo"));
                request.setAttribute("tipo",tipo);
                idbanda=request.getParameter("idFiltro");
                if(tipo==3){
                    request.setAttribute("lista", cancionesDao.filtrarPorBandas(idbanda));
                }else{
                    if(tipo==2){
                        request.setAttribute("lista", cancionesDao.listarCanciones());
                    }
                }
                request.setAttribute("idFiltro", idbanda);
                break;
        }
        RequestDispatcher view =request.getRequestDispatcher("listaRecomendados.jsp");
        view.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
