<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

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
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
            <li data-target="#myCarousel" data-slide-to="3"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img class="first-slide" src="img/bgFeel.jpg" alt="First slide">
                <div class="container">
                    <div class="carousel-caption">
                        <h1>Tips para el Viajero</h1>
                        <p>Tips para disfrutar tu intercambio académico.</p>
                        <p><a class="btn btn-lg btn-primary" href="tips.aspx" role="button">Entérate Ahora</a></p>
                    </div>
                </div>
            </div>
            <div class="item">
                <img class="second-slide" src="img/bgTips.jpg" alt="Second slide">
                <div class="container">
                    <div class="carousel-caption">
                        <h1>Dónde Ir</h1>
                        <p>Lugares qué conocer.</p>
                        <p><a class="btn btn-lg btn-primary" href="donde.aspx" role="button">Entérate Ahora</a></p>
                    </div>
                </div>
            </div>
            <div class="item">
                <img class="third-slide" src="img/40.jpg" alt="Third slide">
                <div class="container">
                    <div class="carousel-caption">
                        <h1>Qué Hacer</h1>
                        <p>Qué puedes hacer de intercambio.</p>
                        <p><a class="btn btn-lg btn-primary" href="hacer.aspx" role="button">Entérate Ahora</a></p>
                    </div>
                </div>
            </div>
            <div class="item">
                <img class="second-slide" src="img/solicitud.jpg" alt="Fourth slide">
                <div class="container">
                    <div class="carousel-caption">
                        <h1>Abrir Solicitud</h1>
                        <p>Comienza tus trámites para solicitar un intercambio.</p>
                        <p><a class="btn btn-lg btn-primary" href="alumnoLogin.aspx" role="button">Dar de Alta</a></p>
                    </div>
                </div>
            </div>
        </div>
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <br/><br/><br/>
    <div class="container marketing">
        <div class="row">
            <div class="col-lg-4">
                <img class="img-circle" src="img/Guayaquil-300x300.jpg" alt="tips" width="140" height="140">
                <h2>Tips para el turista</h2>
                <p>Todo lo que necesitas saber sobre cómo disfrutar tu estancia fuera.</p>
                <p><a class="btn btn-default" href="tips.aspx" role="button">Ver detalles &raquo;</a></p>
            </div><!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <img class="img-circle" src="img/BasilicaNeogoticoQuito.jpg" alt="Generic placeholder image" width="140" height="140">
                <h2>Dónde Ir</h2>
                <p>Explora el mundo. Conoce todas las maravillas del lugar al que vayas.</p>
                <p><a class="btn btn-default" href="donde.aspx" role="button">Ver detalles &raquo;</a></p>
            </div><!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <img class="img-circle" src="img/presentacion-oficial.jpg" alt="Generic placeholder image" width="140" height="140">
                <h2>Qué Hacer</h2>
                <p>Conoce todo lo que puedes hacer en tu nuevo hogar. Diversión, negocios o descanso.</p>
                <p><a class="btn btn-default" href="hacer.aspx" role="button">Ver detalles &raquo;</a></p>
            </div><!-- /.col-lg-4 -->
        </div><!-- /.row -->
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