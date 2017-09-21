using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flickr.Photos
{
    public partial class AllGalleryPhotos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            deletestatus.Text = "";
        }

        public void someaction(object sender, ListViewCommandEventArgs e)
        {
            DatabaseHandler dbh = new DatabaseHandler();

            Label l = (Label)e.Item.FindControl("PhotoPathLabel");
            String photopath = l.Text;
            Label l1 = (Label)e.Item.FindControl("PhotoNameLabel");
            String photoname = l1.Text;


            if (e.CommandName == "deletephoto")
            {
                if (dbh.isThisGalleryCoverPhoto(Session["currUser"].ToString(), Session["galleryname"].ToString(), photoname, photopath))
                {
                    deletestatus.Text = "Cover photo can not be deleted..";
                }
                else
                {
                    dbh.deleteThisFromGallery(photopath);
                    Response.Redirect("AllGalleryPhotos.aspx", true);
                }
            }
        }

    }
}