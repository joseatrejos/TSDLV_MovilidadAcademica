<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Admin Log In | Intercambio</title>
</head>

<body>
    <nav class="navbar navbar-default navbar-cls-top">
        <div class="container-fluid">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a class="btn-cambiar-login" href="logInAlumno.aspx">Inicio Sesion Alumno</a>
                </li>
            </ul>   
        </div>
    </nav>

	<form id="frm_Main" runat="server">
		<div class="login-form">
			<h2 class="text-center">Inicio de Administrador</h2> 
			<p>Usuario</p>
			<div class="form-group">
				<asp:TextBox runat="server" ID="txt_Usuario" MaxLength="50" CssClass="form-control" placeholder="usuario" required="required"></asp:TextBox>
			</div>
			<p>Contraseña</p>
			<div class="form-group">
				<asp:TextBox runat="server" ID="txt_Contrasena" MaxLength="50" TextMode="Password" CssClass="form-control" placeholder="contraseña" required="required"></asp:TextBox>
			</div>
			<div class="form-group">
				<asp:Button runat="server" ID="btn_Acceder" Text="acceder" CssClass="btn btn-primary btn-block" OnClick="btn_Acceder_Click"/>
			</div>
            <div class="form-group">
				<asp:Label runat="server" ID="lbl_Mensaje" Text="" CssClass="text-danger"/>
			</div>
		</div>
	</form>

    <!--#include file="estilos.html"-->
    <!--#include file="scripts.html"-->
</body>
</html>
