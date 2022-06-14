<%@ page import="Beans.BCancion" %>
<%@ page import="Beans.BLista" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean type="java.util.ArrayList<Beans.BCancion>" scope="request" id="lista"/>
<jsp:useBean type="java.util.ArrayList<Beans.BLista>" scope="request" id="lista2"/>
<jsp:useBean id="tipo" scope="request" type="java.lang.Integer"/>

 <jsp:useBean id="idFiltro" scope="request" type="java.lang.String"/>
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
                            <%if(bCancion.getFav()){%>
                                <td class="text-center"><a type="button" href="<%=request.getContextPath()%>/ListaRecomendados?a=anadFav&idC=<%=bCancion.getIdCancion()%>&tipo=<%=tipo%>&idFiltro=<%=idFiltro%>" title = " Quitar favoritos" class="btn btn-outline-warning btn-floating" data-mdb-ripple-color="dark" style="color:#28a745">
                                    <i class="fas fa-star">💔</i>
                                </a></td>
                                <td class="text-center"><a type="button" href="<%=request.getContextPath()%>/ListaRecomendados?a=anadFav&idC=<%=bCancion.getIdCancion()%>&tipo=<%=tipo%>&idFiltro=<%=idFiltro%>" title = " Agregar a lista" class="btn btn-outline-secondary btn-floating" data-toggle="modal" data-target="#exampleModalCenter" data-mdb-ripple-color="dark" style="color:#28a745">
                                    <i class="fas fa-star"><b>+</b></i>
                                </a></td>
                            <%}else{%>
                                <td class="text-center"><a type="button" href="<%=request.getContextPath()%>/ListaRecomendados?a=anadFav&idC=<%=bCancion.getIdCancion()%>&tipo=<%=tipo%>&idFiltro=<%=idFiltro%>" title = " Agregar a favoritos" class="btn btn-outline-success btn-floating" data-mdb-ripple-color="dark" style="color:#28a745">
                                    <i class="fas fa-star">❤</i>
                                </a></td>
                                <td class="text-center"><a type="button" href="<%=request.getContextPath()%>/ListaRecomendados?a=anadFav&idC=<%=bCancion.getIdCancion()%>&tipo=<%=tipo%>&idFiltro=<%=idFiltro%>" title = " Agregar a lista" class="btn btn-outline-secondary btn-floating" data-toggle="modal" data-target="#exampleModalCenter" data-mdb-ripple-color="dark" style="color:#28a745">
                                    <i class="fas fa-star"><b>+</b></i>
                                </a></td>
                        <%}%>
                        <%}else{%>
                           <%if(tipo==2 || tipo==3){%>
                                <%if(bCancion.getFav()){%>
                                    <td class="text-center"><a type="button" href="<%=request.getContextPath()%>/listaCanciones?a=anadFav&idC=<%=bCancion.getIdCancion()%>&tipo=<%=tipo%>&idFiltro=<%=idFiltro%>" title = " Quitar favoritos" class="btn btn-outline-warning btn-floating" data-mdb-ripple-color="dark" style="color:#28a745">
                                        <i class="fas fa-star">💔</i>
                                    </a></td>
                                    <td class="text-center"><a type="button" href="<%=request.getContextPath()%>/listaCanciones?a=anadFav&idC=<%=bCancion.getIdCancion()%>&tipo=<%=tipo%>&idFiltro=<%=idFiltro%>" title = " Agregar a lista" class="btn btn-outline-secondary btn-floating" data-toggle="modal" data-target="#exampleModalCenter" data-mdb-ripple-color="dark" style="color:#28a745">
                                        <i class="fas fa-star"><b>+</b></i>
                                    </a></td>
                                <%}else{%>
                                    <td class="text-center"><a type="button" href="<%=request.getContextPath()%>/listaCanciones?a=anadFav&idC=<%=bCancion.getIdCancion()%>&tipo=<%=tipo%>&idFiltro=<%=idFiltro%>" title = " Agregar a favoritos" class="btn btn-outline-success btn-floating" data-mdb-ripple-color="dark" style="color:#28a745">
                                        <i class="fas fa-star">❤</i>
                                    </a></td>
                                    <td class="text-center"><a type="button" href="<%=request.getContextPath()%>/listaCanciones?a=anadFav&idC=<%=bCancion.getIdCancion()%>&tipo=<%=tipo%>&idFiltro=<%=idFiltro%>" title = " Agregar a lista" class="btn btn-outline-secondary btn-floating" data-toggle="modal" data-target="#exampleModalCenter" data-mdb-ripple-color="dark" style="color:#28a745">
                                        <i class="fas fa-star"><b>+</b></i>
                                    </a></td>
                                <%}%>
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

<!-- Formulario flotante -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Agregar a lista</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!--MOSTRAR LISTAS CREADAS -->

                <h1 class='text-light'>Listas de Reproducción</h1>

                <div class="tabla">
                    <table class="table table-dark table-transparent table-hover">
                        <%for (BLista bLista : lista2) {%>
                        <tr>
                            <td><%=bLista.getIdNombre()%>
                            </td>
                            <td><button type="button" class="btn btn-success">Agregar</button></td>
                        </tr>
                        <%}%>
                    </table>
                </div>

            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-primary"> Crear nueva lista </button>
            </div>
        </div>
    </div>
</div>
