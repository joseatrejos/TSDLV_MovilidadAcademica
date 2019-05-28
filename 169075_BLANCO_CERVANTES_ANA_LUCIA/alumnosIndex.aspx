<%@ Page Title="Bienvenido a su perfil" Language="C#" AutoEventWireup="true" CodeFile="alumnosIndex.aspx.cs" Inherits="alumnosIndex" %>
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
        <div id="wrapper">
            <br><br><br><br>

            <h2 class="bg-color-nuevas center">Panel de Alumnos</h2>
            <hr/>
            <div class="col-md-12">
                 <asp:Button ID="alta" runat="server" Visible="true" class="center btn btn-default" Text="Nueva Solicitud" onClick="alta_Click"/>
            </div>
            <div id="page-wrapper">
                <div id="page-inner"><br/><br/>
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Advanced Tables -->
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                            <thead>
                                                <tr>
                                                    <th>ID Solicitud</th>
                                                    <th>Universidad</th>
                                                    <th>País</th>
                                                    <th>Estatus</th>
                                                    <th>Beca</th>
                                                    <th>Comprobante</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater runat="server" ID="rpt_alumnos">
                                                    <HeaderTemplate></HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr class="odd gradeX">
                                                            <td><%#DataBinder.Eval(Container.DataItem, "mv_tsdlv_solic_ID") %> </td>
                                                            <td><%#DataBinder.Eval(Container.DataItem, "mv_tsdlv_solic_universidad") %> </td>
                                                            <td><%#DataBinder.Eval(Container.DataItem, "mv_tsdlv_solic_pais") %> </td>
                                                            <td><%#DataBinder.Eval(Container.DataItem, "mv_tsdlv_solic_status") %> </td>
                                                            <td><%#DataBinder.Eval(Container.DataItem, "mv_tsdlv_solic_beca") %> </td>
                                                            <td><%#DataBinder.Eval(Container.DataItem, "mv_tsdlv_solic_comprobante") %> </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate></FooterTemplate>
                                                </asp:Repeater>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
             </div>
         </div>
    </form>
    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
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