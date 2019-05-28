using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class adm_sol_aceptadas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        TablaSolicitudesAceptadas();
    }

    protected void TablaSolicitudesAceptadas()
    {
        String strConexion = System.Configuration.ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString;
        SqlConnection connSQL = new SqlConnection(strConexion);
        connSQL.Open();

        string spSQL = "mv_sp_abcg_solicitud_SELECT";
        SqlCommand cmd = new SqlCommand(spSQL);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@action", SqlDbType.BigInt).Value = 1;
        cmd.Parameters.Add("@solicitud_status", SqlDbType.VarChar).Value = "ACEPTADA";
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

    protected void adm_sol_aceptadas_modal_rechazar_Click(object sender, EventArgs e)
    {

    }

    protected void adm_sol_aceptadas_modal_boton_aceptar_Click(object sender, EventArgs e)
    {

    }
}