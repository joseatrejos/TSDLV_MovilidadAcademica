<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adm_alumnos.aspx.cs" Inherits="adm_alumnos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Alumno | Intercambio</title>
    <!--#include file="estilos.html"-->
</head>
<body>
    <form runat="server">
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
                        <img alt="" src="assets/img/find_user.png" class="user-image img-responsive" />
                    </li>
                    <li>
                        <a href="adm_indexAdmin.aspx"><i class="fa fa-dashboard fa-3x"></i>Dashboard</a>
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
                    <li>
                        <a class="active-menu" href="#"><i class="fa fa-group fa-3x"></i>Alumnos </a>
                    </li>
                </ul>
            </div>
        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper">
            <div id="page-inner">
                <div class="row">
                    <div class="col-lg-6">
                        <h2 class="bg-color-nuevas">Alumnos</h2>
                    </div>
                    <div class="col-lg-6">
                        <a runat="server" id="btn_crearAlumno" href="#" class="btn btn-add" data-toggle="modal" data-target="#crearAlumno">
                            <i class="fa fa-plus"></i>REGISTRAR ALUMNO 
                        </a>
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
                                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>Matrícula</th>
                                                <th>Nombre Completo</th>
                                                <th>Correo</th>
                                                <th>Domicilio</th>
                                                <th>Status</th>
                                                <th>Fecha de registro</th>
                                                <th>Usuario INS</th>
                                                <th>Última modificación</th>
                                                <th>Usuario UPD</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater runat="server" ID="rpt_alumnos">
                                                <HeaderTemplate></HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr class="odd gradeX">
                                                        <td><%#DataBinder.Eval(Container.DataItem, "mva_matricula") %> </td>
                                                        <td><%#DataBinder.Eval(Container.DataItem, "mva_nombres") %> <%#DataBinder.Eval(Container.DataItem, "mva_apellido_paterno") %> <%#DataBinder.Eval(Container.DataItem, "mva_apellido_materno") %></td>
                                                        <td><%#DataBinder.Eval(Container.DataItem, "mva_correo") %> </td>
                                                        <td><%#DataBinder.Eval(Container.DataItem, "mva_domicilio") %> </td>
                                                        <td><%#DataBinder.Eval(Container.DataItem, "mva_status") %> </td>
                                                        <td><%#DataBinder.Eval(Container.DataItem, "mva_fecha_INS") %> </td>
                                                        <td><%#DataBinder.Eval(Container.DataItem, "mva_usuario_INS") %> </td>
                                                        <td><%#DataBinder.Eval(Container.DataItem, "mva_fecha_UPD") %> </td>
                                                        <td><%#DataBinder.Eval(Container.DataItem, "mva_usuario_UPD") %> </td>
                                                        <td>
                                                            <a href="#" class="btn btn-edit" data-toggle="modal" data-target="#crearAlumno"
                                                                 onclick="
                                                                                        document.getElementById('txt_Matricula').value          ='<%#DataBinder.Eval(Container.DataItem,"mva_matricula") %>';
                                                                                        document.getElementById('txt_Matricula_h').value        ='<%#DataBinder.Eval(Container.DataItem,"mva_matricula") %>';
                                                                                        document.getElementById('txt_Nombres').value            ='<%#DataBinder.Eval(Container.DataItem,"mva_nombres") %>';
                                                                                        document.getElementById('txt_Apellido_Paterno').value   ='<%#DataBinder.Eval(Container.DataItem,"mva_apellido_paterno") %>';
                                                                                        document.getElementById('txt_Apellido_Materno').value   ='<%#DataBinder.Eval(Container.DataItem,"mva_apellido_materno") %>';
                                                                                        document.getElementById('txt_Domicilio').value          ='<%#DataBinder.Eval(Container.DataItem,"mva_domicilio") %>';
                                                                                        document.getElementById('txt_Correo').value             ='<%#DataBinder.Eval(Container.DataItem,"mva_correo") %>';
                                                                                        document.getElementById('txt_Contrasena').value         ='<%#DataBinder.Eval(Container.DataItem,"mva_contrasena") %>';
                                                                                        document.getElementById('ddl_Status').value             ='<%#DataBinder.Eval(Container.DataItem,"mva_status") %>';
                                                                                    ">
                                                                <i class="fa fa-pencil-square-o fa-2x"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate></FooterTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </table>
                                    <asp:Label runat="server" ID="lbl_Mensaje_Tabla" Text="" CssClass="" />
                                </div>
                            </div>
                        </div>
                        <!--End Advanced Tables -->
                    </div>
                </div>

                <!--MODAL REGISTRAR ALUMNO -->
                <div class="modal fade" id="crearAlumno" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
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
                                                        <h3>Registro de Alumno</h3>
                                                            <br/>
                                                            <div class="row">
                                                                <div class="form-group col-lg-3">
                                                                    <label>Matricula</label>
                                                                    <asp:TextBox runat="server" ID="txt_Matricula" MaxLength="50" CssClass="form-control" placeholder="" ReadOnly="true"></asp:TextBox>
                                                                    <asp:HiddenField runat="server" ID="txt_Matricula_h"></asp:HiddenField>
                                                                </div>
                                                                <div class="form-group col-lg-9">
                                                                    <label>Nombre(s)</label>
                                                                    <asp:TextBox runat="server" ID="txt_Nombres" MaxLength="150" CssClass="form-control" placeholder="Ingrese nombre(s)" required="required"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group col-lg-6">
                                                                    <label>Apellido Paterno</label>
                                                                    <asp:TextBox runat="server" ID="txt_Apellido_Paterno" MaxLength="50" CssClass="form-control" placeholder="Ingrese apellido paterno" required="required"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group col-lg-6">
                                                                    <label>Apellido Materno</label>
                                                                    <asp:TextBox runat="server" ID="txt_Apellido_Materno" MaxLength="50" CssClass="form-control" placeholder="Ingrese apellido materno"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group col-lg-12">
                                                                    <label>Domicilio</label>
                                                                    <asp:TextBox runat="server" ID="txt_Domicilio" MaxLength="150" CssClass="form-control" placeholder="Ingrese domicilio" required="required"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group col-lg-6">
                                                                    <label>Correo</label>
                                                                    <asp:TextBox runat="server" ID="txt_Correo" MaxLength="150" TextMode="Email" CssClass="form-control" placeholder="Ingrese correo" required="required"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group col-lg-6">
                                                                    <label>Contraseña</label>
                                                                    <asp:TextBox runat="server" ID="txt_Contrasena" MaxLength="150" CssClass="form-control" placeholder="Ingrese contraseña" required="required"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group col-lg-6">
                                                                    <label>Status</label><br>
                                                                    <asp:DropDownList runat="server" ID="ddl_Status">
                                                                        <asp:ListItem Text="ACTIVO" Value="ACTIVO"/>
                                                                        <asp:ListItem Text="INACTIVO" Value="INACTIVO"/>
                                                                    </asp:DropDownList>     
                                                                </div>
                                                            </div>
                                                        <!-- /. ROW  -->
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <asp:button runat="server" ID="btn_cerrar" Text="Cerrar" class="btn btn-default" data-dismiss="modal" OnClick="btn_cerrar_Click"/>
                                                    <asp:button runat="server" ID="btn_confirmar" Text="Confirmar" class="btn btn-primary" OnClick="btn_confirmar_Click"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>



    <!--#include file="scripts.html"-->
    <script>
        $(document).ready(function () {
            $('#dataTables-example').dataTable();
        });
    </script>
        </form>
</body>
</html>
