<%@ Page Language="C#" AutoEventWireup="true" CodeFile="alum_sol_cerradas.aspx.cs" Inherits="alum_sol_cerradas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>AlumnoIndex | Intercambio</title>
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
                padding: 15px 50px 5px 50px;
                float: right;
                font-size: 16px;">
                      <a id="buttonSignOut" href="logInAlumno.aspx">
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
                          <a href="alum_indexAlumno.aspx"><i class="fa fa-unlock fa-3x"></i> Solicitudes en proceso</a>
                      </li>
                        <li>
                          <a class="active-menu" href="#"><i class="fa fa-lock fa-3x"></i> Solicitudes cerradas</a>
                      </li>
                    </ul>
                  </div>
                </nav>
                  <!-- /. NAV SIDE  -->
                  <div id="page-wrapper" >
                    <div id="page-inner">
                      <div class="row">
                        <div class="col-lg-6">
                            <h5>Alumno: <asp:Label runat="server" ID="lbl_NombreAlumno" Text=""></asp:Label></h5>
                          <h2>Solicitudes cerradas</h2>
                      </div>
                    </div>
                      <hr />
                      <div class="row">
                          <div class="col-lg-12">
                              <h4 class="bg-color-aceptadas">Solicitudes aceptadas:</h4>
                          </div>
          
                        <div class="col-md-12">
                          <!-- Advanced Tables -->
                          <div class="panel panel-default">
                            <div class="panel-body">
                              <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="tb_sol_Aceptadas">
                                  <thead>
                                    <tr>
                                      <th>Escuela</th>
                                      <th>Pais</th>
                                      <th>Beca</th>
                                      <th>Comprobante</th>
                                      <th>Fecha de solicitud</th>
                                  </tr>
                                </thead>
                                    <tbody>
                                        <asp:Repeater runat="server" ID="rpt_sol_aceptadas">
                                            <HeaderTemplate></HeaderTemplate>
                                            <ItemTemplate>
                                                <tr class="odd gradeX">
                                                    <td><%#DataBinder.Eval(Container.DataItem, "mvs_escuela") %></td>
                                                    <td><%#DataBinder.Eval(Container.DataItem, "mvs_pais") %></td>
                                                    <td class="center"><%#DataBinder.Eval(Container.DataItem, "mvs_beca") %></td>
                                                    <td class="center">
                                                        <img class="" style="max-width: 100px; max-height: 100px; height: auto; width: auto;" src='comprobantes/<%#DataBinder.Eval(Container.DataItem,"mvs_comprobante_ingresos") %>' alt="">
                                                    </td>
                                                    <td class="center"><%#DataBinder.Eval(Container.DataItem, "mvs_fecha_INS") %></td>
                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate></FooterTemplate>
                                        </asp:Repeater>
                                    </tbody>
                              </table>
                                  <asp:Label runat="server" ID="lbl_Mensaje_sol_aceptadas" Text=""/>
                            </div>
                          </div>
                        </div>
                          <!--End Advanced Tables -->
                      </div>
          
                          <div class="col-lg-12">
                              <h4 class="bg-color-rechazadas">Solicitudes rechazadas:</h4>
                          </div>
                        <div class="col-md-12">
                          <!-- Advanced Tables -->
                          <div class="panel panel-default">
                            <div class="panel-body">
                              <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="tb_sol_Rechazadas">
                                  <thead>
                                    <tr>
                                      <th>Escuela</th>
                                      <th>Pais</th>
                                      <th>Beca</th>
                                      <th>Comprobante</th>
                                      <th>Fecha de solicitud</th>
                                  </tr>
                                </thead>
                                    <tbody>
                                        <asp:Repeater runat="server" ID="rpt_sol_rechazadas">
                                            <HeaderTemplate></HeaderTemplate>
                                            <ItemTemplate>
                                                <tr class="odd gradeX">
                                                    <td><%#DataBinder.Eval(Container.DataItem, "mvs_escuela") %></td>
                                                    <td><%#DataBinder.Eval(Container.DataItem, "mvs_pais") %></td>
                                                    <td class="center"><%#DataBinder.Eval(Container.DataItem, "mvs_beca") %></td>
                                                    <td class="center">
                                                        <img class="" style="max-width: 100px; max-height: 100px; height: auto; width: auto;" src='comprobantes/<%#DataBinder.Eval(Container.DataItem,"mvs_comprobante_ingresos") %>' alt="">
                                                    </td>
                                                    <td class="center"><%#DataBinder.Eval(Container.DataItem, "mvs_fecha_INS") %></td>
                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate></FooterTemplate>
                                        </asp:Repeater>
                                    </tbody>
                              </table>
                                  <asp:Label runat="server" ID="lbl_Mensaje_sol_rechazadas" Text=""/>
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

                  </div>
                </div>
                  <!-- /. PAGE INNER  -->

        </div>

        <!--#include file="scripts.html"-->
    <script>
        $(document).ready(function () {
            $('#tb_sol_Nuevas').dataTable();
        });

        $(document).ready(function () {
            $('#tb_sol_Proceso').dataTable();
        });
    </script>
</body>
</html>
