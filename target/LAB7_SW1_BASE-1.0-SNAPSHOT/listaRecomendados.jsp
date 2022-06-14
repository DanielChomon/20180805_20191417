<%@ page import="Beans.BCancion" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean type="java.util.ArrayList<Beans.BCancion>" scope="request" id="lista"/>
<jsp:useBean id="tipo" scope="request" type="java.lang.Integer"/>
<html>
    <%if(tipo==1){%>
        <jsp:include page="/static/head.jsp">
            <jsp:param name="title" value="Lista de Canciones Recomendadas"/>
        </jsp:include>
    <%}else{%>
        <%if(tipo==2){%>
            <jsp:include page="/static/head.jsp">
                <jsp:param name="title" value="Lista de Canciones por Banda"/>
            </jsp:include>
        <%}%>
    <%}%>
    <body>
        <div class='container'>
            <%if(tipo==1){%>
            <jsp:include page="/includes/navbar.jsp">
                <jsp:param name="page" value="recomendados"/>
            </jsp:include>
            <%}else{%>
                <%if(tipo==2){%>
                    <jsp:include page="/includes/navbar.jsp">
                        <jsp:param name="page" value="canciones"/>
                    </jsp:include>
                <%}%>
            <%}%>
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
                        <%if(tipo==1){%>
                            <th>VER</th>
                        <%}%>
                    </thead>
                    <%
                        for (BCancion bCancion : lista) {
                    %>
                    <tr>
                        <td><%=bCancion.getIdCancion()%>
                        </td>
                        <td><%=bCancion.getNombreCancion()%>
                        </td>
                        <td><%=bCancion.getNombreBanda()%>
                        </td>
                        <%if(tipo==1){%>
                            <td><button type="button" class="btn btn-success">Más de la Banda</button></td>
                        <%}%>
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