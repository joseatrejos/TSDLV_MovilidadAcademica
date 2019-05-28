<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adm_sol_rechazadas.aspx.cs" Inherits="adm_sol_rechazadas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Administrador Solicitudes Rezhazadas | Intercambio</title>
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
      <a class="navbar-brand" href="indexAdmin.aspx">Escolar</a>
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
              <a href="adm_sol_proceso.aspx">En Proceso</a>
          </li>
            <li>
              <a href="adm_sol_aceptadas.aspx">Aceptadas</a>
          </li>
            <li>
              <a href="#">Rechazadas</a>
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
          <h2 class="bg-color-rechazadas">Solicitudes Rechazadas</h2>
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
        
      <!--MODAL COMPROBANTE INGRESOS --> 
      <div class="modal fade" id="imgComprobante" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-body">
              <div class="row">
                <div class="col-md-12">
                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              </div>
                  <div class="col-md-12">
                    <img class="modal-content" src="assets/img/tiburon.gif" alt="Tiburoncin">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

      <!--MODAL STATUS: ACEPTADA -->
      <div class="modal fade" id="cambiarStatusAceptada" tabindex="-1" role="dialog" aria-hidden="true">
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
                          
                            <div>¿Desea cambiar el status de EN PROCESO a ACEPTADA?</div>
                       
                          <!-- /. ROW  -->
                      </div>
                    </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <asp:Button runat="server" ID="adm_sol_rechazadas_modal_boton_aceptar" Text="Si, aceptar" CssClass="btn btn-success" OnClick="adm_sol_rechazadas_modal_boton_aceptar_Click"/>

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
        
        <!--MODAL STATUS: RECHAZADA -->
      <div class="modal fade" id="cambiarStatusRechazada" tabindex="-1" role="dialog" aria-hidden="true">
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
                          
                            <div>¿Desea cambiar el status de EN PROCESO a RECHAZADA?</div>
                    
                          <!-- /. ROW  -->
                      </div>
                    </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <asp:Button runat="server" ID="adm_sol_rechazadas_modal_rechazar" Text="Si, rechazar" CssClass="btn btn-danger" OnClick="adm_sol_rechazadas_modal_rechazar_Click"/>
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
     </form>
       <!--#include file="scripts.html"-->
    <script>
            $(document).ready(function () {
                $('#dataTables-example').dataTable();
            });
    </script>
</body>
</html>
