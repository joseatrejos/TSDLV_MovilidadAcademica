using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class adminRegistrar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void enviar_Click(object sender, EventArgs e)
    {
        string sUsername = txt_username.Text;
        string sNombre = txt_nombre.Text;
        string sApellidoP = txt_apellidoP.Text;
        string sApellidoM = txt_apellidoM.Text;
        string sCorreo = txt_correo.Text;
        string sDireccion = txt_correo.Text;
        string sContra = txt_contra.Text;
        string sStatus = txt_status.Text;
        string sNombreCompleto = sNombre + " " + sApellidoP + " " + sApellidoM;

        String strConexion = System.Configuration.ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString;
        SqlConnection connSQL = new SqlConnection(strConexion);
        connSQL.Open();
        if(ddl_user.SelectedValue == "No")
        {
            string spSQL = "sp_mv_tsdlv_alumnos_INSUPD";
            SqlCommand cmd = new SqlCommand(spSQL);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@mv_tsdlv_alum_ID", SqlDbType.VarChar).Value = 0;
            cmd.Parameters.Add("@mv_tsdlv_alum_nombres", SqlDbType.VarChar).Value = sNombre;
            cmd.Parameters.Add("@mv_tsdlv_alum_apellidoPaterno", SqlDbType.VarChar).Value = sApellidoP;
            cmd.Parameters.Add("@mv_tsdlv_alum_apellidoMaterno", SqlDbType.VarChar).Value = sApellidoM;
            cmd.Parameters.Add("@mv_tsdlv_alum_correo", SqlDbType.VarChar).Value = sCorreo;
            cmd.Parameters.Add("@mv_tsdlv_alum_direccion", SqlDbType.VarChar).Value = sDireccion;
            cmd.Parameters.Add("@mv_tsdlv_alum_contrasena", SqlDbType.VarChar).Value = sContra;
            cmd.Parameters.Add("@mv_tsdlv_alum_statusAlumno", SqlDbType.VarChar).Value = sStatus;
            cmd.Parameters.Add("@user", SqlDbType.VarChar).Value = Session["ses_usuario"].ToString();

            cmd.Connection = connSQL;
            cmd.ExecuteNonQuery();
            connSQL.Close();

            Response.Redirect("adminRegistrar.aspx");
        }
        else if(ddl_user.SelectedValue == "Si")
        {
            string spSQL = "sp_mv_tsdlv_admin_INSUPD";
            SqlCommand cmd = new SqlCommand(spSQL);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@mv_tsdlv_admin_ID", SqlDbType.VarChar).Value = 0;
            cmd.Parameters.Add("@mv_tsdlv_admin_username", SqlDbType.VarChar).Value = sUsername;
            cmd.Parameters.Add("@mv_tsdlv_admin_nombre", SqlDbType.VarChar).Value = sNombreCompleto;
            cmd.Parameters.Add("@mv_tsdlv_admin_correo", SqlDbType.VarChar).Value = sCorreo;
            cmd.Parameters.Add("@mv_tsdlv_admin_contrasena", SqlDbType.VarChar).Value = sContra;
            cmd.Parameters.Add("@mv_tsdlv_admin_status", SqlDbType.VarChar).Value = sStatus;
            cmd.Parameters.Add("@user", SqlDbType.VarChar).Value = Session["ses_usuario"].ToString();

            cmd.Connection = connSQL;
            cmd.ExecuteNonQuery();
            connSQL.Close();

            Response.Redirect("adminRegistrar.aspx");
        }
    }
}