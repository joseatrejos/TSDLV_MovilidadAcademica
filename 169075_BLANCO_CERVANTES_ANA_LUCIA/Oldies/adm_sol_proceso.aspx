<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adm_sol_proceso.aspx.cs" Inherits="adm_sol_proceso" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Administrador Solicitudes Proceso | Intercambio</title>
     <!--#include file="estilos.html"-->
</head>
<body>
<form id="frm_Main" runat="server">
  <div id="wrapper">
  <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="adm_indexAdmin.aspx">Escolar</a>
  </div>
    <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;">
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
          <a href="adm_indexAdmin.aspx"><i class="fa fa-dashboard fa-3x"></i> Dashboard</a>
      </li>
        <li>
          <a class="active-menu" href="#"><i class="fa fa-folder-open fa-3x"></i>Solicitudes<span class="fa arrow"></span></a>
          <ul class="nav nav-second-level">
            <li>
              <a href="adm_sol_nuevas.aspx">Nuevas</a>
          </li>
            <li>
              <a href="#">En Proceso</a>
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
          <h2 class="bg-color-proceso">Solicitudes En Proceso</h2>
      </div>
    </div>
      <!-- /. ROW  -->
      <hr />

      <div class="row">
        <div class="col-md-12">
          <!-- Advanced Tables -->
          <div class="panel panel-default">
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="tb_sol_Nuevas">
                            <thead>
                                <tr>
                                    <th>Solicitante</th>
                                    <th>Escuela</th>
                                    <th>Pais</th>
                                    <th>Beca</th>
                                    <th>Comprobante</th>
                                    <th>Fecha de registro</th>
                                    <th>Usuario INS</th>
                                    <th>Última modificación</th>
                                    <th>Usuario UPD</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater runat="server" ID="rpt_sol_nuevas">
                                    <HeaderTemplate></HeaderTemplate>
                                    <ItemTemplate>
                                        <tr class="odd gradeX">
                                            <td><%#DataBinder.Eval(Container.DataItem, "mvs_matricula") %></td>
                                            <td><%#DataBinder.Eval(Container.DataItem, "mvs_escuela") %></td>
                                            <td><%#DataBinder.Eval(Container.DataItem, "mvs_pais") %></td>
                                            <td class="center"><%#DataBinder.Eval(Container.DataItem, "mvs_beca") %></td>
                                            <td class="center">
                                                <img class="" style="max-width: 100px; max-height: 100px; height: auto; width: auto;" src='comprobantes/<%#DataBinder.Eval(Container.DataItem,"mvs_comprobante_ingresos") %>' alt="">
                                            </td>
                                            <td class="center"><%#DataBinder.Eval(Container.DataItem, "mvs_fecha_INS") %></td>
                                            <td class="center"><%#DataBinder.Eval(Container.DataItem, "mvs_usuario_INS") %></td>
                                            <td class="center"><%#DataBinder.Eval(Container.DataItem, "mvs_fecha_UPD") %></td>
                                            <td class="center"><%#DataBinder.Eval(Container.DataItem, "mvs_usuario_UPD") %></td>
                                            <td class="center">
                                                <a href="#" class="btn btn-statusAceptada" data-toggle="modal" data-target="#cambiarStatus"
                                                    onclick="document.getElementById('txt_solicitud_IDh').value ='<%#DataBinder.Eval(Container.DataItem,"mvs_solicitud_ID") %>';">
                                                    <i class="fa fa-pencil-square-o fa-2x"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate></FooterTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                        <asp:Label runat="server" ID="lbl_Mensaje_sol_nuevas" Text="" />
                    </div>
                </div>
            </div>

          <!--End Advanced Tables -->
      </div>
    </div>

      <!--MODAL STATUS-->
      <div class="modal fade" id="cambiarStatus" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-body">
              <div class="row">
                <div class="col-md-12">
                  <!-- Form Elements -->
                  <div class="panel panel-default">
                    <div class="panel-body">
                      <div class="row">
                        <div class="col-lg-12">
                          <h3>Cambiar Status</h3>
                          
                            <asp:HiddenField runat="server" ID="txt_solicitud_IDh" Value="0"/>
                            <div class="form-group col-lg-12">
                                <label>STATUS</label>
                                <asp:DropDownList runat="server" ID="ddl_Status">
                                    <asp:ListItem Text="EN PROCESO" Value="PROCESO"/>
                                    <asp:ListItem Text="ACEPTAR" Value="ACEPTADA"/>
                                    <asp:ListItem Text="RECHAZAR" Value="RECHAZADA"/>
                                </asp:DropDownList>
                            </div>
                        
                          <!-- /. ROW  -->
                      </div>
                    </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                         <asp:Button runat="server" ID="btn_cambiarStatus" Text="Si, aceptar" CssClass="btn btn-success" OnClick="btn_cambiarStatus_Click"/>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
          
          <!-- End Modals-->
          
          <!-- /. PAGE INNER  -->
      </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
  </div>
</div>
  <!-- /. PAGE INNER  -->
</div>
      <!--#include file="scripts.html"-->
    </form>
    <script>
            $(document).ready(function () {
                $('#dataTables-example').dataTable();
            });
    </script>
</body>
</html>
