using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class adm_sol_nuevas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ses_rol"].ToString() == "consulta")
        {
            btn_crearSolicitud.Visible = false;
        }
        else
        {
            btn_crearSolicitud.Visible = true;
        }

        TablaSolicitudesNuevas();
    }

    protected void TablaSolicitudesNuevas()
    {
        String strConexion = System.Configuration.ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString;
        SqlConnection connSQL = new SqlConnection(strConexion);
        connSQL.Open();

        string spSQL = "mv_sp_abcg_solicitud_SELECT";
        SqlCommand cmd = new SqlCommand(spSQL);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@action", SqlDbType.BigInt).Value = 1;
        cmd.Parameters.Add("@solicitud_status", SqlDbType.VarChar).Value = "NUEVA";
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

        ValidaPermisos();
    }

    void ValidaPermisos()
    {
        // :v
    }
    protected void btn_Guardar_Click(object sender, EventArgs e)
    {
        string sSolicitudID = txt_solicitud_IDh.Value;
        string sMatricula = txt_Ingrsar_Matricula.Text;
        string sEscuela = txt_Ingrsar_Escuela.Text;
        string sPais = txt_Ingresar_Pais.Text;
        string sBeca = ddl_Beca.SelectedValue.ToString();
        string sStatus = ddl_Status.SelectedValue.ToString();

        string sFileA = "";
        string sFileExtA;

        String strConexion = System.Configuration.ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString;
        SqlConnection connSQL = new SqlConnection(strConexion);
        connSQL.Open();

        if (btn_comprobante_ingresos.HasFile)
        {
            sFileA = DateTime.Now.ToString("MM_dd_yyyy_hh_mm_ss") + "_" + Session["ses_username"].ToString();
            sFileExtA = System.IO.Path.GetExtension(btn_comprobante_ingresos.FileName).ToString();
            sFileA = sFileA + sFileExtA;
            btn_comprobante_ingresos.PostedFile.SaveAs(Server.MapPath("comprobantes/") + sFileA);
        }

        string spSQL = "mv_sp_abcg_solicitud_INSERT_UPDATE";
        SqlCommand cmd = new SqlCommand(spSQL);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@solicitud_ID", SqlDbType.Int).Value = sSolicitudID;
        cmd.Parameters.Add("@matricula", SqlDbType.VarChar).Value = sMatricula;
        cmd.Parameters.Add("@escuela", SqlDbType.VarChar).Value = sEscuela;
        cmd.Parameters.Add("@pais", SqlDbType.VarChar).Value = sPais;
        cmd.Parameters.Add("@beca", SqlDbType.BigInt).Value = sBeca;
        cmd.Parameters.Add("@comprobante_ingresos", SqlDbType.VarChar).Value = sFileA;
        cmd.Parameters.Add("@status", SqlDbType.VarChar).Value = sStatus;
        cmd.Parameters.Add("@usuario", SqlDbType.VarChar).Value = Session["ses_username"].ToString();

        cmd.Connection = connSQL;
        cmd.ExecuteNonQuery();
        connSQL.Close();

        if (sStatus == "PROCESO")
        {
            String strConexion2 = System.Configuration.ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString;
            SqlConnection connSQL2 = new SqlConnection(strConexion2);
            connSQL2.Open();

            string spSQL2 = "mv_sp_abcg_solicitud_UPDATE_STATUS";
            SqlCommand cmd2 = new SqlCommand(spSQL2);
            cmd2.CommandType = CommandType.StoredProcedure;
            cmd2.Parameters.Add("@action", SqlDbType.TinyInt).Value = 1;
            cmd2.Parameters.Add("@cambio_status", SqlDbType.VarChar).Value = "PROCESO";
            cmd2.Parameters.Add("@solicitud_ID", SqlDbType.VarChar).Value = sSolicitudID;
            cmd2.Parameters.Add("@usuario", SqlDbType.VarChar).Value = Session["ses_username"].ToString();

            cmd2.Connection = connSQL2;
            cmd2.ExecuteNonQuery();
            connSQL2.Close();
        }

        Response.Redirect("adm_sol_nuevas.aspx");
    }

}