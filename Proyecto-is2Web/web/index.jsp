<%-- 
    Document   : index
    Created on : 06/10/2016, 06:22:49 PM
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <!-- Inicio CSS -->
        <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Ubuntu" />
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/funciones.js" type="text/javascript"></script>

    <header>
        <nav class="navbar navbar-inverse">
            <div class="container">
                <div class="navbar-header">     
                    <a class="navbar-brand"><img src="img/logo.png" width="90px" height="30 px"/></a>
                </div>
            </div>
        </nav>
    </header>

    <body>
        <div class="container">
            <article>
                <div class="col-md-4">
                    <aside>
                        <form action="" method="post">
                            <fieldset>
                                <legend>Ingrese sus Credenciales:</legend>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">ID</label>
                                    <input type="email" class="form-control" id="codigo" name="email" required>
                                </div>

                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" id="clave" name="password" required>
                                </div>
                                <input type="reset" value="Limpiar" class="btn btn-default">
                                <input value="OK" class="btn btn-warning" onclick="login_admin()">
                            </fieldset>
                        </form>
                    </aside>
                </div>
            </article>
        </div>

    </body>
</html>       