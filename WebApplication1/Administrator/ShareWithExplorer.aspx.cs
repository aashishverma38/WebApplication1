using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flickr;

namespace WebApplication1.Administrator
{
    public partial class ShareWithExplorer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            { 

            
            }

        }
        protected void someaction(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "seeImage")
            {

                ImageButton button = (ImageButton)e.Item.FindControl("ImageButton1");
                string photoPath = button.ImageUrl;
                string backPage = "~/PublicPhotos.aspx";
                Session.Add("photoName", photoPath);
                Session.Add("back", backPage);
                Response.Redirect("~/photoZoom.aspx", true);




            }
            if (e.CommandName == "seeUser")
            {
                LinkButton button = (LinkButton)e.Item.FindControl("LinkButton1");
                String friendname = button.Text;
                Session.Add("friendname", friendname);
                Response.Redirect("~/FriendsProfile.aspx", true);
            }

            if (e.CommandName == "shareExplorer")
            {
                Button button = (Button)e.Item.FindControl("ShareWithExplorer");
                string photoPath = button.Text;
                DatabaseHandler dbHandler = new DatabaseHandler();
                dbHandler.shareWithExplorer(photoPath);
                button.Enabled = false;

            }
            if (e.CommandName == "unShareExplorer") {
                Button button = (Button)e.Item.FindControl("UnShareWithExplorer");
                string photoPath = button.Text;
                DatabaseHandler dbHandler = new DatabaseHandler();
                dbHandler.unShareWithExplorer(photoPath);
                button.Enabled = false;
            
            
            }


        }
    }
}