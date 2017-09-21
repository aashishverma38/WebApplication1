using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flickr.Photos
{
    public partial class GalleriesNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            photopreview.Text = "";
            coverphoto.ImageUrl = "";
            gallerycreatestatus.Text = "";
        }

        protected void creategallery_Click(object sender, EventArgs e)
        {
            DatabaseHandler dbh = new DatabaseHandler();

            if (dbh.isUniqueGalleryName(galleryname.Text.ToString(), Session["currUser"].ToString()))
            {
                dbh.createGalleryAddPhoto(Session["currUser"].ToString(), galleryname.Text, Session["photoname"].ToString(), Session["photopath"].ToString());
                gallerycreatestatus.Text = "Gallery created..";
                photopreview.Text = "Photo is added";
                coverphoto.ImageUrl = Session["photopath"].ToString();
                creategallery.Text = "GALLERY CREATED";
                creategallery.Text = "GALLERY CREATED";
                creategallery.Enabled = false;
                //creategallery.Enabled = false;
                ListView1.Visible = false;
                //Response.Redirect("GalleriesNew.aspx", true);
            }else
            {
                gallerycreatestatus.Text = "Gallery with this name already exists. Create with other name.";
            }
        }


        public void someaction(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "coverphotoclick")
            {
                Label l1 = (Label)e.Item.FindControl("GalleryNameLabel");
                String galleryname = l1.Text;
                Session.Add("galleryname",galleryname);

                Response.Redirect("AllGalleryPhotos.aspx", true);
            }

            if (e.CommandName == "addtogallery")
            {
                Label l2 = (Label)e.Item.FindControl("GalleryNameLabel");
                Label l3 = (Label)e.Item.FindControl("CoverPhotoLabel");
                String coverphoto = l3.Text;

                String galleryname = l2.Text;
                DatabaseHandler dbh = new DatabaseHandler();

                Boolean flag = dbh.addPhotoToGallery(Session["currUser"].ToString(), galleryname, Session["photopath"].ToString(), Session["photoname"].ToString(), coverphoto);
                if (!flag)
                {
                    addstatus.Text = "Photo added to your gallery";
                    //ListView1.Enabled = false;
                    creategallery.Enabled = false;
                    ListView1.Visible = false;
                }
                else
                {
                    addstatus.Text = "Photo already exists in the Gallery..";
                    //ListView1.Enabled = false;
                    creategallery.Enabled = false;
                    ListView1.Visible = false;
                }

            }
        }




    }
}