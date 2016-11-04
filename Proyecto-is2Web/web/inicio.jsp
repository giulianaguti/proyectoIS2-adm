<%-- 
    Document   : inicio
    Created on : 06/10/2016, 06:23:39 PM
    Author     : CyndiL
--%>

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
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="js/funciones.js" type="text/javascript"></script>
        <!-- Fin CSS -->  
    </head>
    <body onload="getMensajes()">
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
                            <li class="active"><a href="inicio.jsp">Inicio</a></li>
                            <li><a href="Cubiculo.jsp">Reservas - Cubículos</a></li>
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
                    <h1>Bienvenido (a)</h1>
                </header>
                <!-- cuerpo lado izquierdo -->
                <div class="col-md-6">
                    <section>
                        <fieldset> <!-- Agrupa items relacionados -->
                            <legend>Recursos Estudiantiles</legend>
                            <p>
                                Esta app ha sido creada para poder reservar cubículos o pcs de manera simultánea por los alumnos de pregrado.
                            </p>
                        </fieldset>
                        <fieldset> <!-- Agrupa items relacionados -->
                            <legend>Mensajes</legend>
                            <div id="msj"></div>
                        </fieldset>

                    </section>
                </div>
                <div class="col-md-2">
                </div>
                <!-- cuerpo lado derecho -->

            </article>
        </div>

        <footer class="footer">
            <div class="container">
                <p class="text-muted">&copy; 2016 - Ingeniería de Software II</p>
            </div>
        </footer>

    </body>
</html>
