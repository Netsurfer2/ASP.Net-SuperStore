using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace PCPartsSuperStore.shopping
{
    public partial class showAllProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Check if the user is logged in.
            if (Session["userID"] == null)
            {
                Response.Redirect("~/index.aspx");
            }

            UpdateUserInfo.Visible = true;

            /*1. Open a connection using the connection string in the Web.config
                 file under AppSettings.*/
            string connStr = ConfigurationManager.AppSettings["connectionString"];
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            /* 2. Create a query that selects all the data from the SQL Database.*/
            string query = ("SELECT * FROM [dbo].[products] WHERE currentAmount > 0");
            SqlCommand cmd = new SqlCommand(query);
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = conn;

            //Read from the Database all the data.
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                string prodID = reader["pid"].ToString();
                string prodName = reader["productName"].ToString();
                string prodDesc = reader["description"].ToString();
                string prodPrice = reader["price"].ToString();

                //Create a table row.
                TableRow tRow = new TableRow();

                //Create a cell for the product name.
                TableCell tcProdName = new TableCell();
                tcProdName.Attributes.Add("class", "cells");
                tcProdName.Text = prodName;
                tRow.Cells.Add(tcProdName);

                //Create a cell for Description.
                TableCell tcProdDesc = new TableCell();
                tcProdDesc.Attributes.Add("class", "cells");
                tcProdDesc.Text = prodDesc;
                tRow.Cells.Add(tcProdDesc);

                //Create a cell for Price.
                TableCell tcProdPrice = new TableCell();
                tcProdPrice.Attributes.Add("class", "cells");
                tcProdPrice.Text = "$" + prodPrice;
                tRow.Cells.Add(tcProdPrice);

                //Create a link.
                HtmlAnchor link = new HtmlAnchor();
                link.Attributes.Add("class", "cells");
                link.HRef = "~/shopping/oneClickBuy.aspx?id=" + prodID;
                link.InnerText = "OneClick Buy";

                //Create a cell for Links.
                TableCell tcBuy = new TableCell();
                tcBuy.Attributes.Add("class", "cells");
                tcBuy.Controls.Add(link);
                tRow.Cells.Add(tcBuy);

                //Add the Row to the Table.
                tbl_Products.Rows.Add(tRow);
            }

            //Close the connection.
            conn.Close();
        }
    }
}