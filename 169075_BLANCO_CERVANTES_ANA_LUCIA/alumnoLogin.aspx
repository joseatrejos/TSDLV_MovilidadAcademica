<%@ Page Title="Login Alumno" Language="C#" AutoEventWireup="true" CodeFile="alumnoLogin.aspx.cs" Inherits="alumnoLogin" %>

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
    <form id="frm_Login_Alumno" runat="server">
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
        <br><br><br><br>
        <h1 class="center">Acceda a su usuario como alumno</h1>
        <hr/>
        <div class="container cuerpo">
            <div class="row contacto">
                <div class="col-12">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="AllValidators" CssClass="validar"/>
                    <!-- Usuario -->
                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" Text="Matrícula: "></asp:Label><asp:TextBox ID="txtmatricula" runat="server" CssClass="form-control"></asp:TextBox><br /><asp:RequiredFieldValidator ControlToValidate="txtmatricula" ID="RequiredFieldValidator6" runat="server" ErrorMessage="La matrícula es requerida" Display="Dynamic" Text="*" ValidationGroup="AllValidators" CssClass="validar"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="La matrícula sólo debe contener números" Text="La matrícula sólo debe contener números" Display="Dynamic" ValidationGroup="AllValidators" ControlToValidate="txtmatricula" ValidationExpression="\d+" CssClass="validar"></asp:RegularExpressionValidator>
                    </div>
                    <!-- Contraseña -->
                    <div class="form-group">
                        <asp:Label ID="Label2" runat="server" Text="Contraseña: "></asp:Label><asp:TextBox ID="txtcontrasena" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox><br /><asp:RequiredFieldValidator ControlToValidate="txtcontrasena" ID="RequiredFieldValidator5" runat="server" ErrorMessage="La contraseña es requerida" Display="Dynamic" Text="*" ValidationGroup="AllValidators" CssClass="validar"></asp:RequiredFieldValidator>
                    </div>
                    <!-- Botón -->
                    <asp:Button ID="enviar" runat="server" Text="Enviar" cssClass="btn btn-default center" ValidationGroup="AllValidators" OnClick="enviar_Click"/>
                </div>
                <asp:Label ID="message" runat="server" Text="Label" CssClass="mensaje"></asp:Label><br />
            </div>
        </div>
    </form>
    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
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
