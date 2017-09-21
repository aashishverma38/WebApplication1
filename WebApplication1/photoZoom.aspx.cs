using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flickr;
using Flickr.Models;
using System.Collections;

namespace WebApplication1
{
    public partial class phtotoZoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string photoPath = Session["photoName"].ToString();
                DatabaseHandler dbHandler = new DatabaseHandler();
                Photo photo = dbHandler.getPhotoDetails(photoPath);
                Image1.ImageUrl = photo.PhotoPath;
                username.Text = photo.UserName;
                tag.Text = photo.tags;
                PhotoName.Text = photo.PhotoName;
                User user = new User();
                try
                {
                    user.UserName = Session["currUser"].ToString();
                }
                catch (Exception eex) { }
                if (user.UserName != null)
                {
                    Session["currUser"] = user.UserName;
                    if (user.UserName == "Administrator")
                    {
                        share.Visible = true;
                        unshare.Visible = true;
                        bool isShare = dbHandler.checkShareBit(photoPath);
                        if (isShare)
                        {
                            share.Enabled = false;
                            unshare.Enabled = true;
                        }
                        else
                        {
                            share.Enabled = true;
                            unshare.Enabled = false;
                        }
                    }
                    else
                    {
                        share.Visible = false;
                        unshare.Visible = false;

                    }
                }
                else
                {

                }


            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string backPage = Session["back"].ToString();

           Response.Redirect(backPage, true);
           ArrayList list = new ArrayList();
           list.Add(5);
           list.Add(7);
          
        }

        protected void share_Click(object sender, EventArgs e)
        {
            string photoPath = Session["photoName"].ToString();
            DatabaseHandler dbHandler = new DatabaseHandler();
            dbHandler.shareWithExplorer(photoPath);
            share.Enabled = false;
            unshare.Enabled = true;

        }

        protected void unshare_Click(object sender, EventArgs e)
        {
            string photoPath = Session["photoName"].ToString();
            DatabaseHandler dbHandler = new DatabaseHandler();
            dbHandler.unShareWithExplorer(photoPath);
            unshare.Enabled = false;
            share.Enabled = true;
        }
    }
}