using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flickr.Models;

namespace Flickr
{
    public partial class FriendsProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            favouritestatus.Text = "";
            String friendname = Session["friendname"].ToString();
            DatabaseHandler dbh = new DatabaseHandler();
            
            User friend = dbh.getFriendDetails(friendname);
            friendsname.Text = friend.UserName;
            profilepic.ImageUrl = friend.ProfilePhotoPath;
            friendemail.Text = friend.EmailID;

            if (dbh.isThisAbuseProfile(Session["currUser"].ToString(), Session["friendname"].ToString()))
            {
                abusebutton.Text = "ABUSIVE PROFILE";
                abusebutton.Enabled = false;
            }
            else
            {
                abusebutton.Text = "REPORT ABUSE";
                abusebutton.Enabled = true;
            }

        }

        protected void someaction(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "favourite")
            {
                Label l1 = (Label)e.Item.FindControl("PhotoNameLabel");
                Label l2 = (Label)e.Item.FindControl("PhotoPathLabel");

                String photoname = l1.Text.ToString();
                String photopath = l2.Text.ToString();
                String username = Session["currUser"].ToString();

                DatabaseHandler dbh = new DatabaseHandler();
                Boolean flag =  dbh.addToFavourites(username,photoname, photopath);
                
                if (flag)
                    favouritestatus.Text = "This Photo is already your Favourite..";
                else
                    favouritestatus.Text = "Photo is added to your Favourites..";

            }

            if (e.CommandName == "addtogallery")
            {
                Label l3 = (Label)e.Item.FindControl("PhotoNameLabel");
                Label l4 = (Label)e.Item.FindControl("PhotoPathLabel");
                
                String photoname = l3.Text.ToString();
                Session.Add("photoname", photoname);
                String photopath = l4.Text.ToString();
                Session.Add("photopath",photopath);
                //String username = Session["currUser"].ToString();

                Response.Redirect("Photos/GalleriesNew.aspx", true);
            }

            if (e.CommandName == "imageclick")
            {
                Label l1 = (Label)e.Item.FindControl("PhotoPathLabel");
                String friendsphotopath = l1.Text;
                Session.Add("friendsphotopath", friendsphotopath);
                Response.Redirect("ViewPhoto.aspx", true);
            }



        }

        protected void abusebutton_Click(object sender, EventArgs e)
        {
            abusebutton.Text = "ABUSE REPORTED";
            abusebutton.Enabled = false;

            DatabaseHandler dbh = new DatabaseHandler();
            dbh.reportThisAsAbusive(Session["currUser"].ToString(), Session["friendname"].ToString());

        }



    }
}