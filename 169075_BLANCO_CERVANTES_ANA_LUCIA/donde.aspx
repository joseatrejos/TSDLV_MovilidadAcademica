<%@ Page Title="Dónde ir" Language="C#" AutoEventWireup="true" CodeFile="donde.aspx.cs" Inherits="donde" %>

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
                <img class="second-slide" src="img/bgTips.jpg" alt="Second slide">
                <div class="container">
                    <div class="carousel-caption">
                        <h1>Dónde Ir</h1>
                        <p>Lugares qué conocer.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row lugares" id="isabela">
            <div class="col-md-12 lugares-texto">
                <h1>ISABELA<br />ISLAS GALÁPAGOS</h1>
                <p>Isabela se ubica en la porción occidental del archipiélago de Galápagos y junto con su gran vecina Fernandina, es una de las islas más nuevas del archipiélago.</p>
            </div>
        </div>
        <div class="row lugares" id="canoa">
            <div class="col-md-12 lugares-texto">
                <h1>CANOA<br />COSTA DEL PACÍFICO</h1>
                <p>La playa de Canoa es un paraíso de 17 kilómetros de tranquilidad, naturaleza y diversión en la provincia de Manabí. El ecoturismo y las excelentes olas para surfistas son algunas de las principales ofertas de este lugar. Su geografía es propicia para volar en alas delta o parapente, saltando desde el acantilado y volando sobre la playa.</p>
            </div>
        </div>
        <div class="row lugares" id="cochasqui">
            <div class="col-md-12 lugares-texto">
                <h1>COCHASQUÍ<br />ANDES</h1>
                <p>Hacia el norte de la capital Quito, una serie de montañas que forman en nudo Mojanda – Cajas dan lugar al parque arqueológico y de investigación científica Cochasquí. Se trata de un conjunto de pirámides que fueron construidas en el periodo del 850 a.C. hasta el 1550 a.C.</p>
            </div>
        </div>
        <div class="row lugares" id="yasuni">
            <div class="col-md-12 lugares-texto">
                <h1>YASUNÍ<br />AMAZONÍA</h1>
                <p>Yasuní es el área protegida más grande del Ecuador continental y resguarda una impresionante biodiversidad en el corazón del bosque húmedo tropical amazónico.
Además Yasuní protege parte del territorio de la nacionalidad Waorani, los Tagaeri, los Taromenane y otros pueblos indígenas en aislamiento voluntario.</p>
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
