using System;
using System.Configuration;
using System.Data.SqlClient;

namespace PCPartsSuperStore.userManagement
{
    public partial class UserUpdatedShowInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Create the Variable for the Session. 
            string id = Session["userID"].ToString();

            //Pass the information from the text box to the variable.
            string strfName = Request.Form["ctl00$cpd_Main$txbUpD_FName"];
            string strlName = Request.Form["ctl00$cpd_Main$txbUpD_LName"];
            string struName = Request.Form["ctl00$cpd_Main$txbUpD_UserName"];
            string strpWord = Request.Form["ctl00$cpd_Main$txbUpD_Password"];
            string strAddress = Request.Form["ctl00$cpd_Main$txbUpD_Address"];
            string strEmail = Request.Form["ctl00$cpd_Main$txbUpD_Email"];
            string strPhone = Request.Form["ctl00$cpd_Main$txbUpD_PhoneNumber"];

            //Define the label object to display what is in the variable.
            lbl_fName.Text = strfName;
            lbl_LName.Text = strlName;
            lbl_UserName.Text = struName;
            lbl_Password.Text = strpWord;
            lbl_Address.Text = strAddress;
            lbl_Email.Text = strEmail;
            lbl_PhoneNumber.Text = strPhone;

            /*1. Open a connection using the connection string in the Web.config
                 file under AppSettings.*/
            string connStr = ConfigurationManager.AppSettings["connectionString"];
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            /* 2. Create a command that updates the data into the SQL Database
                  using variables with values that shows as text in the labels.*/
            string query = "UPDATE [dbo].[person] SET" +
                            "[firstName]= '" + strfName + "'," +
                            "[lastName]= '" + strlName + "'," +
                            "[userName]= '" + struName + "'," +
                            "[password]= '" + strpWord + "'," +
                            "[address]= '" + strAddress + "'," +
                            "[email]= '" + strEmail + "'," +
                            "[phone]= '" + strPhone + "' WHERE id =" + id;
            SqlCommand cmd = new SqlCommand(query);
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = conn;

            /* 3. Create a reader to read back the identity information, 
                  then close the connection after reading the column id into a variable.*/
            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            conn.Close();

            //Take the id value and place it into text inside the label.
            lbl_Identity.Text = "Dataset Updated, Line ID: " + "<spanUUSI>" + id + "</spanUUSI>";
        }
    }
}