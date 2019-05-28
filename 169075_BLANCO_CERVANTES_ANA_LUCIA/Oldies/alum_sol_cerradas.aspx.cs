using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class alum_sol_cerradas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lbl_NombreAlumno.Text = Session["ses_nombreCompleto"].ToString();

        TablaSolicitudesAceptadas();
        TablaSolicitudesRechazadas();
    }

    protected void TablaSolicitudesAceptadas()
    {
        String strConexion = System.Configuration.ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString;
        SqlConnection connSQL = new SqlConnection(strConexion);
        connSQL.Open();

        string spSQL = "mv_sp_abcg_solicitud_SELECT";
        SqlCommand cmd = new SqlCommand(spSQL);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@action", SqlDbType.BigInt).Value = 2;
        cmd.Parameters.Add("@solicitud_status", SqlDbType.VarChar).Value = "ACEPTADA";
        cmd.Parameters.Add("@matricula", SqlDbType.VarChar).Value = Session["ses_matricula"].ToString();
        cmd.Connection = connSQL;
        cmd.ExecuteNonQuery();

        DataTable dtConsultaAceptadas = new DataTable();

        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dtConsultaAceptadas);

        if (dtConsultaAceptadas.Rows.Count != 0)
        {
            lbl_Mensaje_sol_aceptadas.Visible = false;
            rpt_sol_aceptadas.DataSource = dtConsultaAceptadas;
            rpt_sol_aceptadas.DataBind();
        }
        else
        {
            lbl_Mensaje_sol_aceptadas.Visible = true;
            lbl_Mensaje_sol_aceptadas.Text = "No hay elementos en la tabla.";
        }

        dtConsultaAceptadas.Clear();
        connSQL.Close();
    }

    protected void TablaSolicitudesRechazadas()
    {
        String strConexion = System.Configuration.ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString;
        SqlConnection connSQL = new SqlConnection(strConexion);
        connSQL.Open();

        string spSQL = "mv_sp_abcg_solicitud_SELECT";
        SqlCommand cmd = new SqlCommand(spSQL);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@action", SqlDbType.BigInt).Value = 2;
        cmd.Parameters.Add("@solicitud_status", SqlDbType.VarChar).Value = "RECHAZADA";
        cmd.Parameters.Add("@matricula", SqlDbType.VarChar).Value = Session["ses_matricula"].ToString();
        cmd.Connection = connSQL;
        cmd.ExecuteNonQuery();

        DataTable dtConsulta = new DataTable();

        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dtConsulta);

        if (dtConsulta.Rows.Count != 0)
        {
            lbl_Mensaje_sol_rechazadas.Visible = false;
            rpt_sol_rechazadas.DataSource = dtConsulta;
            rpt_sol_rechazadas.DataBind();
        }
        else
        {
            lbl_Mensaje_sol_rechazadas.Visible = true;
            lbl_Mensaje_sol_rechazadas.Text = "No hay elementos en la tabla.";
        }

        dtConsulta.Clear();
        connSQL.Close();
    }
}