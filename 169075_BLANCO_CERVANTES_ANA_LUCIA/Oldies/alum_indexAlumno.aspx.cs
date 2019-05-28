using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class alum_indexAlumno : System.Web.UI.Page
{
    public int count = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        lbl_NombreAlumno.Text = Session["ses_nombreCompleto"].ToString();

        if (rad_beca_no.Checked)
        {
            //lbl_comprobante_ingresos.Visible = false;
            //btn_comprobante_ingresos.Visible = false;
        }
        else if(rad_beca_si.Checked)
        {
            //lbl_comprobante_ingresos.Visible = true;
            //btn_comprobante_ingresos.Visible = true;
        }

        TablaSolicitudesNuevas();
        TablaSolicitudesProceso();

        if (count == 1)
        {
            btn_crearSolicitud.Visible = false;
        }
        else if (count == 0)
        {
            btn_crearSolicitud.Visible = true;
        }
    }

    protected void TablaSolicitudesNuevas()
    {
        String strConexion = System.Configuration.ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString;
        SqlConnection connSQL = new SqlConnection(strConexion);
        connSQL.Open();

        string spSQL = "mv_sp_abcg_solicitud_SELECT";
        SqlCommand cmd = new SqlCommand(spSQL);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@action", SqlDbType.BigInt).Value = 2;
        cmd.Parameters.Add("@solicitud_status", SqlDbType.VarChar).Value = "NUEVA";
        cmd.Parameters.Add("@matricula", SqlDbType.VarChar).Value = Session["ses_matricula"].ToString();
        cmd.Connection = connSQL;
        cmd.ExecuteNonQuery();

        DataTable dtConsultaNuevas = new DataTable();

        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dtConsultaNuevas);

        if (dtConsultaNuevas.Rows.Count != 0)
        {
            lbl_Mensaje_sol_nuevas.Visible = false;
            rpt_sol_nuevas.DataSource = dtConsultaNuevas;
            rpt_sol_nuevas.DataBind();
            count = 1;
        }
        else
        {
            lbl_Mensaje_sol_nuevas.Visible = true;
            lbl_Mensaje_sol_nuevas.Text = "No hay elementos en la tabla.";
            count = 0;
        }

        dtConsultaNuevas.Clear();
        connSQL.Close();
    }

    protected void TablaSolicitudesProceso()
    {
        String strConexion = System.Configuration.ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString;
        SqlConnection connSQL = new SqlConnection(strConexion);
        connSQL.Open();

        string spSQL = "mv_sp_abcg_solicitud_SELECT";
        SqlCommand cmd = new SqlCommand(spSQL);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@action", SqlDbType.BigInt).Value = 2;
        cmd.Parameters.Add("@solicitud_status", SqlDbType.VarChar).Value = "PROCESO";
        cmd.Parameters.Add("@matricula", SqlDbType.VarChar).Value = Session["ses_matricula"].ToString();
        cmd.Connection = connSQL;
        cmd.ExecuteNonQuery();

        DataTable dtConsulta = new DataTable();

        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dtConsulta);

        if (dtConsulta.Rows.Count != 0)
        {
            lbl_Mensaje_sol_proceso.Visible = false;
            rpt_sol_proceso.DataSource = dtConsulta;
            rpt_sol_proceso.DataBind();
            count = 1;
        }
        else
        {
            lbl_Mensaje_sol_proceso.Visible = true;
            lbl_Mensaje_sol_proceso.Text = "No hay elementos en la tabla.";
        }

        dtConsulta.Clear();
        connSQL.Close();
    }

    protected void btn_Guardar_Click(object sender, EventArgs e)
    {
        string sEscuela = txt_Ingrsar_Escuela.Text;
        string sPais = txt_Ingresar_Pais.Text;
        int sBeca = 0;

        string sFileA = "";
        string sFileExtA;

        String strConexion = System.Configuration.ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString;
        SqlConnection connSQL = new SqlConnection(strConexion);
        connSQL.Open();

        if (rad_beca_no.Checked)
        {
            sBeca = 2;
        }
        else if (rad_beca_si.Checked)
        {
            sBeca = 1;
        }

        if (btn_comprobante_ingresos.HasFile)
        {
            sFileA = DateTime.Now.ToString("MM_dd_yyyy_hh_mm_ss") + "_" + Session["ses_matricula"].ToString();
            sFileExtA = System.IO.Path.GetExtension(btn_comprobante_ingresos.FileName).ToString();
            sFileA = sFileA + sFileExtA;
            btn_comprobante_ingresos.PostedFile.SaveAs(Server.MapPath("comprobantes/") + sFileA);
        }

        string spSQL = "mv_sp_abcg_solicitud_INSERT_UPDATE";
        SqlCommand cmd = new SqlCommand(spSQL);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@matricula", SqlDbType.VarChar).Value = Session["ses_matricula"].ToString();
        cmd.Parameters.Add("@escuela", SqlDbType.VarChar).Value = sEscuela;
        cmd.Parameters.Add("@pais", SqlDbType.VarChar).Value = sPais;
        cmd.Parameters.Add("@beca", SqlDbType.BigInt).Value = sBeca;
        cmd.Parameters.Add("@comprobante_ingresos", SqlDbType.VarChar).Value = sFileA;
        cmd.Parameters.Add("@usuario", SqlDbType.VarChar).Value = Session["ses_matricula"].ToString();

        cmd.Connection = connSQL;
        cmd.ExecuteNonQuery();
        connSQL.Close();

        Response.Redirect("alum_indexAlumno.aspx");
    }
}