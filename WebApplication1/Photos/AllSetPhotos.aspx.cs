using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flickr.Photos
{
    public partial class AllSetPhotos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            coverphotocheck.Text = "";
        }

        protected void someaction1(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "deletefromset")
            {
                DatabaseHandler dbh = new DatabaseHandler();
                Boolean flag = false;
                Label l = (Label)e.Item.FindControl("Image3");
                String photopath = l.Text.ToString();
                flag = dbh.isThisCoverPhoto(photopath);
                if (flag)
                {
                    coverphotocheck.Text = "Cover Photo cannot be deleted";                    
                }
                else
                {
                    // Delete This Photo
                    dbh.deleteThisFromSet(photopath);
                    Response.Redirect("AllSetPhotos.aspx", true);
                }
            }
        }


        protected void someaction2(object sender, ListViewCommandEventArgs e)
        {
            if(e.CommandName == "addtoset")
            {
                Label l = (Label)e.Item.FindControl("PhotoPathLabel");
                String photopath = l.Text.ToString();
                int setid = int.Parse(Session["setID"].ToString());

                DatabaseHandler dbh = new DatabaseHandler();
                dbh.addThisToSet(setid,photopath);


                Response.Redirect("AllSetPhotos.aspx",true);
            }
        }


    }
}