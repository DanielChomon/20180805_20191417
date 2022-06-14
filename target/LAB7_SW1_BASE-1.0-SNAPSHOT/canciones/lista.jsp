<%@ page import="Beans.BCancion" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaCanciones" scope="request" type="java.util.ArrayList<Beans.BCancion>"/>
<jsp:useBean id="textoBuscar" scope="request" type="java.lang.String" class="java.lang.String" />
<html>
    <head>
        <title>Lista Canciones</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
              crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <div class="d-flex my-3">
                <a class="h2" href="<%=request.getContextPath()%>/ListaRecomendadosServlet" style="text-decoration: none;">Lista de Cancion</a>

                <a class="btn btn-warning" href="<%=request.getContextPath()%>
                /ListaRecomendadosServlet?a=crear">Mostrar todas las canciones</a>

            </div>
            <hr/>
            <form method="post" action="<%=request.getContextPath()%>/ListaRecomendadosServlet?a=buscar">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Buscar cancion"
                           aria-label="Buscar cancion" aria-describedby="button-addon2"
                           name="textoBuscar" value="<%=textoBuscar%>" />
                    <button class="btn btn-outline-info" type="button" id="button-addon2">Buscar</button>
                </div>
            </form>
            <table class="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Id Cancion</th>
                        <th>Nombre Cancion</th>
                        <th>Nombre Banda</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <% int i = 1;
                        for (BCancion cancion : listaCanciones) { %>
                    <tr>
                        <td><%=i %>
                        </td>
                        <td><%=cancion.getIdCancion() %>
                        </td>
                        <td><%=cancion.getNombreCancion() %>
                        </td>
                        <td><%=cancion.getNombreBanda() %>
                        </td>
                        <td><a href="<%=request.getContextPath()%>/ListaRecomendadosServlet?a=editar&id=<%=cancion.getIdCancion() %>"
                               class="btn btn-primary">Editar</a></td>
                        <td><a href="<%=request.getContextPath()%>/ListaRecomendadosServlet?a=borrar&id=<%=cancion.getIdCancion() %>"
                               class="btn btn-danger">Borrar</a></td>
                    </tr>
                    <% i++;
                    } %>
                </tbody>
            </table>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
                crossorigin="anonymous"></script>
    </body>
</html>
