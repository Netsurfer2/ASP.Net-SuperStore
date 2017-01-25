using System;
using System.Configuration;
using System.Data.SqlClient;

namespace PCPartsSuperStore.productManagement
{
    public partial class newProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Check if the user is logged in.
            if (Session["userID"] == null)
            {
                Response.Redirect("~/index.aspx");
            }
        }
        protected void submitButton_Click(object sender, System.EventArgs e)
        {
            //Get the values from the user's product input boxes.
            string prodName = txb_prodName.Text;
            string prodDesc = txb_prodDesc.Text;
            string prodPrice = txb_prodPrice.Text;
            string prodAmount = txb_prodAmount.Text;

            /*1. Open a connection using the connection string in the Web.config
                 file under AppSettings.*/
            string connStr = ConfigurationManager.AppSettings["connectionString"];
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            //Create a query.
            /* 2. Create a command that inserts the data into the SQL Database
                  using variables with values that shows as text in the labels.*/
            string query = ("INSERT INTO [dbo].[products]([productName],[description],[price]" +
                            ",[currentAmount]) VALUES (" +
                            " '" + prodName + "'," +
                            " '" + prodDesc + "'," +
                            " '" + prodPrice + "'," +
                            " '" + prodAmount + "') SELECT SCOPE_IDENTITY(); ");
            SqlCommand cmd = new SqlCommand(query);
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = conn;

            /* 3. Create a reader to read back the identity information, 
                  then close the connection after reading the column id into a variable.*/
            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            string pid = reader[0].ToString();
            conn.Close();

            //Take the id value and place it into text inside the label.
            lbl_Identity.Text = "Product: " + prodName + " created, Line ID: " + "<span>" + pid + "</span>";

            //Clear the text boxes for the next input.
            txb_prodName.Text = "";
            txb_prodDesc.Text = "";
            txb_prodPrice.Text = "";
            txb_prodAmount.Text = "";
        
        }
    }
}