using System;
using System.Net;
using System.Net.Mail;

namespace PCPartsSuperStore.WebEmail
{
    public partial class WebMail1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Check if the user is logged in.
            if (Session["userID"] == null)
            {
                Response.Redirect("~/index.aspx");
            }

            /*1. Get the Session variables to display what is in the email.*/
            string custName = (string)Session["custName"];
            string prodName = (string)Session["prodName"];
            string prodPrice = (string)Session["prodPrice"];
            string custAddress = (string)Session["custAddress"];

            /***************************************************************/
            /***** Automatically gets the "to" email from the database *****/
            /***************************************************************/
            //Note: Database email must be a true email address in sending. 

            /*2. Get the Session variable for the customer email and display
              it in the label. Then use the text in the label to send to the customer.*/
            string custEmail = (string)Session["email"];
            lbl_WMAddress.Text = custEmail.ToString();

            /*3. Define the header of the email being sent.*/
            string subject = "Thank you for shopping!";

            /*4. Use what is in the label as an email address 
                 of the user's email as a string and then define the body (message). */
            string to = lbl_WMAddress.Text;

            /***************************************************************/
            /***************************************************************/

            //Display what will be in the body of the email.
            string body = "Hi <b>" + custName + "</ b >, <br/>Thank's for "+
           "buying a <spanOCB><b>" + prodName + "</b></spanOCB>. Your credit card will be "+
           "charged <spanOCB><b>$" + prodPrice + "</b></spanOCB> and your purchase will be shipped"+
           " to <spanOCB><b>"      + custAddress + "</b></spanOCB>."+
           " Thanks for shopping with us. Come back soon. We like your money.";

            /*5. Create a MailMessage object.*/
            MailMessage mail = new MailMessage();


            /***************************************************************/
            /************************* Sender's Email **********************/
            /***************************************************************/
            /*6. Define what email address with password your sending from. 
                 (Your own gmail credentials).*/
            string senderEmail = "Sender@gmail.com";                                 
            string senderPasswd = "SenderPassword"; // a valid password for the email above*/
            /***************************************************************/
            /***************************************************************/


            /*7. Define the objects of the email and link them to the variables as objects.*/
            mail.From = new MailAddress(senderEmail);
            mail.To.Add(to.ToString());
            mail.Subject = subject;
            mail.Body = body;

            /*8. Allows HTML in the body.*/
            mail.IsBodyHtml = true;

            //Note: Code to add attachements, but not needed in this case(reference).
            //mail.Attachments.Add(new Attachment("C:\\someFile.jpg"));

            /*9. SMTP Client for gmail only. Other emails will have different
                 SMTP Client port numbers.*/
            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587); //Port 587

            /*10. Set the credentials and secure socket link.*/
            smtp.Credentials = new NetworkCredential(senderEmail, senderPasswd);
            smtp.EnableSsl = true;

            /*11. Sends the email.*/
            smtp.Send(mail);

            /*12. Display another message with the variables.*/
            div_purchase.InnerHtml = "Hi <spanOCB><b>" + custName + "</b></spanOCB>," +
              "<br/>Thank's for buying a <spanOCB><b>" + prodName + "</b></spanOCB>. Your " +
           "credit card will be charged <spanOCB><b>$" + prodPrice + "</b></spanOCB> and your" +
           " purchase will be shipped to <spanOCB><b>" + custAddress + "</b></spanOCB>." +
              " Please check your email:<spanOCB><b> " + custEmail + " </spanOCB></b>for the receipt!";
        }

    }
}