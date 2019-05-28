using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class alumnoLogin : System.Web.UI.Page
{
    DataTable dtConsulta;
    public string sLogin = "";
    public string sPass = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        message.Text = "";
    }

    protected void enviar_Click(object sender, EventArgs e)
    {
        sLogin = txtmatricula.Text;
        sPass = txtcontrasena.Text;

        String strConexion = System.Configuration.ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString;
        SqlConnection connSQL = new SqlConnection(strConexion);
        connSQL.Open();

        string spSQL = "sp_mv_tsdlv_alumno_login";
        SqlCommand cmd = new SqlCommand(spSQL);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@matricula", SqlDbType.VarChar).Value = sLogin;
        cmd.Parameters.Add("@contrasena", SqlDbType.VarChar).Value = sPass;
        cmd.Connection = connSQL;
        cmd.ExecuteNonQuery();

        dtConsulta = new DataTable();

        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dtConsulta);

        if (dtConsulta.Rows.Count != 0)
        {
            Session["ses_matricula"] = dtConsulta.Rows[0].ItemArray[0].ToString();
            Session["ses_nombreCompleto"] = dtConsulta.Rows[0].ItemArray[2].ToString();

            Response.Redirect("alumnosIndex.aspx");

        }
        else
        {
            Session["ses_matricula"] = "";
            Session["ses_nombreCompleto"] = "";

            message.Text = "Matricula y/o contraseña no coinciden.";
        }

        dtConsulta.Clear();

        connSQL.Close();
    }
}