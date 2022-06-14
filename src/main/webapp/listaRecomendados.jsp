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
        <%if(tipo==2 || tipo==3){%>
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
                <%if(tipo==2 || tipo==3){%>
                    <jsp:include page="/includes/navbar.jsp">
                        <jsp:param name="page" value="canciones"/>
                    </jsp:include>
                <%}%>
            <%}%>
            <div class="pb-5 pt-4 px-3 titlecolor">
                <div class="row">
                    <div class="col-lg-4">
                        <%if(tipo==1){%>
                            <h1 class='text-light'>Lista de Canciones Recomendadas</h1>
                        <%}else{%>
                            <%if(tipo==2 || tipo==3){%>
                                <h1 class='text-light'>Lista de Canciones por Banda</h1>
                            <%}%>
                        <%}%>
                    </div>
                    <%if(tipo==3){%>
                    <div class="col-lg-4 offset-lg-4">
                            <a class="btn btn-warning" href="<%=request.getContextPath()%>/listaCanciones?a=listaCanciones">Mostrar todas las canciones</a>
                    </div>
                    <%}%>
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
                        <%}else{%>
                            <%if(tipo==2 || tipo==3){%>
                                <th></th>
                            <%}%>
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
                        <%}else{%>
                           <%if(tipo==2 || tipo==3){%>
                                <td><a type="button" href="<%=request.getContextPath()%>
                                /listaCanciones?a=anadFav&idC=<%=bCancion.getIdCancion()%>"
                                       class="btn btn-outline-success btn-floating"
                                       data-mdb-ripple-color="dark" style="color:#28a745"><i class="fas fa-star">♥</i>
                                </a></td>
                            <%}%>
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
