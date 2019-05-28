using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Colocar los siguientes en todas las páginas:
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class index : System.Web.UI.Page
{
    DataTable dtConsulta;
    public string sLogin = ""; 
    public string sPass = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btn_Acceder_Click(object sender, EventArgs e)
    {
        sLogin = txt_Usuario.Text;
        sPass = txt_Contrasena.Text;

        //String que llama al Web.config con el string de conexión a la base de datos para iniciar consulta.
        String strConexion = System.Configuration.ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString;
        //Declaramos variable de conexión a la base de datos llamando al string anterior.
        SqlConnection connSQL = new SqlConnection(strConexion);
        //Abrimos la conexión a la base de datos.
        connSQL.Open();

        //String con el nombre del sp (stored procedure) a utilizar.
        string spSQL = "mv_sp_abcg_login_USUARIO";
        //Declaramos variable de comando a realizar en la base de datos con el nombre del string anterior.
        SqlCommand cmd = new SqlCommand(spSQL);
        //Definimos qué tipo de comando es la variable anterior.
        cmd.CommandType = CommandType.StoredProcedure;
        //Enviamos los parámetros que requiere el sp con las variables que se utilizan en el sistema.
        cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = sLogin;
        cmd.Parameters.Add("@contrasena", SqlDbType.VarChar).Value = sPass;
        //Mandamos a hacer la conexión de nuestra variable del comando por medio del string de conexión a la bd.
        cmd.Connection = connSQL;
        //Mandamos a ejecutar el query.
        cmd.ExecuteNonQuery();

        dtConsulta = new DataTable();

        //Recibimos los datos del comando una vez ejecutado el query.
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        //Llenamos la variable de DataTable el cual se llama dtConsulta con los datos recibidos del adp.
        adp.Fill(dtConsulta);

        if (dtConsulta.Rows.Count != 0)
        {
            Session["ses_username"]         = dtConsulta.Rows[0].ItemArray[0].ToString();
            Session["ses_nombreCompleto"]   = dtConsulta.Rows[0].ItemArray[1].ToString();
            Session["ses_rol"]              = dtConsulta.Rows[0].ItemArray[3].ToString();

            if (Session["ses_rol"].ToString() == "administrador" || Session["ses_rol"].ToString() == "consulta")
            {
                Response.Redirect("adm_indexAdmin.aspx");
            }
            else if ((Session["ses_rol"].ToString() == "master"))
            {
                Response.Redirect("master_indexMaster.aspx");
            } 
            
        }
        else
        {
            Session["ses_username"] = "";
            Session["ses_nombreCompleto"] = "";
            Session["ses_rol"] = "";

            lbl_Mensaje.Text = "Usuario y/o contraseña no coinciden.";
        }

        //Limpiamos la variable dtConsulta ya que los datos no los ocuparemos de nuevo en esta ocasión.
        dtConsulta.Clear();

        //Cerramos la conexión a la base de datos.
        connSQL.Close();
    }
}