using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class master_indexMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lbl_NombreUsuario.Text = Session["ses_nombreCompleto"].ToString();

        SolicitudesNuevas();
        SolicitudesEnProceso();
        SolicitudesAprobadas();
        SolicitudesRechazadas();

        AlumnosInscritos();
        AlumnosEnEspera();
        AlumnosAceptados();
        AlumnosRechazados();
    }

    protected void SolicitudesNuevas()
    {
        String strConexion = System.Configuration.ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString;
        SqlConnection connSQL = new SqlConnection(strConexion);
        connSQL.Open();

        string spSQL = "mv_sp_abcg_dashboard_USUARIO";
        SqlCommand cmd = new SqlCommand(spSQL);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@action", SqlDbType.BigInt).Value = 1;
        cmd.Parameters.Add("@solicitud_status", SqlDbType.VarChar).Value = "nueva";

        cmd.Connection = connSQL;
        cmd.ExecuteNonQuery();

        DataTable dtConsulta = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dtConsulta);

        if (dtConsulta.Rows.Count != 0)
        {
            master_sol_nuevas.Text = dtConsulta.Rows[0].ItemArray[0].ToString() + " nuevas";
        }
        else
        {
            master_sol_nuevas.Text = "Sin datos";
        }
            
        dtConsulta.Clear();
        connSQL.Close();
    }

    protected void SolicitudesEnProceso()
    {
        String strConexion = System.Configuration.ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString;
        SqlConnection connSQL = new SqlConnection(strConexion);
        connSQL.Open();

        string spSQL = "mv_sp_abcg_dashboard_USUARIO";
        SqlCommand cmd = new SqlCommand(spSQL);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@action", SqlDbType.BigInt).Value = 1;
        cmd.Parameters.Add("@solicitud_status", SqlDbType.VarChar).Value = "proceso";

        cmd.Connection = connSQL;
        cmd.ExecuteNonQuery();

        DataTable dtConsulta = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dtConsulta);

        if (dtConsulta.Rows.Count != 0)
        {
            master_sol_proceso.Text = dtConsulta.Rows[0].ItemArray[0].ToString() + " en proceso";
        }
        else
        {
            master_sol_proceso.Text = "Sin datos";
        }

        dtConsulta.Clear();
        connSQL.Close();
    }

    protected void SolicitudesAprobadas()
    {
        String strConexion = System.Configuration.ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString;
        SqlConnection connSQL = new SqlConnection(strConexion);
        connSQL.Open();

        string spSQL = "mv_sp_abcg_dashboard_USUARIO";
        SqlCommand cmd = new SqlCommand(spSQL);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@action", SqlDbType.BigInt).Value = 1;
        cmd.Parameters.Add("@solicitud_status", SqlDbType.VarChar).Value = "aceptada";

        cmd.Connection = connSQL;
        cmd.ExecuteNonQuery();

        DataTable dtConsulta = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dtConsulta);

        if (dtConsulta.Rows.Count != 0)
        {
            master_sol_aceptadas.Text = dtConsulta.Rows[0].ItemArray[0].ToString() + " aceptadas";
        }
        else
        {
            master_sol_aceptadas.Text = "Sin datos";
        }

        dtConsulta.Clear();
        connSQL.Close();
    }

    protected void SolicitudesRechazadas()
    {
        String strConexion = System.Configuration.ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString;
        SqlConnection connSQL = new SqlConnection(strConexion);
        connSQL.Open();

        string spSQL = "mv_sp_abcg_dashboard_USUARIO";
        SqlCommand cmd = new SqlCommand(spSQL);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@action", SqlDbType.BigInt).Value = 1;
        cmd.Parameters.Add("@solicitud_status", SqlDbType.VarChar).Value = "rechazada";

        cmd.Connection = connSQL;
        cmd.ExecuteNonQuery();

        DataTable dtConsulta = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dtConsulta);

        if (dtConsulta.Rows.Count != 0)
        {
            master_sol_rechazadas.Text = dtConsulta.Rows[0].ItemArray[0].ToString() + " rechazadas";
        }
        else
        {
            master_sol_rechazadas.Text = "Sin datos";
        }

        dtConsulta.Clear();
        connSQL.Close();
    }

    protected void AlumnosInscritos()
    {
        String strConexion = System.Configuration.ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString;
        SqlConnection connSQL = new SqlConnection(strConexion);
        connSQL.Open();

        string spSQL = "mv_sp_abcg_dashboard_USUARIO";
        SqlCommand cmd = new SqlCommand(spSQL);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@action", SqlDbType.BigInt).Value = 2;
        cmd.Parameters.Add("@alumno_status", SqlDbType.VarChar).Value = "ACTIVO";

        cmd.Connection = connSQL;
        cmd.ExecuteNonQuery();

        DataTable dtConsulta = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dtConsulta);

        if (dtConsulta.Rows.Count != 0)
        {
            master_alum_inscritos.Text = dtConsulta.Rows[0].ItemArray[0].ToString() + " inscritos";
        }
        else
        {
            master_alum_inscritos.Text = "Sin datos";
        }

        dtConsulta.Clear();
        connSQL.Close();
    }

    protected void AlumnosEnEspera()
    {
        String strConexion = System.Configuration.ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString;
        SqlConnection connSQL = new SqlConnection(strConexion);
        connSQL.Open();

        string spSQL = "mv_sp_abcg_dashboard_USUARIO";
        SqlCommand cmd = new SqlCommand(spSQL);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@action", SqlDbType.BigInt).Value = 2;
        cmd.Parameters.Add("@alumno_status", SqlDbType.VarChar).Value = "ESPERA";

        cmd.Connection = connSQL;
        cmd.ExecuteNonQuery();

        DataTable dtConsulta = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dtConsulta);

        if (dtConsulta.Rows.Count != 0)
        {
            master_alum_espera.Text = dtConsulta.Rows[0].ItemArray[0].ToString() + " en espera";
        }
        else
        {
            master_alum_espera.Text = "Sin datos";
        }

        dtConsulta.Clear();
        connSQL.Close();
    }

    protected void AlumnosAceptados()
    {
        String strConexion = System.Configuration.ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString;
        SqlConnection connSQL = new SqlConnection(strConexion);
        connSQL.Open();

        string spSQL = "mv_sp_abcg_dashboard_USUARIO";
        SqlCommand cmd = new SqlCommand(spSQL);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@action", SqlDbType.BigInt).Value = 3;
        cmd.Parameters.Add("@solicitud_status", SqlDbType.VarChar).Value = "aceptada";

        cmd.Connection = connSQL;
        cmd.ExecuteNonQuery();

        DataTable dtConsulta = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dtConsulta);

        if (dtConsulta.Rows.Count != 0)
        {
            master_alum_aceptados.Text = dtConsulta.Rows[0].ItemArray[0].ToString() + " aceptados";
        }
        else
        {
            master_alum_aceptados.Text = "Sin datos";
        }

        dtConsulta.Clear();
        connSQL.Close();
    }

    protected void AlumnosRechazados()
    {
        String strConexion = System.Configuration.ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString;
        SqlConnection connSQL = new SqlConnection(strConexion);
        connSQL.Open();

        string spSQL = "mv_sp_abcg_dashboard_USUARIO";
        SqlCommand cmd = new SqlCommand(spSQL);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@action", SqlDbType.BigInt).Value = 3;
        cmd.Parameters.Add("@solicitud_status", SqlDbType.VarChar).Value = "rechazada";

        cmd.Connection = connSQL;
        cmd.ExecuteNonQuery();

        DataTable dtConsulta = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dtConsulta);

        if (dtConsulta.Rows.Count != 0)
        {
            master_alum_rechazados.Text = dtConsulta.Rows[0].ItemArray[0].ToString() + " rechazados";
        }
        else
        {
            master_alum_rechazados.Text = "Sin datos";
        }

        dtConsulta.Clear();
        connSQL.Close();
    }
}