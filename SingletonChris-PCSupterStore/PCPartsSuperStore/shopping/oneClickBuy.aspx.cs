using System;
using System.Configuration;
using System.Data.SqlClient;

namespace PCPartsSuperStore.shopping
{
    public partial class oneClickBuy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Check if the user is logged in.
            if (Session["userID"] == null)
            {
                Response.Redirect("~/index.aspx");
            }
            //Pass the Session userID to id when querying for the user.
            string id = Session["userID"].ToString(); 

            //Allow the user to update their info.
            UpdateUserInfoOCB.Visible = true;

            //Get the product from the query string.
            string productID = Request.QueryString["id"].ToString();

            /*1. Open a connection using the connection string in the Web.config
                 file under AppSettings.*/
            string connStr = ConfigurationManager.AppSettings["connectionString"];
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();


            /*2. Get the product information using a query string.*/
            string query = ("SELECT * FROM [dbo].[products] WHERE pid =" + productID);
            SqlCommand cmd = new SqlCommand(query);
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = conn;


            /*3. Read from the Database the Product Name and Product Price data that
                 you selected in the query with the pid that was filtered after opening
                 the new defined reader. Then close the reader to re-use it again.*/
            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();

            string prodName = reader["productName"].ToString();
            string prodPrice = reader["price"].ToString();

            reader.Close();

            /*4. Create a query with the user's First Name and Address based
                 on the user already logged on. Then execute and read the reader
                 once again from the database. After that close the reader.
                 Note: Do Not Close the Connection (Connection still open).*/
            cmd.CommandText = "SELECT * FROM person WHERE id =" +id;
            reader = cmd.ExecuteReader();
            reader.Read();

            string custName = reader["firstName"].ToString();
            string custAddress = reader["address"].ToString();
            string custEmail = reader["email"].ToString();
            reader.Close();

            /*5. Decrease the product from the selected pid (Product ID).
                 Then Close the Connection and display the thank you message.*/
            cmd.CommandText = "UPDATE products SET currentAmount = (currentAmount-1)" +
                              " where pid =" + productID;
            cmd.ExecuteNonQuery();
            conn.Close();

            //create a sesssion with info for emailing the customer.
            Session["custName"] = custName;
            Session["prodName"] = prodName;
            Session["prodPrice"] = prodPrice;
            Session["custAddress"] = custAddress;

            //Send the customer's email info to the WebMail page.
            Session["email"] = custEmail;

            //Say thank you message and let the customer know about your interest in their purchase.
            div_purchase.InnerHtml = "Hi <spanOCB><b>" + custName + "</b></spanOCB>," +
              "<br/>Thank's for buying a <spanOCB><b>" + prodName + "</b></spanOCB>. Your " +
           "credit card will be charged <spanOCB><b>$" + prodPrice + "</b></spanOCB> and your" +
           " purchase will be shipped to <spanOCB><b>" + custAddress + "</b></spanOCB>." +
           " Thanks for shopping with us. Come back soon. We like your money.";
        }
    }
}