using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flickr;
using WebApplication1.Models;

namespace WebApplication1.Mail
{
    public partial class ShowSentBoxEmail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DatabaseHandler dbHandler = new DatabaseHandler();
            Email email = dbHandler.getEmail(Session["currEmail"].ToString());
            SenderName.Text = email.Sender;
            Subject.Text = email.Subject;
            Message.Text = email.Body;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DatabaseHandler dbHandler = new DatabaseHandler();
            dbHandler.changeSenderBit(Session["currEmail"].ToString());
            Button1.Enabled = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Mail/SentBox.aspx");
        }
    }
}