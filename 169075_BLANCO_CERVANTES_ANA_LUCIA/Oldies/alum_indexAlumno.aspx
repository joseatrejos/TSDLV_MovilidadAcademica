<%@ Page Language="C#" AutoEventWireup="true" CodeFile="alum_indexAlumno.aspx.cs" Inherits="alum_indexAlumno" %>

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
                          <a class="active-menu" href="#"><i class="fa fa-unlock fa-3x"></i> Solicitudes en proceso</a>
                      </li>
                        <li>
                          <a href="alum_sol_cerradas.aspx"><i class="fa fa-lock fa-3x"></i> Solicitudes cerradas</a>
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
                          <h2>Solicitudes en proceso</h2>
                      </div>
                          <div class="col-lg-6">
                          <a runat="server" id="btn_crearSolicitud" href="#" class="btn btn-add" data-toggle="modal" data-target="#crearSolicitud">
                            <i class="fa fa-plus"></i> SOLICITUD NUEVA 
                        </a>
                      </div>
                    </div>
                      <!-- /. ROW  -->
                      <hr />
                      <div class="row">
                          <div class="col-lg-12">
                              <h4 class="bg-color-nuevas">Tus solicitudes nuevas:</h4>
                          </div>
          
                        <div class="col-md-12">
                          <!-- Advanced Tables -->
                          <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover" id="tb_sol_Nuevas">
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
                                            <asp:Repeater runat="server" ID="rpt_sol_nuevas">
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
                                    <asp:Label runat="server" ID="lbl_Mensaje_sol_nuevas" Text=""/>
                                </div>
                            </div>
                        </div>
                          <!--End Advanced Tables -->
                      </div>
          
                          <div class="col-lg-12">
                              <h4 class="bg-color-proceso">Tus solicitudes en proceso:</h4>
                          </div>
                        <div class="col-md-12">
                          <!-- Advanced Tables -->
                          <div class="panel panel-default">
                            <div class="panel-body">
                              <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="tb_sol_Proceso">
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
                                        <asp:Repeater runat="server" ID="rpt_sol_proceso">
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
                                  <asp:Label runat="server" ID="lbl_Mensaje_sol_proceso" Text=""/>
                              </div>
                          </div>
                        </div>
                          <!--End Advanced Tables -->
                      </div>
        
                    </div>
                  <form id="frm_boton_guardar" runat="server">
                    <!--MODAL REGISTRAR SOLICITUD -->
                      <div class="modal fade" id="crearSolicitud" tabindex="-1" role="dialog" aria-hidden="true">
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
                                                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                              <h3>Registro Solicitud</h3>
                                                              <form role="form">
                                                                  <br>

                                                                  <div class="row">
                                                                      <div class="form-group col-lg-12">
                                                                          <label>Escuela</label>
                                                                          <asp:TextBox runat="server" ID="txt_Ingrsar_Escuela" MaxLength="20" CssClass="form-control" placeholder="Ingrese Escuela" required="required"></asp:TextBox>

                                                                      </div>
                                                                      <div class="form-group col-lg-12">
                                                                          <label>Pais</label>
                                                                          <asp:TextBox runat="server" ID="txt_Ingresar_Pais" MaxLength="20" CssClass="form-control" placeholder="Ingrese Pais" required="required"></asp:TextBox>
                                                                      </div>

                                                                      <div class="form-group col-lg-12">
                                                                          <label>Beca</label>
                                                                          <div class="radio">
                                                                              <label>
                                                                                  <asp:RadioButton runat="server" ID="rad_beca_si" GroupName="rad_beca" Text="Si" />
                                                                              </label>
                                                                          </div>
                                                                          <div class="radio">
                                                                              <label>
                                                                                  <asp:RadioButton runat="server" ID="rad_beca_no" GroupName="rad_beca" Text="No" Checked />
                                                                              </label>
                                                                          </div>
                                                                      </div>

                                                                      <div class="form-group col-lg-12">
                                                                          <asp:Label runat="server" ID="lbl_comprobante_ingresos" Text="Comprobante de Ingresos" />
                                                                          <asp:FileUpload runat="server" ID="btn_comprobante_ingresos" />
                                                                      </div>
                                                                  </div>

                                                              </form>
                                                              <!-- /. ROW  -->
                                                          </div>
                                                      </div>
                                                      <div class="modal-footer">
                                                          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                                          <asp:Button runat="server" ID="btn_Guardar" Text="Guardar" CssClass="btn btn-primary" OnClick="btn_Guardar_Click" />

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
                    </form>
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
      
                      <!--MODAL EDITAR -->
                      <div class="modal fade" id="editarSolicitud" tabindex="-1" role="dialog" aria-hidden="true">
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
                                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                          <h3>Editar Solicitud</h3>
                                          <form role="form">
                                            <br>
                                            <div class="row">
                                            <div class="form-group col-lg-4">
                                                <label>ID</label>
                                                <input class="form-control" placeholder="ID" />
                                            </div>
                                              <div class="form-group col-lg-8">
                                                <label>Matricula del alumno</label>
                                                <input class="form-control" placeholder="Ingrese Matricula" />
                                            </div>
                                              <div class="form-group col-lg-12">
                                                <label>Escuela</label>
                                                <input class="form-control" placeholder="Ingrese Escuela" />
                                            </div>
                                              <div class="form-group col-lg-12">
                                                <label>Pais</label>
                                                <input class="form-control" placeholder="Ingrese Pais" />
                                            </div>
                                              <div class="form-group col-lg-12">
                                                <label>Beca</label>
                                                <div class="radio">
                                                  <label>
                                                    <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked />
                                                    Si </label>
                                              </div>
                                                <div class="radio">
                                                  <label>
                                                    <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2"/>
                                                    No </label>
                                              </div>
                                            </div>
                                              <div class="form-group col-lg-12">
                                                <label>Comprobante de Ingresos</label>
                                                <input type="file" />
                                            </div>
                                          </div>
                                        </form>
                                          <!-- /. ROW  -->
                                      </div>
                                    </div>
                                      <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                        <button type="button" class="btn btn-primary">Guardar</button>
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

                      <!--MODAL STATUS -->
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
                                          <form role="form">
                                            <div>¿Desea cambiar el status de NUEVA a EN PROCESO?</div>
                                        </form>
                                          <!-- /. ROW  -->
                                      </div>
                                    </div>
                                      <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                        <button type="button" class="btn btn-primary">Si, cambiar</button>
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
