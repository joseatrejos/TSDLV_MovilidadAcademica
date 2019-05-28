﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="master_admins.aspx.cs" Inherits="master_admins" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Master Admins | Intercambio</title>
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
                <a class="navbar-brand" href="master_indexMaster.aspx">Escolar</a>
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
                        <a href="master_indexMaster.aspx"><i class="fa fa-dashboard fa-3x"></i>Dashboard</a>
                    </li>
                    <li>
                        <a class="active-menu" href="#"><i class="fa fa-user fa-3x"></i>Administradores </a>
                    </li>
                    <li>
                        <a href="master_alumnos.aspx"><i class="fa fa-group fa-3x"></i>Alumnos </a>
                    </li>
                </ul>
            </div>
        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper">
            <div id="page-inner">
                <div class="row">
                    <div class="col-lg-6">
                        <h2 class="bg-color-nuevas">Administradores</h2>
                    </div>
                    <div class="col-lg-6">
                        <a href="#" class="btn btn-add" data-toggle="modal" data-target="#crearAdmin">
                            <i class="fa fa-plus"></i>REGISTRAR ADMINISTRADOR 
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
                                                <th>ID</th>
                                                <th>Usuario</th>
                                                <th>Nombre Completo</th>
                                                <th>Correo</th>
                                                <th>Rol</th>
                                                <th>Status</th>
                                                <th>Fecha de registro</th>
                                                <th>Última modificación</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater runat="server" ID="rpt_admins" OnItemCommand="rpt_admins_ItemCommand">
                                                <HeaderTemplate></HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr class="odd gradeX">
                                                        <td><%#DataBinder.Eval(Container.DataItem, "mvu_usuario_ID") %></td>
                                                        <td><%#DataBinder.Eval(Container.DataItem, "mvu_username") %></td>
                                                        <td><%#DataBinder.Eval(Container.DataItem, "mvu_nombres") %> <%#DataBinder.Eval(Container.DataItem, "mvu_apellido_paterno") %> <%#DataBinder.Eval(Container.DataItem, "mvu_apellido_materno") %></td>
                                                        <td><%#DataBinder.Eval(Container.DataItem, "mvu_correo") %></td>
                                                        <td class="center"><%#DataBinder.Eval(Container.DataItem, "mvu_rol") %></td>
                                                        <td class="center"><%#DataBinder.Eval(Container.DataItem, "mvu_status") %></td>
                                                        <td class="center"><%#DataBinder.Eval(Container.DataItem, "mvu_fecha_INS") %></td>
                                                        <td class="center"><%#DataBinder.Eval(Container.DataItem, "mvu_fecha_UPD") %></td>
                                                        <td class="center">
                                                            <a href="#" class="btn btn-edit" data-toggle="modal" data-target="#crearAdmin"
                                                                onclick="
                                                                                        document.getElementById('txt_IDh').value                ='<%#DataBinder.Eval(Container.DataItem,"mvu_usuario_ID") %>';
                                                                                        document.getElementById('txt_ID').value                 ='<%#DataBinder.Eval(Container.DataItem,"mvu_usuario_ID") %>';
                                                                                        document.getElementById('txt_Usuario').value            ='<%#DataBinder.Eval(Container.DataItem,"mvu_username") %>';
                                                                                        document.getElementById('txt_Nombres').value            ='<%#DataBinder.Eval(Container.DataItem,"mvu_nombres") %>';
                                                                                        document.getElementById('txt_Apellido_Paterno').value   ='<%#DataBinder.Eval(Container.DataItem,"mvu_apellido_paterno") %>';
                                                                                        document.getElementById('txt_Apellido_Materno').value   ='<%#DataBinder.Eval(Container.DataItem,"mvu_apellido_materno") %>';
                                                                                        document.getElementById('ddl_Rol').value                ='<%#DataBinder.Eval(Container.DataItem,"mvu_rol") %>';
                                                                                        document.getElementById('ddl_Status').value             ='<%#DataBinder.Eval(Container.DataItem,"mvu_status") %>';
                                                                                        document.getElementById('txt_Correo').value             ='<%#DataBinder.Eval(Container.DataItem,"mvu_correo") %>';
                                                                                        document.getElementById('txt_Contrasena').value         ='<%#DataBinder.Eval(Container.DataItem,"mvu_contrasena") %>';
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
                                    <asp:Label runat="server" ID="lbl_Mensaje_Tabla" Text="" CssClass=""/>
                                </div>
                            </div>
                        </div>
                        <!--End Advanced Tables -->
                    </div>
                </div>

                <!--MODAL REGISTRAR ALUMNO -->
                <form id="frm_registro_alumno" runat="server">
                <div class="modal fade" id="crearAdmin" tabindex="-1" role="dialog" aria-hidden="true">
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
                                                        <h3>Registrar administrador</h3>
                                                        <form role="form">
                                                            <br>
                                                            <div class="row">
                                                                <asp:HiddenField runat="server" ID="txt_IDh" Value="0"/>
                                                                <div class="form-group col-lg-2">
                                                                    <label>ID</label>
                                                                    <asp:TextBox runat="server" ID="txt_ID" MaxLength="50" CssClass="form-control" placeholder="Ingrese usuario" required="required" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group col-lg-4">
                                                                    <label>Usuario</label>
                                                                    <asp:TextBox runat="server" ID="txt_Usuario" MaxLength="50" CssClass="form-control" placeholder="Ingrese usuario" required="required"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group col-lg-6">
                                                                    <label>Nombre(s)</label>
                                                                    <asp:TextBox runat="server" ID="txt_Nombres" MaxLength="50" CssClass="form-control" placeholder="Ingrese nombre(s)" required="required"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group col-lg-6">
                                                                    <label>Apellido Paterno</label>
                                                                    <asp:TextBox runat="server" ID="txt_Apellido_Paterno" MaxLength="50" CssClass="form-control" placeholder="Ingrese apellido paterno" required="required"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group col-lg-6">
                                                                    <label>Apellido Materno</label>
                                                                    <asp:TextBox runat="server" ID="txt_Apellido_Materno" MaxLength="50" CssClass="form-control" placeholder="Ingrese apellido materno"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group col-lg-6">
                                                                    <label>Correo</label>
                                                                    <asp:TextBox runat="server" ID="txt_Correo" MaxLength="150" TextMode="Email" CssClass="form-control" placeholder="Ingrese correo" required="required"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group col-lg-6">
                                                                    <label>Contraseña</label>
                                                                    <asp:TextBox runat="server" ID="txt_Contrasena" MaxLength="50" CssClass="form-control" placeholder="Ingrese contraseña" required="required"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group col-lg-6">
                                                                    <label>Rol</label><br>
                                                                    <asp:DropDownList runat="server" ID="ddl_Rol">
                                                                        <asp:ListItem Text="Administrador" Value="administrador"/>
                                                                        <asp:ListItem Text="Consulta" Value="consulta"/>
                                                                    </asp:DropDownList>     
                                                                </div>
                                                                <div class="form-group col-lg-6">
                                                                    <label>Status</label><br>
                                                                    <asp:DropDownList runat="server" ID="ddl_Status">
                                                                        <asp:ListItem Text="ACTIVO" Value="ACTIVO"/>
                                                                        <asp:ListItem Text="INACTIVO" Value="INACTIVO"/>
                                                                    </asp:DropDownList>     
                                                                </div>
                                                                <div class="form-group">
                                                                    <asp:Label runat="server" ID="lbl_Mensaje" Text="" CssClass="text-danger" />
                                                                </div>
                                                            </div>
                                                         </form>
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

                        <!-- End Modals-->

                        <!-- /. PAGE INNER  -->
                    </div>
                    <!-- /. PAGE WRAPPER  -->
                </div>

                </form>
            </div>
        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->
    <!-- /. WRAPPER  -->
    <!--#include file="scripts.html"-->
</body>
</html>
