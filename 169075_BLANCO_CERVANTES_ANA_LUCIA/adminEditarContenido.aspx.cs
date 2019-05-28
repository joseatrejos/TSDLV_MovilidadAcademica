using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class adminEditarContenido : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        message.Text = "";
    }

    protected void enviar_Click(object sender, EventArgs e)
    {
        string sSolicitudID = txt_solicitud_ID.Text;
        string sMatricula = txt_alum_ID.Text;
        string sEscuela = txtuniversidad.Text;
        string sPais = txtpais.Text;
        string sBeca = ddl_Beca.SelectedValue.ToString();

        string sFileA = "";
        string sFileExtA;

        String strConexion = System.Configuration.ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString;
        SqlConnection connSQL = new SqlConnection(strConexion);
        connSQL.Open();

        if (btn_comprobante_ingresos.HasFile)
        {
            sFileA = DateTime.Now.ToString("MM_dd_yyyy_hh_mm_ss") + "_" + Session["ses_usuario"].ToString();
            sFileExtA = System.IO.Path.GetExtension(btn_comprobante_ingresos.FileName).ToString();
            sFileA = sFileA + sFileExtA;
            btn_comprobante_ingresos.PostedFile.SaveAs(Server.MapPath("Comprobantes/") + sFileA);
        }

        string spSQL = "sp_mv_tsdlv_solicitudes_INSUPD";
        SqlCommand cmd = new SqlCommand(spSQL);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@action", SqlDbType.TinyInt).Value = 1;
        cmd.Parameters.Add("@mv_tsdlv_solic_ID", SqlDbType.VarChar).Value = sSolicitudID;
        cmd.Parameters.Add("@mv_tsdlv_alum_ID", SqlDbType.VarChar).Value = sMatricula;
        cmd.Parameters.Add("@mv_tsdlv_solic_universidad", SqlDbType.VarChar).Value = sEscuela;
        cmd.Parameters.Add("@mv_tsdlv_solic_pais", SqlDbType.VarChar).Value = sPais;
        cmd.Parameters.Add("@mv_tsdlv_solic_beca", SqlDbType.VarChar).Value = sBeca;
        cmd.Parameters.Add("@mv_tsdlv_solic_comprobante", SqlDbType.VarChar).Value = sFileA;
        cmd.Parameters.Add("@user", SqlDbType.VarChar).Value = Session["ses_usuario"].ToString();

        cmd.Connection = connSQL;
        cmd.ExecuteNonQuery();
        connSQL.Close();

        Response.Redirect("adminsIndex.aspx");
    }

    protected void proceso_Click(object sender, EventArgs e)
    {
        string sSolicitudID = txt_solicitud_ID.Text;
        string sMatricula = txt_alum_ID.Text;
        string sEscuela = txtuniversidad.Text;
        string sPais = txtpais.Text;
        string sStatus = "En Proceso";
        string sBeca = ddl_Beca.SelectedValue.ToString();

        string sFileA = "";
        string sFileExtA;

        String strConexion = System.Configuration.ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString;
        SqlConnection connSQL = new SqlConnection(strConexion);
        connSQL.Open();

        if (btn_comprobante_ingresos.HasFile)
        {
            sFileA = DateTime.Now.ToString("MM_dd_yyyy_hh_mm_ss") + "_" + Session["ses_usuario"].ToString();
            sFileExtA = System.IO.Path.GetExtension(btn_comprobante_ingresos.FileName).ToString();
            sFileA = sFileA + sFileExtA;
            btn_comprobante_ingresos.PostedFile.SaveAs(Server.MapPath("Comprobantes/") + sFileA);
        }

        string spSQL = "sp_mv_tsdlv_solicitudes_INSUPD";
        SqlCommand cmd = new SqlCommand(spSQL);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@action", SqlDbType.TinyInt).Value = 2;
        cmd.Parameters.Add("@mv_tsdlv_solic_ID", SqlDbType.VarChar).Value = sSolicitudID;
        cmd.Parameters.Add("@mv_tsdlv_alum_ID", SqlDbType.VarChar).Value = sMatricula;
        cmd.Parameters.Add("@mv_tsdlv_solic_universidad", SqlDbType.VarChar).Value = sEscuela;
        cmd.Parameters.Add("@mv_tsdlv_solic_status", SqlDbType.VarChar).Value = sStatus;
        cmd.Parameters.Add("@mv_tsdlv_solic_pais", SqlDbType.VarChar).Value = sPais;
        cmd.Parameters.Add("@mv_tsdlv_solic_beca", SqlDbType.VarChar).Value = sBeca;
        cmd.Parameters.Add("@mv_tsdlv_solic_comprobante", SqlDbType.VarChar).Value = sFileA;
        cmd.Parameters.Add("@user", SqlDbType.VarChar).Value = Session["ses_usuario"].ToString();

        cmd.Connection = connSQL;
        cmd.ExecuteNonQuery();
        connSQL.Close();

        Response.Redirect("adminsIndex.aspx");
    }

    protected void aceptada_Click(object sender, EventArgs e)
    {
        string sSolicitudID = txt_solicitud_ID.Text;
        string sMatricula = txt_alum_ID.Text;
        string sEscuela = txtuniversidad.Text;
        string sPais = txtpais.Text;
        string sStatus = "Aceptada";
        string sBeca = ddl_Beca.SelectedValue.ToString();

        string sFileA = "";
        string sFileExtA;

        String strConexion = System.Configuration.ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString;
        SqlConnection connSQL = new SqlConnection(strConexion);
        connSQL.Open();

        if (btn_comprobante_ingresos.HasFile)
        {
            sFileA = DateTime.Now.ToString("MM_dd_yyyy_hh_mm_ss") + "_" + Session["ses_usuario"].ToString();
            sFileExtA = System.IO.Path.GetExtension(btn_comprobante_ingresos.FileName).ToString();
            sFileA = sFileA + sFileExtA;
            btn_comprobante_ingresos.PostedFile.SaveAs(Server.MapPath("Comprobantes/") + sFileA);
        }

        string spSQL = "sp_mv_tsdlv_solicitudes_INSUPD";
        SqlCommand cmd = new SqlCommand(spSQL);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@action", SqlDbType.TinyInt).Value = 3;
        cmd.Parameters.Add("@mv_tsdlv_solic_ID", SqlDbType.VarChar).Value = sSolicitudID;
        cmd.Parameters.Add("@mv_tsdlv_alum_ID", SqlDbType.VarChar).Value = sMatricula;
        cmd.Parameters.Add("@mv_tsdlv_solic_universidad", SqlDbType.VarChar).Value = sEscuela;
        cmd.Parameters.Add("@mv_tsdlv_solic_status", SqlDbType.VarChar).Value = sStatus;
        cmd.Parameters.Add("@mv_tsdlv_solic_pais", SqlDbType.VarChar).Value = sPais;
        cmd.Parameters.Add("@mv_tsdlv_solic_beca", SqlDbType.VarChar).Value = sBeca;
        cmd.Parameters.Add("@mv_tsdlv_solic_comprobante", SqlDbType.VarChar).Value = sFileA;
        cmd.Parameters.Add("@user", SqlDbType.VarChar).Value = Session["ses_usuario"].ToString();

        cmd.Connection = connSQL;
        cmd.ExecuteNonQuery();
        connSQL.Close();

        Response.Redirect("adminsIndex.aspx");
    }

    protected void rechazada_Click(object sender, EventArgs e)
    {
        string sSolicitudID = txt_solicitud_ID.Text;
        string sMatricula = txt_alum_ID.Text;
        string sEscuela = txtuniversidad.Text;
        string sPais = txtpais.Text;
        string sStatus = "Rechazada";
        string sBeca = ddl_Beca.SelectedValue.ToString();

        string sFileA = "";
        string sFileExtA;

        String strConexion = System.Configuration.ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString;
        SqlConnection connSQL = new SqlConnection(strConexion);
        connSQL.Open();

        if (btn_comprobante_ingresos.HasFile)
        {
            sFileA = DateTime.Now.ToString("MM_dd_yyyy_hh_mm_ss") + "_" + Session["ses_usuario"].ToString();
            sFileExtA = System.IO.Path.GetExtension(btn_comprobante_ingresos.FileName).ToString();
            sFileA = sFileA + sFileExtA;
            btn_comprobante_ingresos.PostedFile.SaveAs(Server.MapPath("Comprobantes/") + sFileA);
        }

        string spSQL = "sp_mv_tsdlv_solicitudes_INSUPD";
        SqlCommand cmd = new SqlCommand(spSQL);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@action", SqlDbType.TinyInt).Value = 3;
        cmd.Parameters.Add("@mv_tsdlv_solic_ID", SqlDbType.VarChar).Value = sSolicitudID;
        cmd.Parameters.Add("@mv_tsdlv_alum_ID", SqlDbType.VarChar).Value = sMatricula;
        cmd.Parameters.Add("@mv_tsdlv_solic_universidad", SqlDbType.VarChar).Value = sEscuela;
        cmd.Parameters.Add("@mv_tsdlv_solic_status", SqlDbType.VarChar).Value = sStatus;
        cmd.Parameters.Add("@mv_tsdlv_solic_pais", SqlDbType.VarChar).Value = sPais;
        cmd.Parameters.Add("@mv_tsdlv_solic_beca", SqlDbType.VarChar).Value = sBeca;
        cmd.Parameters.Add("@mv_tsdlv_solic_comprobante", SqlDbType.VarChar).Value = sFileA;
        cmd.Parameters.Add("@user", SqlDbType.VarChar).Value = Session["ses_usuario"].ToString();

        cmd.Connection = connSQL;
        cmd.ExecuteNonQuery();
        connSQL.Close();

        Response.Redirect("adminsIndex.aspx");
    }
}