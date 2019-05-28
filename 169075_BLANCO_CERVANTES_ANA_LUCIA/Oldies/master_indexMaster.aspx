<%@ Page Language="C#" AutoEventWireup="true" CodeFile="master_indexMaster.aspx.cs" Inherits="master_indexMaster" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Index Master | Intercambio</title>
    <!--#include file="estilos.html"-->
</head>
<body>
   <div id="wrapper">
  <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Escolar</a>
    </div>
    <div style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;">
      <a id="buttonSignOut" href="index.aspx">
        <i class="fa fa-power-off fa-2x"></i>
      </a>
    </div>
  </nav>
  <!-- /. NAV TOP  -->
  <nav class="navbar-default navbar-side" role="navigation">
    <div class="sidebar-collapse">
      <ul class="nav" id="main-menu">
        <li class="text-center">
          <img alt="" src="assets/img/find_user.png" class="user-image img-responsive"/>
        </li>
        <li>
          <a class="active-menu"  href="#"><i class="fa fa-dashboard fa-3x"></i> Dashboard</a>
        </li>
          <li >
          <a  href="master_admins.aspx"><i class="fa fa-user fa-3x"></i> Administradores </a>
        </li>
        <li >
          <a  href="master_alumnos.aspx"><i class="fa fa-group fa-3x"></i> Alumnos </a>
        </li>
      </ul>
    </div>
  </nav>
  <!-- /. NAV SIDE  -->
  <div id="page-wrapper" >
    <div id="page-inner">
      <div class="row">
        <div class="col-md-12">
          <h2>Admin Dashboard</h2>
          <h5>Bienvenido <asp:Label runat="server" ID="lbl_NombreUsuario" Text=""></asp:Label>, te quiero. </h5>
        </div>
      </div>
      <!-- /. ROW  -->
      <hr />
      <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
          <h3>Solicitudes</h3>
          <br>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-6">
          <div class="panel panel-back noti-box">
            <span class="icon-box bg-color-blue set-icon">
            <i class="fa fa-envelope-o"></i>
            </span>
            <div class="text-box" >
              <p class="main-text">
                  <asp:Label runat="server" ID="master_sol_nuevas" Text="" Visible="true"></asp:Label>    
              </p>
              <p class="text-muted"></p>
            </div>
          </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-6">
          <div class="panel panel-back noti-box">
            <span class="icon-box bg-color-yellow set-icon">
            <i class="fa fa-spinner"></i>
            </span>
            <div class="text-box" >
              <p class="main-text">
                  <asp:Label runat="server" ID="master_sol_proceso" Text="" Visible="true"></asp:Label>    
              </p>
              <p class="text-muted"></p>
            </div>
          </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-6">
          <div class="panel panel-back noti-box">
            <span class="icon-box bg-color-green set-icon">
            <i class="fa fa-thumbs-o-up"></i>
            </span>
            <div class="text-box" >
              <p class="main-text">
                  <asp:Label runat="server" ID="master_sol_aceptadas" Text="" Visible="true"></asp:Label>    
              </p>
              <p class="text-muted"></p>
            </div>
          </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-6">
          <div class="panel panel-back noti-box">
            <span class="icon-box bg-color-red set-icon">
            <i class="fa fa-thumbs-o-down"></i>
            </span>
            <div class="text-box" >
              <p class="main-text">
                  <asp:Label runat="server" ID="master_sol_rechazadas" Text="" Visible="true"></asp:Label>    
              </p>
              <p class="text-muted"></p>
            </div>
          </div>
        </div>
      </div>
      <!-- /. ROW  -->
      <hr />
      <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
          <h3>Alumnos</h3>
          <br>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-6">
          <div class="panel panel-back noti-box">
            <span class="icon-box bg-color-blue set-icon">
            <i class="fa fa-user"></i>
            </span>
            <div class="text-box" >
                <p class="main-text">
                  <asp:Label runat="server" ID="master_alum_inscritos" Text="" Visible="true"></asp:Label>    
                </p>
              <p class="text-muted"></p>
            </div>
          </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-6">
          <div class="panel panel-back noti-box">
            <span class="icon-box bg-color-yellow set-icon">
            <i class="fa fa-spinner"></i>
            </span>
            <div class="text-box" >
                <p class="main-text">
                  <asp:Label runat="server" ID="master_alum_espera" Text="" Visible="true"></asp:Label>    
                </p>
              <p class="text-muted"></p>
            </div>
          </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-6">
          <div class="panel panel-back noti-box">
            <span class="icon-box bg-color-green set-icon">
            <i class="fa fa-thumbs-o-up"></i>
            </span>
            <div class="text-box" >
                <p class="main-text">
                  <asp:Label runat="server" ID="master_alum_aceptados" Text="" Visible="true"></asp:Label>    
                </p>
              <p class="text-muted"></p>
            </div>
          </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-6">
          <div class="panel panel-back noti-box">
            <span class="icon-box bg-color-red set-icon">
            <i class="fa fa-thumbs-o-down"></i>
            </span>
            <div class="text-box" >
                <p class="main-text">
                  <asp:Label runat="server" ID="master_alum_rechazados" Text="" Visible="true"></asp:Label>    
                </p>
              <p class="text-muted"></p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- /. PAGE INNER  -->
  </div>
  <!-- /. PAGE WRAPPER  -->
</div>
<!--#include file="scripts.html"-->
</body>
</html>
