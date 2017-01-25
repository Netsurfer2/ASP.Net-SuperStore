using System;
using System.Configuration;
using System.Data.SqlClient;

namespace PCPartsSuperStore.userManagement
{
    public partial class ShowUserLogInInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Pass the information from the text box to the variable.
            //ctl00$cpd_Main$txtBox
            string fName = Request.Form["ctl00$cpd_Main$txb_FName"];
            string lName = Request.Form["ctl00$cpd_Main$txb_LName"];
            string uName = Request.Form["ctl00$cpd_Main$txb_UserName"];
            string pWord = Request.Form["ctl00$cpd_Main$txb_Password"];
            string address = Request.Form["ctl00$cpd_Main$txb_Address"];
            string email = Request.Form["ctl00$cpd_Main$txb_Email"];
            string phone = Request.Form["ctl00$cpd_Main$txb_PhoneNumber"];

            //Request.Form["ctl00$cpd_main$txtBox"] instead of Request.Form["txtBox"]

            //Define the label object to display what is in the variable.
            lbl2_fName.Text = fName;
            lbl2_LName.Text = lName;
            lbl2_UserName.Text = uName;
            lbl2_Password.Text = pWord;
            lbl2_Address.Text = address;
            lbl2_Email.Text = email;
            lbl2_PhoneNumber.Text = phone;

            /*1. Open a connection using the connection string in the Web.config
                 file under AppSettings.*/
            string connStr = ConfigurationManager.AppSettings["connectionString"];
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            /* 2. Create a command that inserts the data into the SQL Database
                  using variables with values that shows as text in the labels.*/
            string query = ("INSERT INTO [dbo].[person]([firstName],[lastName],[userName]" +
                            ",[password],[address],[email],[phone]) VALUES (" +
                            " '" + fName + "'," +
                            " '" + lName + "'," +
                            " '" + uName + "'," +
                            " '" + pWord + "'," +
                            " '" + address + "'," +
                            " '" + email + "'," +
                            " '" + phone + "') SELECT SCOPE_IDENTITY(); ");
            SqlCommand cmd = new SqlCommand(query);
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = conn;

            /* 3. Create a reader to read back the identity information, 
                  then close the connection after reading the column id into a variable.*/
            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            string id = reader[0].ToString();
            conn.Close();

            //Take the id value and place it into text inside the label.
            lbl_Identity.Text = "Dataset Created, Line ID: " + "<span>" + id + "</span>";

            //Pass the Session Variable to the UpdateLogIn Page (Third Page).
            Session["userID"] = id;
        }
    }
}