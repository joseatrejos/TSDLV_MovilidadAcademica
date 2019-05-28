using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class adm_alumnos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ses_rol"].ToString() == "consulta")
        {
            btn_crearAlumno.Visible = false;
        }
        else
        {
            btn_crearAlumno.Visible = true;
        }

        ListadoDeAlumnos();
    }

    protected void ListadoDeAlumnos()
    {
        String strConexion = System.Configuration.ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString;
        SqlConnection connSQL = new SqlConnection(strConexion);
        connSQL.Open();

        string spSQL = "mv_sp_abcg_alumno_SELECT";
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
            rpt_alumnos.DataSource = dtConsulta;
            rpt_alumnos.DataBind();
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
        string sMatricula = txt_Matricula.Text;
        string sMatricula_h = txt_Matricula_h.Value;
        string sNombres = txt_Nombres.Text;
        string sApellidoPaterno = txt_Apellido_Paterno.Text;
        string sApellidoMaterno = txt_Apellido_Materno.Text;
        string sDomicilio = txt_Domicilio.Text;
        string sCorreo = txt_Correo.Text;
        string sContrasena = txt_Contrasena.Text;
        string sStatus = ddl_Status.SelectedValue.ToString();

        String strConexion = System.Configuration.ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString;
        SqlConnection connSQL = new SqlConnection(strConexion);
        connSQL.Open();

        string spSQL = "mv_sp_abcg_alumno_INSERT_UPDATE";
        SqlCommand cmd = new SqlCommand(spSQL);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@matricula", SqlDbType.BigInt).Value = sMatricula_h;
        cmd.Parameters.Add("@contrasena", SqlDbType.VarChar).Value = sContrasena;
        cmd.Parameters.Add("@nombres", SqlDbType.VarChar).Value = sNombres;
        cmd.Parameters.Add("@apellido_paterno", SqlDbType.VarChar).Value = sApellidoPaterno;
        cmd.Parameters.Add("@apellido_materno", SqlDbType.VarChar).Value = sApellidoMaterno;
        cmd.Parameters.Add("@correo", SqlDbType.VarChar).Value = sCorreo;
        cmd.Parameters.Add("@domicilio", SqlDbType.VarChar).Value = sDomicilio;
        cmd.Parameters.Add("@status", SqlDbType.VarChar).Value = sStatus;
        cmd.Parameters.Add("@usuario", SqlDbType.VarChar).Value = Session["ses_username"].ToString();

        cmd.Connection = connSQL;
        cmd.ExecuteNonQuery();
        connSQL.Close();

        Response.Redirect("adm_alumnos.aspx");
    }

    protected void btn_editar_guardar_Click(object sender, EventArgs e)
    {
        string sMatricula = txt_Matricula.Text;
        string sNombres = txt_Nombres.Text;
        string sApellidoPaterno = txt_Apellido_Paterno.Text;
        string sApellidoMaterno = txt_Apellido_Materno.Text;
        string sDomicilio = txt_Domicilio.Text;
        string sCorreo = txt_Correo.Text;
        string sContrasena = txt_Contrasena.Text;

        String strConexion = System.Configuration.ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString;
        SqlConnection connSQL = new SqlConnection(strConexion);
        connSQL.Open();

        string spSQL = "mv_sp_abcg_alumno_INSERT_UPDATE";
        SqlCommand cmd = new SqlCommand(spSQL);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@matricula", SqlDbType.BigInt).Value = 0;
        cmd.Parameters.Add("@contrasena", SqlDbType.VarChar).Value = sContrasena;
        cmd.Parameters.Add("@nombres", SqlDbType.VarChar).Value = sNombres;
        cmd.Parameters.Add("@apellido_paterno", SqlDbType.VarChar).Value = sApellidoPaterno;
        cmd.Parameters.Add("@apellido_materno", SqlDbType.VarChar).Value = sApellidoMaterno;
        cmd.Parameters.Add("@correo", SqlDbType.VarChar).Value = sCorreo;
        cmd.Parameters.Add("@domicilio", SqlDbType.VarChar).Value = sDomicilio;
        cmd.Parameters.Add("@usuario", SqlDbType.VarChar).Value = Session["ses_username"].ToString();

        cmd.Connection = connSQL;
        cmd.ExecuteNonQuery();
        connSQL.Close();

        Response.Redirect("adm_alumnos.aspx");
    }

    void reset()
    {
        txt_Matricula_h.Value = "0";
        txt_Matricula.Text = "0";
        txt_Contrasena.Text = " ";
        txt_Nombres.Text = " ";
        txt_Apellido_Paterno.Text = " ";
        txt_Apellido_Materno.Text = " ";
        ddl_Status.SelectedValue = " ";
        txt_Correo.Text = " ";
        txt_Domicilio.Text = " ";
    }



    protected void btn_cerrar_Click(object sender, EventArgs e)
    {
        reset();
    }
}