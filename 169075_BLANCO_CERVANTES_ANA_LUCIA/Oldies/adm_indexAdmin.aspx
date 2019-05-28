<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adm_indexAdmin.aspx.cs" Inherits="adm_indexAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Index Administrador | Intercambio</title>
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
    <div style="color: white;
			padding: 15px 30px 15px 30px;
			float: left;
			font-size: 16px;">
      <button runat="server" id="btn_requerimientos" class="btn btn-requirements square-btn-adjust" data-toggle="modal" data-target="#modalRequerimientos">Requerimientos</button>
    </div>
    <div class="modal fade" id="modalRequerimientos" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel"><b>Requerimientos de Proyecto</b></h4>
          </div>
          <div class="modal-body">
            <p>HACER UN SITIO WEB CON BASE DE DATOOOOOOOOOS</p>
            <p>Formato a usar: mv_albc_nombreTabla</p>
            <p>En la siguiente propuesta el cliente está solicitando un sistema para el registro de
              los intercambios o movilidad académica.</p>
            <p> 1. poderse validar como administrador para
              realizar la administración (log in y password, registro de usuarios)
              de los usuarios admin se pide: <br>
              - nickname/usuario (ID) <br>
              - nombre de la persona <br>
              - correo <br>
              - contraseña <br>
              - rol (administrador ó consulta) <br>
              - status <br>
            </p>
            <p> 2. los alumnos que solicitan intercambio de los cuales se pide: <br>
              - matrícula (ID) <br>
              - nombre(s) <br>
              - apellido p <br>
              - apellido m <br>
              - correo <br>
              - dirección (domicilio completo) <br>
              - contraseña <br>
              - status <br>
              - dado de alta por x admin <br>
            </p>
            <p>SOLO EL USUARIO ADMINISTRADOR PUEDE REGISTRAR ALUMNOS</p>
            <p> 3. los alumnos registrados pueden ingresar a realizar solicitudes
              de intercambio. </p>
            <p> 4. registro de la solicitud (hecha por el alumno)
              donde se pide: <br>
              * como alumno solo se puede tener una solicitud status = NUEVA en proceso.
              La solicitud puede ser NUEVA, EN PROCESO, ACEPTADA, RECHAZADA
              Sólo se puede hacer una segunda solicitud si el status es ACEPTADA o RECHAZADA
              Hacer un botón de NUEVA SOLICITUD y abajo del botón que despliegue la lista de
              solicitudes que estan realizadas. <br>
              En el registro se pide: <br>
              - ID de la solicitud <br>
              - ID del alumno <br>
              - Nombre de la escuela a donde se irá <br>
              - Pais a donde se irá <br>
              - Fecha y hora de cuando realizó la solicitud <br>
              - Preguntar si DESEA beca o no: <br>
              En caso de querer beca, pedir lo siguiente: <br>
              - pedir como archivo adjunto: comprobante de ingresos (una imagen) <br>
              - status default: NUEVA <br>
              - fechas y usuarios de cuando se hizo un UPDATE <br>
              * SE TIENE QUE REGISTRAR CUANDO SE CAMBIO DE NUEVO A EN PROCESO, DE EN PROCESO A ACEPTADO O RECHAZADO, ETC.
              PERO SI SE TIENE QUE REGISTRAR CADA CAMBIO QUE PUEDA REALIZARSE Y QUIEN REALIZÓ DICHO CAMBIO. <br>
              * alumno NO puede modificar el registro una vez guardado.</p>
            <p> 5. como ADMIN puedo visualizar y editar las solicitudes NUEVAS, y puede ACEPTAR, RECHAZAR
              o EN PROCESO. <br>
              - En caso de que un alumno pida editar sus datos: solo el ADMIN puede modificarla cuando está NUEVA. <br>
              - Cuando se está en proceso la solicitud YA NO SE PUEDE EDITAR pero se puede cambiar
              solamente a ACEPTAR o RECHAZAR, pero no a nueva. <br>
            </p>
            <p> 6. como ALUMNO puedo ver el cambio de status de mis solicitudes en tiempo real. <br>
              Cada status debe tener un COLOR DIFERENTE <br>
              - ej: verde: aceptada, rojo: rechazada, morado: en proceso, azul oscuro: nueva. <br>
            </p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
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
          <a class="active-menu" href="#"><i class="fa fa-dashboard fa-3x"></i> Dashboard</a>
        </li>
        <li>
          <a href="#"><i class="fa fa-folder-open fa-3x"></i>Solicitudes<span class="fa arrow"></span></a>
          <ul class="nav nav-second-level">
            <li>
              <a href="adm_sol_nuevas.aspx">Nuevas</a>
            </li>
            <li>
              <a href="adm_sol_proceso.aspx">En Proceso</a>
            </li>
            <li>
              <a href="adm_sol_aceptadas.aspx">Aceptadas</a>
            </li>
            <li>
              <a href="adm_sol_rechazadas.aspx">Rechazadas</a>
            </li>
          </ul>
        </li>
        <li >
          <a  href="adm_alumnos.aspx"><i class="fa fa-group fa-3x"></i> Alumnos </a>
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
