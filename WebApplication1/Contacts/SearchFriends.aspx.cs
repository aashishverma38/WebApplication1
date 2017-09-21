using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flickr.Contacts
{
    public partial class SearchFriends : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddFriend(object sender, ListViewCommandEventArgs e)
        {
            Label lblUserName = (Label)e.Item.FindControl("UserNameLabel");
            if (e.CommandName == "SendFriendRequest")
            {
                DatabaseHandler dbHandler = new DatabaseHandler();
                dbHandler.SendFriendRequest(Session["currUser"].ToString(),lblUserName.Text);
                Button btn = (Button)e.CommandSource;
                btn.Text = "Friend Request Sent";
                btn.Enabled = false;
            }
        }
    }
}