using System;
using System.Configuration;
using System.Data.SqlClient;

namespace PCPartsSuperStore
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Don't allow the user to update any info until log-in.
            UpdateUserInfo.Visible = false;
        }
        protected void submitButton_Click(object sender, System.EventArgs e)
        {
            //Pass the user's textbox inputs into variables.
            string uName = Request.Form["ctl00$cpd_Main$txb_SignInUName"];
            string pass = Request.Form["ctl00$cpd_Main$txb_SignInPWord"];

            /*1. Open a connection using the connection string in the Web.config
                 file under AppSettings.*/
            string connStr = ConfigurationManager.AppSettings["connectionString"];
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            /* 2. Create a command that gets the firstName from the database 
                  using a where clause from the user input using the SQL Server Database.
                  Then define the query with the connection.*/
            string query = "SELECT [firstName], [id] FROM [dbo].[person]" +
                           "WHERE userName =  '" + uName + "' AND password = '" + pass + "'";
            SqlCommand cmd = new SqlCommand(query);
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = conn;


            /* 3. Create a reader, read the firstName and id into the variables
                  as a string, then pass the variables into session variables.
                  Finally, display output to the label or textbox and hide the Log-In form.*/
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                string strfName = reader["firstName"].ToString();
                string strID = reader["id"].ToString();
                Session["firstName"] = strfName;
                Session["userID"] = strID;
                lbl_WelcomeUser.Text = "<spanIndex>Welcome</spanIndex> " + strfName + "<spanIndex>!</spanIndex>";
                Form.Visible = false;
                SignUp.Visible = false;
                UpdateUserInfo.Visible = true;


            }
            else
            {
                txb_SignInUName.Text = "Log-In Failed!";
                SignUp.Visible = true;
                UpdateUserInfo.Visible = false;

            }
            //4. Close the connection.
            conn.Close();
        }
    }
}