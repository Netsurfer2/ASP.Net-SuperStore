using System;
using System.Configuration;
using System.Data.SqlClient;

namespace PCPartsSuperStore.userManagement
{
    public partial class UpdateUserLogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                /*1. Get the Session User ID.*/
                string id = Session["userID"].ToString();

                /*2. Open a connection using the connection string in the Web.config
                     file under AppSettings.*/
                string connStr = ConfigurationManager.AppSettings["connectionString"];
                SqlConnection conn = new SqlConnection(connStr);
                conn.Open();


                /* 3. Create a command that Selects all the data from the id row 
                      SQL Database using the where clause in showing what row to select
                      by using what is stored in the id variable.*/
                string query = "SELECT * FROM [dbo].[person] WHERE id = " + id;
                SqlCommand cmd = new SqlCommand(query);
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.Connection = conn;

                /* 4 Create a reader to read the line in the SQL database into the text boxes*/
                SqlDataReader reader = cmd.ExecuteReader();
                reader.Read();

                /* 5. Show the info in the textboxes that need updating.*/
                string fName = reader["firstName"].ToString();
                string lName = reader["lastName"].ToString();
                string uName = reader["userName"].ToString();
                string pWord = reader["password"].ToString();
                string address = reader["address"].ToString();
                string email = reader["email"].ToString();
                string phone = reader["phone"].ToString();

                // 6. Close the connection.
                conn.Close();

                // 7. Show the variable information inside the text boxes.
                txbUpD_FName.Text = fName;
                txbUpD_LName.Text = lName;
                txbUpD_UserName.Text = uName;
                txbUpD_Password.Text = pWord;
                txbUpD_Address.Text = address;
                txbUpD_Email.Text = email;
                txbUpD_PhoneNumber.Text = phone;
            }

        }
    }
}