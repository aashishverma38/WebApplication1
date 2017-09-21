using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flickr.Photos
{
    public partial class MyGalleries : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void someaction(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "coverphotoclick")
            {
                Label l = (Label)e.Item.FindControl("GalleryNameLabel");
                String galleryname = l.Text;
                Session.Add("galleryname",galleryname);
                Response.Redirect("AllGalleryPhotos.aspx", true);
            }


            if (e.CommandName == "deletegallery")
            {
                Label l = (Label)e.Item.FindControl("GalleryNameLabel");
                String galleryname = l.Text;
                Label l1 = (Label)e.Item.FindControl("CoverPhotoLabel");
                String coverphoto = l1.Text;
                DatabaseHandler dbh = new DatabaseHandler();
                dbh.deleteThisGallery(Session["currUser"].ToString(),galleryname,coverphoto);
                Response.Redirect("MyGalleries.aspx", true);
            }
        }


    }
}