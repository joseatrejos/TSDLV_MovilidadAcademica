<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminRegistrar.aspx.cs" Inherits="adminRegistrar" %>


<!DOCTYPE html>
<html lang="es">
    <head runat="server">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Viaja por el mundo">
        <meta name="author" content="José Trejo">
        <link rel="icon" href="img/favicon.ico">
        <title>Movilidad Académica</title>
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/estilos.css" rel="stylesheet">
        <link href="css/carousel.css" rel="stylesheet">
    </head>

    <!-- NAVBAR -->
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
                                <a class="navbar-brand" href="adminsIndex.aspx">Teyeva</a>
                            </div>
                            <div id="navbar" class="navbar-collapse collapse">
                                <ul class="nav navbar-nav">
                                    <li class=""><a href="adminsIndex.aspx">Inicio</a></li>
                                    <li class=""><a href="adminEditarContenido.aspx">Editar Contenido</a></li>
                                    <li class=""><a href="adminRegistrar.aspx">Registrar Usuario</a></li>
                                    <li class=""><a href="index.aspx">Cerrar Sesión</a></li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
    <br><br><br><br>
    <h1 class="center">Alta de Usuarios</h1>
    <hr/>

    <!-- Combo Box Tipo Usuario -->
     <div class="row">
         <div class="form col-md-4">

         </div>
         <div class="form col-md-4">
             <label>Tipo de Usuario</label>
                 <asp:DropDownList runat="server" ID="ddl_user">
                      <asp:ListItem Text="Alumno" Value="No"/>
                      <asp:ListItem Text="Administrador" Value="Si"/>
             </asp:DropDownList>
         </div>
         <div class="form col-md-4">

         </div>
     </div>

    <!-- Nombre de Usuario -->
    <div class="form col-md-12">
        <asp:Label runat="server" Visible="true">Nombre de Usuario</asp:Label>
        <asp:TextBox runat="server" Visible="true" ID="txt_username" MaxLength="50" CssClass="form-control" placeholder="Ingrese su nombre de usuario" ReadOnly="false"></asp:TextBox>
    </div>
            
    <!-- Nombre -->
    <div class="form col-md-12">
        <asp:Label runat="server" Visible="true">Nombre</asp:Label>
        <asp:TextBox runat="server" Visible="true" ID="txt_nombre" MaxLength="50" CssClass="form-control" placeholder="Ingrese Nombre(s)" ReadOnly="false"></asp:TextBox>
    </div>

    <!-- Apellido Paterno -->
    <div class="form col-md-12">
        <asp:Label runat="server" Visible="true">Apellido Paterno</asp:Label>
        <asp:TextBox runat="server" Visible="true" ID="txt_apellidoP" MaxLength="50" CssClass="form-control" placeholder="Ingrese Apellido Paterno" ReadOnly="false"></asp:TextBox>
    </div>

    <!-- Apellido Materno -->
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="AllValidators" CssClass="validar"/>
        <div class="form-group">
            <asp:Label ID="Label1" runat="server" Text="Apellido Materno: "></asp:Label>
            <asp:TextBox ID="txt_apellidoM" runat="server" CssClass="form-control" placeholder="Ingrese Apellido Materno"></asp:TextBox><br />
        </div>

     <!-- Correo -->
      <div class="form-group">
           <asp:Label ID="Label2" runat="server" Text="Correo: "></asp:Label>
               <asp:TextBox ID="txt_correo" runat="server" CssClass="form-control" placeholder="Ingrese Correo"></asp:TextBox><br />
      </div>

     <!-- Dirección -->
      <div class="form-group">
           <asp:Label ID="Label3" runat="server" Text="Dirección: "></asp:Label>
               <asp:TextBox ID="txt_direccion" runat="server" CssClass="form-control" placeholder="Ingrese Dirección"></asp:TextBox><br />
      </div>

     <!-- Contraseña -->
      <div class="form-group">
           <asp:Label ID="Label4" runat="server" Text="Contraseña: "></asp:Label>
               <asp:TextBox ID="txt_contra" runat="server" CssClass="form-control" TextMode="Password" placeholder="Ingrese Contraseña"></asp:TextBox><br />
               <asp:RequiredFieldValidator ControlToValidate="txt_contra" ID="RequiredFieldValidator3" runat="server" ErrorMessage="La contraseña es requerida" Display="Dynamic" Text="*" ValidationGroup="AllValidators" CssClass="validar"></asp:RequiredFieldValidator>
      </div>

      <!-- Estatus -->
      <div class="form-group">
           <asp:Label ID="Label5" runat="server" Text="Estado: "></asp:Label>
               <asp:TextBox ID="txt_status" runat="server" CssClass="form-control" placeholder="Ingrese Estatus"></asp:TextBox><br />
               
      </div>

    <asp:Button ID="enviar" runat="server" Text="Enviar" cssClass="btn btn-default" ValidationGroup="AllValidators" OnClick="enviar_Click" />
    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
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