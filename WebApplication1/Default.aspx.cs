using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flickr
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DatabaseHandler dbh = new DatabaseHandler();
            //Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //Response.Cache.SetNoStore();
            //Response.AppendHeader("pragma", "no-cache");
            if (Session["currUser"] != null)
            {
                string ProfilePhotoPath = dbh.GetProfilePhotoPath(Session["currUser"].ToString());
                if (ProfilePhotoPath != null)
                {
                    imgProfile.ImageUrl = ProfilePhotoPath;
                    imgProfile.BorderWidth = 2;

                    String username = Session["currUser"].ToString();
                    List<String> photospath = dbh.userPhotosForHomePage(username);
                    if (photospath == null)
                    {
                        userphotoslabel.Text = "YOU DONT HAVE ANY UPLOADED PHOTOS.";
                    }
                    else
                    {
                        TableRow tr = new TableRow();
                        for (int i = 0; (i < photospath.Count) && (i < 5); i++)
                        {
                            Image image = new Image();
                            image.Width = 150;
                            image.Height = 150;
                            
                            image.ImageUrl = photospath[i];

                            TableCell td = new TableCell();
                            td.Controls.Add(image);
                            tr.Cells.Add(td);
                        }
                        this.imageTable.Rows.Add(tr);
                    }
                }
            }           
        }
    }
}
