<%@ page import="Beans.Tour" %>
<%@ page import="Beans.BCancion" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean type="java.util.ArrayList<Beans.BCancion>" scope="request" id="listaRecom"/>

<html>
    <jsp:include page="/static/head.jsp">
        <jsp:param name="title" value="Lista de Canciones Recomendadas"/>
    </jsp:include>
    <body>
        <div class='container'>
            <jsp:include page="/includes/navbar.jsp">
                <jsp:param name="page" value="tours"/>
            </jsp:include>
            <div class="pb-5 pt-4 px-3 titlecolor">
                <div class="col-lg-6">
                    <h1 class='text-light'>Lista de Canciones Recomendadas</h1>
                </div>
            </div>
            <div class="tabla">
                <table class="table table-dark table-transparent table-hover">
                    <thead>
                        <th>ID</th>
                        <th>CANCION</th>
                        <th>BANDA</th>
                        <th>VER</th>
                        <th>AGREGAR A FAVORITOS</th>
                    </thead>
                    <%
                        for (BCancion bCancion : listaRecom) {
                    %>
                    <tr>
                        <td><%=bCancion.getIdCancion()%>
                        </td>
                        <td><%=bCancion.getNombreCancion()%>
                        </td>
                        <td><%=bCancion.getNombreBanda()%>
                        </td>
                        <td><button type="button" class="btn btn-success">Más de la Banda</button></td>
                        </td>
                        <td><button type="button" class="btn btn-danger">Agregar Cancion</button></td>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>

        </div>
        <jsp:include page="/static/scripts.jsp"/>
    </body>
</html>
