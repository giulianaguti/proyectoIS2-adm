<%-- 
    Document   : PCs
    Created on : 06/10/2016, 06:15:12 PM
    Author     : CyndiL
--%>

<%@page import="utils.PC"%>
<%@page import="utils.Dao"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Ubuntu" />
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/styles.css" />
        <script src="js/jquery-3.1.0.min.js" type="text/javascript"></script>
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
        <%List<PC> p = d.getPCs();%>
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
                            <li ><a href="inicio.jsp">Inicio</a></li>
                            <li><a href="Cubiculo.jsp">Reservas - Cubículos</a></li>
                            <li class="active"><a href="PCs.jsp">Reservas - PC</a></li>
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
                    <h1>Reservar PCs</h1>
                </header>
                <!-- cuerpo lado izquierdo 
                <div class="col-md-6">
                    <section>
                        <fieldset>
                            <legend>Reservar PC</legend>
                            <p>
                                PCs
                            </p>
                        </fieldset>
                    </section>
                </div>-->
                <div class="col-md-2">
                </div>
                <!-- cuerpo lado derecho -->
            </article>
            <button onclick="location.reload()" style="float: right">Actualizar</button>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Disponibilidad</th>
                        <th>Ubicación</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%for (PC c : p) {%>
                    <tr>
                        <td><%=c.getDispo()%></td>
                        <td><%=c.getUbicacion()%></td>
                        <td><button onclick="reg_pc(<%=c.getId()%>,<%=idUsuario%>)">Reservar</button></td>
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
