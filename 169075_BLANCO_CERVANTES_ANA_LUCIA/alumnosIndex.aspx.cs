using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class alumnosIndex : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ListadoSolicitudes();
    }

    protected void ListadoSolicitudes()
    {
        String strConexion = System.Configuration.ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString;
        SqlConnection connSQL = new SqlConnection(strConexion);
        connSQL.Open();

        string spSQL = "sp_mv_tsdlv_solicitudes_SELECT";
        SqlCommand cmd = new SqlCommand(spSQL);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@action", SqlDbType.TinyInt).Value = 3;
        cmd.Parameters.Add("@mv_tsdlv_solic_ID", SqlDbType.BigInt).Value = 1;
        cmd.Parameters.Add("@mv_tsdlv_alum_ID", SqlDbType.VarChar).Value = Session["ses_matricula"].ToString();
        cmd.Connection = connSQL;
        cmd.ExecuteNonQuery();

        DataTable dtConsulta = new DataTable();

        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dtConsulta);

        if (dtConsulta.Rows.Count != 0)
        {
            rpt_alumnos.DataSource = dtConsulta;
            rpt_alumnos.DataBind();
        }

        cmd.Connection = connSQL;
        cmd.ExecuteNonQuery();
        connSQL.Close();
    }

    protected void alta_Click(object sender, EventArgs e)
    {
        Response.Redirect("alumnosSolicitud.aspx");
    }
}