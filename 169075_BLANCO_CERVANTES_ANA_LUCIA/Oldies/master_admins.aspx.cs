using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class master_admins : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ListadoDeAdmins();
    }

    protected void ListadoDeAdmins()
    {
        String strConexion = System.Configuration.ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString;
        SqlConnection connSQL = new SqlConnection(strConexion);
        connSQL.Open();

        string spSQL = "mv_sp_abcg_usuario_SELECT";
        SqlCommand cmd = new SqlCommand(spSQL);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = connSQL;
        cmd.ExecuteNonQuery();

        DataTable dtConsulta = new DataTable();

        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dtConsulta);

        if (dtConsulta.Rows.Count != 0)
        {
            lbl_Mensaje_Tabla.Visible = false;
            rpt_admins.DataSource = dtConsulta;
            rpt_admins.DataBind();
        }
        else
        {
            lbl_Mensaje_Tabla.Visible = true;
            lbl_Mensaje_Tabla.Text = "No hay elementos en la tabla.";
        }

        dtConsulta.Clear();
        connSQL.Close();
    }

    protected void btn_confirmar_Click(object sender, EventArgs e)
    {
        string sIDh = txt_IDh.Value;
        string sID = txt_ID.Text;
        string sUsername = txt_Usuario.Text;
        string sContrasena = txt_Contrasena.Text;
        string sNombres = txt_Nombres.Text;
        string sApellidoPaterno = txt_Apellido_Paterno.Text;
        string sApellidoMaterno = txt_Apellido_Materno.Text;
        string sRol = ddl_Rol.SelectedValue.ToString();
        string sStatus = ddl_Status.SelectedValue.ToString();
        string sCorreo = txt_Correo.Text;

        String strConexion = System.Configuration.ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString;
        SqlConnection connSQL = new SqlConnection(strConexion);
        connSQL.Open();

        string spSQL = "mv_sp_abcg_usuario_INSERT_UPDATE";
        SqlCommand cmd = new SqlCommand(spSQL);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@usuario_ID", SqlDbType.VarChar).Value          = sIDh;
        cmd.Parameters.Add("@username", SqlDbType.VarChar).Value            = sUsername;
        cmd.Parameters.Add("@nombres", SqlDbType.VarChar).Value             = sNombres;
        cmd.Parameters.Add("@apellido_paterno", SqlDbType.VarChar).Value    = sApellidoPaterno;
        cmd.Parameters.Add("@apellido_materno", SqlDbType.VarChar).Value    = sApellidoMaterno;
        cmd.Parameters.Add("@rol", SqlDbType.VarChar).Value                 = sRol;
        cmd.Parameters.Add("@status", SqlDbType.VarChar).Value              = sStatus;
        cmd.Parameters.Add("@correo", SqlDbType.VarChar).Value              = sCorreo;
        cmd.Parameters.Add("@contrasena", SqlDbType.VarChar).Value          = sContrasena;
        cmd.Parameters.Add("@usuario", SqlDbType.VarChar).Value             = Session["ses_username"].ToString();

        cmd.Connection = connSQL;
        cmd.ExecuteNonQuery();

        Response.Redirect("master_admins.aspx");

        connSQL.Close();
    }

    void reset()
    {
        txt_IDh.Value = "0";
        txt_ID.Text = "0";
        txt_Usuario.Text = " ";
        txt_Contrasena.Text = " ";
        txt_Nombres.Text = " ";
        txt_Apellido_Paterno.Text = " ";
        txt_Apellido_Materno.Text = " ";
        ddl_Rol.SelectedValue = " ";
        ddl_Status.SelectedValue = " ";
        txt_Correo.Text = " ";
    }

    protected void btn_cerrar_Click(object sender, EventArgs e)
    {
        reset();
    }

    protected void rpt_admins_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        // No me borres pls
    }
}