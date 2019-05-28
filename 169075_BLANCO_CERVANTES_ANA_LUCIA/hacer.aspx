<%@ Page Title="Qué hacer" Language="C#" AutoEventWireup="true" CodeFile="hacer.aspx.cs" Inherits="hacer" %>

<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="Viaja por el mundo">
    <meta name="author" content="José Trejo">
    <link rel="icon" href="img/favicon.ico">
    <title>Movilidad Académica</title>
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/estilos.css" rel="stylesheet">
    <link href="css/carousel.css" rel="stylesheet">
</head>

    
<!-- NAVBAR
================================================== -->
<body>
        <div class="navbar-wrapper">
        <div class="container">
            <nav class="navbar navbar-inverse navbar-static-top">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="index.aspx">Teyeva</a>
                    </div>
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li class=""><a href="index.aspx">Inicio</a></li>
                            <li class=""><a href="tips.aspx">Tips</a></li>
                            <li class=""><a href="donde.aspx">Donde Ir</a></li>
                            <li class=""><a href="hacer.aspx">Que Hacer</a></li>
                            <li class=""><a href="alumnoLogin.aspx">Conectarse</a></li>
                            <li class=""><a href="adminLogin.aspx">Administradores</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img class="third-slide" src="img/40.jpg" alt="Third slide">
                <div class="container">
                    <div class="carousel-caption">
                        <h1>Qué Hacer</h1>
                        <p>Qué puedes hacer en donde estés.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid cuerpo">
        <div class="row lugares" id="limoncocha">
            <div class="col-md-12 lugares-texto">
                <h1>RESERVAS BIOLÓGICAS</h1>
                <p>FAUNA, FLORA Y ECOTURISMO</p>
            </div>
        </div>
        <div class="row lugares" id="tsachilas">
            <div class="col-md-12 lugares-texto">
                <h1>SANARSE CON LAS<br />COMUNIDADES LOCALES</h1>
                <p>CULTURAL</p>
            </div>
        </div>
        <div class="row lugares" id="hieleros">
            <div class="col-md-12 lugares-texto">
                <h1>RECORRER LAS RUTA<br />Y MONTAÑAS</h1>
                <p>ALPINISMO, RECREACIÓN Y AVENTURA</p>
            </div>
        </div>
        <div class="row lugares" id="encocado">
            <div class="col-md-12 lugares-texto">
                <h1>DISFRUTAR DE<br />LA PLAYA</h1>
                <p>GASTRONOMÍA Y OCIO</p>
            </div>
        </div>
    </div>
<!-- FOOTER -->
    <footer>
        <p class="pull-right"><a href="#">Regresar arriba</a></p>
        <p>&copy; 2019 Teveya.</p>
    </footer>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="js/bootstrap.min.js"></script>
    <!-- Sombrear botón activo del menú -->
    <script>
        var url = window.location;
        // Will only work if string in href matches with location
        $('ul.nav a[href="' + url + '"]').parent().addClass('active');

        // Will also work for relative and absolute hrefs
        $('ul.nav a').filter(function () {
            return this.href == url;
        }).parent().addClass('active');
    </script>
</body>
</html>