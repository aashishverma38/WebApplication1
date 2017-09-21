using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flickr.Photos
{
    public partial class Favorites : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void someaction(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "deletephoto")
            {
                Label l1 = (Label)e.Item.FindControl("PhotoNameLabel");
                String photoname = l1.Text;

                Label l2 = (Label)e.Item.FindControl("FavouritePhotoPathLabel");
                String photopath = l2.Text;

                DatabaseHandler dbh = new DatabaseHandler();
                dbh.deleteThisFavouritePhoto(Session["currUser"].ToString(),photoname,photopath);

                Response.Redirect("Favorites.aspx", true);
            }
        }



    }
}