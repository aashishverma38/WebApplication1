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
    public partial class InBox : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

      
        protected void ListView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
        protected void someaction(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Show")
            {
                HiddenField EmailID = (HiddenField)e.Item.FindControl("EmailID");
                 string emailID =   EmailID.Value;

                 DatabaseHandler dbHandler = new DatabaseHandler();
                 Email email =  dbHandler.getEmail(emailID);
                 if (dbHandler.CheckEmail(emailID))
                 {
                     Session["currEmail"] = emailID;
                     Response.Redirect("~/Mail/ShowEmail.aspx");
                 }

            }
        }
    }
}