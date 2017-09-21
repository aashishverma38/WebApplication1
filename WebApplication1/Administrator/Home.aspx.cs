using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flickr;

namespace WebApplication1.Administrator
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DatabaseHandler dbh = new DatabaseHandler();
            if (Session["currUser"] != null)
            {
                string ProfilePhotoPath = dbh.GetProfilePhotoPath(Session["currUser"].ToString());
                imgProfile.ImageUrl = ProfilePhotoPath;
                imgProfile.BorderWidth = 2;
            }
             int numbOFUser = dbh.getNumbOfUsers();
             NoOfUser.Text = "" + numbOFUser;
             int numbOFPhotos = dbh.getNumbOfPhotos();
             NoOfPhotos.Text = "" + numbOFPhotos;
             int numbOfSets = dbh.getNumbOfSets();
             NoOfSets.Text = "" + numbOfSets;
             int numbOfGallaries = dbh.getNumbOfGalleries();
             NoOfGallaries.Text = "" + numbOfGallaries;
 

        }
    }
}