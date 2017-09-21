using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flickr;

namespace WebApplication1.Contacts
{
    public partial class Contacts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          //  if (!Page.IsPostBack)
          //  {
               

         //   }
        }
        protected void someaction(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                Label FriendNameLabel = (Label)e.Item.FindControl("FriendNameLabel");

              string FriendName = FriendNameLabel.Text;
              string UserName = Session["currUser"].ToString();

              DatabaseHandler dbHandler = new DatabaseHandler();
              dbHandler.DeleteFriend(UserName, FriendName);
              Button DeleteButton = (Button)e.Item.FindControl("Delete");
             DeleteButton.Enabled = false;
             DeleteButton.Text = "Deleted";
            //    Response.Redirect("EditProfile.aspx", true);
            }

            if (e.CommandName == "imageclick")
            {
                Label l1 = (Label)e.Item.FindControl("lab");
                String profilepic = l1.Text.ToString();
                Label l2 = (Label)e.Item.FindControl("FriendNameLabel");
                String friendname = l2.Text.ToString();
                
                //Session.Add("profilepic", profilepic);
                Session.Add("friendname", friendname);
                Response.Redirect("~/FriendsProfile.aspx", true);


            }            
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

    }
}