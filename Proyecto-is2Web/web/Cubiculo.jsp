

<%@page import="utils.Dao"%>
<%@page import="java.util.List"%>
<%@page import="utils.Cubiculo"%>
<%@page import="utils.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <title>Universidad de Lima</title>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="img/University_of_Lima_logo.png" type="image/x-icon">
        <!-- Inicio CSS -->
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="js/funciones.js" type="text/javascript"></script>
        <script>
            <%
                Cookie[] cookies = null;
                cookies = request.getCookies();
                String idUsuario = "";
                for (int i = 0; i < cookies.length; i++) {
                    System.out.println("cookies: " + cookies[i].getValue() + "-" + cookies[i].getName());
                    if (cookies[i].getName().equals("idusuario")) {
                        idUsuario = cookies[i].getValue();
                        System.out.println("cookie: " + idUsuario);
                    }
                }%>
        </script>
        <!-- Fin CSS -->  
    </head>
    <body>
        <%Dao d = new Dao();%>
        <%List<Cubiculo> cu = d.getTodosCubiculos();%>
        <header>
            <nav class="navbar navbar-inverse">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="inicio.jsp"><img src="img/logo.png" width="90px" height="30 px"/></a>
                    </div>
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li><a href="#index.jsp">Inicio</a></li>
                            <li class="active"><a href="Cubiculo.jsp">Reservas - Cubículos</a></li>
                            <li><a href="PCs.jsp">Reservas - PC</a></li>

                        </ul>
                        <form class="navbar-form navbar-right">
                            <a href="index.jsp"><input value="Cerrar sesión" class="btn btn-danger" ></a>
                        </form>
                    </div><!--/.navbar-collapse -->
                </div>
            </nav>
        </header>

        <div class="container">
            <article>
                <header>
                    <h1>Cubiculos disponibles</h1>
                </header>
                <!-- cuerpo lado izquierdo 
                <div class="col-md-6">
                    <section>
                        <fieldset> 
                            <legend>Reservar cubiculo</legend>
                            <p>
                                Cubiculos
                            </p>
                        </fieldset>
                    </section>
                </div>-->
                <div class="col-md-2">
                </div>
                <!-- cuerpo lado derecho -->
            </article>
        </div>
        <div style="width: 85%" align="center">
            <button onclick="location.reload()" style="float: right">Actualizar</button>
            <table class="table table-hover" style="width: 95%;margin-left: 10%" align="center">
                <thead>
                    <tr>
                        <th>Disponibilidad</th>
                        <th>Piso</th>
                        <th>Capacidad</th>
                        <th>Inicio</th>
                        <th>Fin</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%for (Cubiculo c : cu) {%>
                    <tr><td><%=c.getDisponibilidad()%></td>
                        <td><%=c.getPiso()%></td>
                        <td><%=c.getCapacidad()%></td>
                        <td><%=c.getInicio()%></td>
                        <td><%=c.getFin()%></td>
                        <td><button onclick="reg_cub(<%=c.getId()%>,<%=idUsuario%>)">Reservar</button></td>
                    </tr>

                    <%}%>
                </tbody>
            </table>
        </div>
        <footer class="footer">
            <div class="container">
                <p class="text-muted">&copy; 2016 - Ingeniería de Software II</p>
            </div>
        </footer>

    </body>
</html>

