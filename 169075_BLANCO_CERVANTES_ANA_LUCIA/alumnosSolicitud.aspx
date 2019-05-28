<%@ Page Title="Crear Solicitud de Intercambio" Language="C#" AutoEventWireup="true" CodeFile="alumnosSolicitud.aspx.cs" Inherits="alumnosSolicitud" %>
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
    <form id="form1" runat="server">
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
                            <a class="navbar-brand" href="alumnosIndex.aspx">Teyeva</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li class=""><a href="alumnosIndex.aspx">Inicio</a></li>
                                <li class=""><a href="index.aspx">Cerrar Sesión</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <br /><br /><br /><br />
        <div class="container cuerpo">
            <div class="row contacto">
                <div class="col-md-12">
                    <h1 class="center">Creación de Solicitud de Intercambio</h1><hr/>

                    <div class="form-group col-lg-12">
                        <asp:Label runat="server" Visible="false">Solicitud ID</asp:Label>
                        <asp:TextBox runat="server" Visible="false" ID="txt_solicitud_ID" MaxLength="20" CssClass="form-control" TextMode="Number" placeholder="Ingrese Matrícula" ReadOnly="true"></asp:TextBox>
                    </div>

                    <!-- Universidad -->
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="AllValidators" CssClass="validar"/>
                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" Text="Universidad: "></asp:Label>
                        <asp:TextBox ID="txtuniversidad" runat="server" CssClass="form-control"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ControlToValidate="txtuniversidad" ID="RequiredFieldValidator1" runat="server" ErrorMessage="El nombre de la universidad es requerida" Display="Dynamic" Text="*" ValidationGroup="AllValidators" CssClass="validar"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="El nombre de la universidad solo debe contener letras" Text="El nombre de la universidad solo debe contener letras" Display="Dynamic" ValidationGroup="AllValidators" ControlToValidate="txtuniversidad" ValidationExpression="[A-Za-z ]*" CssClass="validar"></asp:RegularExpressionValidator>
                    </div>

                    <!-- País -->
                    <div class="form-group">
                        <asp:Label ID="Label2" runat="server" Text="País: "></asp:Label>
                        <asp:TextBox ID="txtpais" runat="server" CssClass="form-control"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ControlToValidate="txtpais" ID="RequiredFieldValidator2" runat="server" ErrorMessage="El país de destino es requerido" Display="Dynamic" Text="*" ValidationGroup="AllValidators" CssClass="validar"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="El país destino solo debe contener letras" Text="El país destino solo deben contener letras" Display="Dynamic" ValidationGroup="AllValidators" ControlToValidate="txtpais" ValidationExpression="[A-Za-z ]*" CssClass="validar"></asp:RegularExpressionValidator>
                    </div>

                    <!-- Combo Box Beca -->
                    <div class="form-group col-lg-12">
                        <label>Beca</label>
                        <asp:DropDownList runat="server" ID="ddl_Beca">
                            <asp:ListItem Text="No" Value="No"/>
                            <asp:ListItem Text="Si" Value="Si"/>
                        </asp:DropDownList>
                    </div>

                    <!-- Upload Comprobante -->
                    <div class="form-group col-lg-12">
                        <asp:Label runat="server" ID="lbl_comprobante_ingresos" Text="Comprobante de Ingresos" />
                        <asp:FileUpload runat="server" ID="btn_comprobante_ingresos" />
                    </div>

                    <asp:Button ID="enviar" runat="server" Text="Enviar" cssClass="btn btn-default" ValidationGroup="AllValidators" OnClick="enviar_Click"/>
                </div>
                <asp:Label ID="message" runat="server" Text="Label" CssClass="mensaje"></asp:Label>
            </div>
        </div>
        <br/><br/><br/><br/><br/>
    </form>
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