using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flickr
{
    public partial class Mail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           string name = Session["currUser"].ToString();
           if (name == "Administrator")
           {
               ListView1.Visible = false;
               CMLabel.Visible = false;
           } 
           else
           {
               ListView1.Visible = true;
               CMLabel.Visible = true;
           }
        }

        protected void AcceptFriend(object sender, ListViewCommandEventArgs e)
        {
            Label lblUserName = (Label)e.Item.FindControl("UserNameLabel");
            if (e.CommandName == "AcceptFriendRequest")
            {
                DatabaseHandler dbHandler = new DatabaseHandler();
                dbHandler.AcceptFriendRequest(lblUserName.Text, Session["currUser"].ToString());
                Button btn = (Button)e.CommandSource;
                btn.Text = "Friend Request Accepted";
                btn.Enabled = false;
            }
        }

        

        protected void Compose_Mail_Click(object sender, EventArgs e)
        {
            Response.Redirect("ComposeMail.aspx", true);

        }

        
    }
}