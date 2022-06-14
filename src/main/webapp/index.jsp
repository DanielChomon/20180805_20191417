<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <!--Colocar como value: nombre de la presente página -->
    <jsp:include page="/static/head.jsp">
        <jsp:param name="title" value="Bienvenido"/>
    </jsp:include>
    <body>
        <div class='container'>
            <!--Colocar como value: artistas, canciones, bandas, tours o tpc  (dependiendo de la pagina a la que corresponda) -->
            <jsp:include page="/includes/navbar.jsp">
                <jsp:param name="page" value=""/>
            </jsp:include>
            <div class="pb-5 pt-4 px-3 titlecolor d-flex justify-content-between align-items-center">
                <div class="col-lg-6">
                    <h1 class='text-light'>Bienvenido, este es un ejemplo de tabla:</h1>
                </div>
            </div>
            <div class="tabla">
                <table class="table table-dark table-transparent table-hover">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>NOMBRE</th>
                            <th>ROL</th>
                            <th>CORREO</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>1
                            </td>
                            <td>Stuardo Lucho
                            </td>
                            <td>Profesor
                            </td>
                            <td>stuardo.lucho@pucp.edu.pe
                            </td>
                        </tr>

                        <tr>
                            <td>2
                            </td>
                            <td>Oscar Diaz
                            </td>
                            <td>JP
                            </td>
                            <td>diaz.oa@pucp.edu.pe
                            </td>
                        </tr>

                        <tr>
                            <td>3
                            </td>
                            <td>Mario Gustavo
                            </td>
                            <td>JP
                            </td>
                            <td>a2015@pucp.edu.pe
                            </td>
                        </tr>

                        <tr>
                            <td>4
                            </td>
                            <td>Rodrigo Adauto
                            </td>
                            <td>JP
                            </td>
                            <td>a20160679@pucp.edu.pe
                            </td>
                        </tr>
                        <tr>
                            <td>4
                            </td>
                            <td>Álvaro Burga
                            </td>
                            <td>JP
                            </td>
                            <td>a20160679@pucp.edu.pe
                            </td>
                        </tr>
                        <tr>
                            <td>4
                            </td>
                            <td>Josué López
                            </td>
                            <td>JP
                            </td>
                            <td>a20160679@pucp.edu.pe
                            </td>
                        </tr>
                        <tr>
                            <td>4
                            </td>
                            <td> Alejandro Macedo
                            </td>
                            <td>JP
                            </td>
                            <td>a20160679@pucp.edu.pe
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </div>
        <jsp:include page="/static/scripts.jsp"/>
    </body>
</html>
