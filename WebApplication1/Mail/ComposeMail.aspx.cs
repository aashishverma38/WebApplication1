using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;
using Flickr;

namespace WebApplication1.Mail
{
    public partial class ComposeMail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
                SuccessText.Visible = false;
                FaiureText.Visible = false;
                SuccessText0.Visible = false;
                FaiureText0.Visible = false;
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
                        SuccessText0.Visible = true;
                        Button1.Enabled = false;
                        FaiureText.Visible = false;
                        FaiureText0.Visible = false;
                    }
                    else
                    {
                        FaiureText.Visible = true;
                        FaiureText0.Visible = true;
                        SuccessText.Visible = false;
                    }


                }
            
        
    }
}