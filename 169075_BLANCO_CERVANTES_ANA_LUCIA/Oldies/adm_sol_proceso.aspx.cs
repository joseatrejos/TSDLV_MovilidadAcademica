using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class adm_sol_proceso : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        TablaSolicitudesProceso();
    }

    protected void TablaSolicitudesProceso()
    {
        String strConexion = System.Configuration.ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString;
        SqlConnection connSQL = new SqlConnection(strConexion);
        connSQL.Open();

        string spSQL = "mv_sp_abcg_solicitud_SELECT";
        SqlCommand cmd = new SqlCommand(spSQL);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@action", SqlDbType.BigInt).Value = 1;
        cmd.Parameters.Add("@solicitud_status", SqlDbType.VarChar).Value = "PROCESO";
        cmd.Connection = connSQL;
        cmd.ExecuteNonQuery();

        DataTable dtConsulta = new DataTable();

        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dtConsulta);

        if (dtConsulta.Rows.Count != 0)
        {
            lbl_Mensaje_sol_nuevas.Visible = false;
            rpt_sol_nuevas.DataSource = dtConsulta;
            rpt_sol_nuevas.DataBind();
        }
        else
        {
            lbl_Mensaje_sol_nuevas.Visible = true;
            lbl_Mensaje_sol_nuevas.Text = "No hay elementos en la tabla.";
        }

        dtConsulta.Clear();
        connSQL.Close();
    }

    protected void btn_cambiarStatus_Click(object sender, EventArgs e)
    {
        string sSolicitudID = txt_solicitud_IDh.Value;
        string sStatus = ddl_Status.SelectedValue.ToString();

        String strConexion2 = System.Configuration.ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString;
        SqlConnection connSQL2 = new SqlConnection(strConexion2);
        connSQL2.Open();

        string spSQL2 = "mv_sp_abcg_solicitud_UPDATE_STATUS";
        SqlCommand cmd2 = new SqlCommand(spSQL2);
        cmd2.CommandType = CommandType.StoredProcedure;
        cmd2.Parameters.Add("@action", SqlDbType.TinyInt).Value = 2;
        cmd2.Parameters.Add("@cambio_status", SqlDbType.VarChar).Value = sStatus;
        cmd2.Parameters.Add("@solicitud_ID", SqlDbType.VarChar).Value = sSolicitudID;
        cmd2.Parameters.Add("@usuario", SqlDbType.VarChar).Value = Session["ses_username"].ToString();

        cmd2.Connection = connSQL2;
        cmd2.ExecuteNonQuery();
        connSQL2.Close();

        Response.Redirect("adm_sol_proceso.aspx");
    }
}