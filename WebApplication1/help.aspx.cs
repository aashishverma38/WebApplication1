using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flickr;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class help : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             if (!Page.IsPostBack) {
                SuccessText.Visible = false;
                FaiureText.Visible = false;
              
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Email email = new Email();
            email.Sender = Session["currUser"].ToString();

            DatabaseHandler dbHandler = new DatabaseHandler();
            bool Receiver = dbHandler.CheckUserName(ReceiverTextBox.Text);
            if (Receiver == true)
            {
                email.Receiver = ReceiverTextBox.Text;

            }
            else
            {

            }
            email.Subject = SubjectTextBox.Text;
            email.Body = BodyTextBox.Text;
            email.MailDate = DateTime.Now;

            bool success = dbHandler.insertEmail(email);
            if (success)
            {
                SuccessText.Visible = true;
               
                Button1.Enabled = false;
                FaiureText.Visible = false;
               
            }
            else
            {
                FaiureText.Visible = true;
               SuccessText.Visible = false;
            }
        }
    }
}