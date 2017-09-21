using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flickr.Models;

namespace Flickr.Photos
{
    public partial class Photostream : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //this.ListView1.FixedWidth = true;
            //DatabaseHandler dbHandler = new DatabaseHandler();
            //List<Photo> photos = dbHandler.GetMyPhotostream(Session["currUser"].ToString());
            //int numbCols = 4;
            //int numbRows = photos.Count / numbCols;
            //if (photos.Count % numbCols != 0)
            //{
            //    numbRows += 1;
            //}
            //int count = 0;
            //for (int currRow = 0; ( currRow < numbRows ) && (count < photos.Count); currRow++)
            //{
            //    TableRow tr = new TableRow();
            //    for (int currCol = 0; ( currCol < numbCols ) && ( count < photos.Count ); currCol++)
            //    {
            //        TableCell td = new TableCell();
            //        Image img = new Image();
            //        Label access = new Label();
            //        DropDownList ddl = new DropDownList();
            //        Button b = new Button();

            //        access.Text = photos[count].accessright;
                    
            //        b.Text = "Change Access Property Here";
            //        ddl.Items.Add("--Select to change Access right--");
            //        ddl.Items.Add("Share with Friends");
            //        ddl.Items.Add("Private");
            //        ddl.Items.Add("Public");

            //        if (ddl.AutoPostBack)
            //        {
            //            dbHandler.changeAccessibility(photos[count],ddl.Text);
            //        }

            //        img.ImageUrl = "~/" + photos[count].PhotoPath;
            //        img.Width = 120;
            //        img.Height = 120;
            //        img.BorderWidth = 2;
                                        
            //        td.Controls.Add(img);
            //        td.Controls.Add(access);
            //        td.Controls.Add(ddl);
            //        //td.Controls.Add(b);
            //        tr.Cells.Add(td);
            //        count++;
            //    }
            //    this.tblPhotostream.Rows.Add(tr);
            //}
        }

        protected void someAction(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "DeletePhoto")
            {
                Label photopath = (Label) e.Item.FindControl("PhotoPathLabel");
                Label accessright = (Label) e.Item.FindControl("AccessRightLabel");

                string photoPath = photopath.Text;
                string accessRight = accessright.Text;

                DatabaseHandler db = new DatabaseHandler();
                db.deleteUserPhoto(photoPath,accessRight);
                Response.Redirect("Photostream.aspx",true);


            }
            else if (e.CommandName == "imageclick")
            {
                Label imagepath = (Label)e.Item.FindControl("PhotoPathLabel");
                String photopath = imagepath.Text;
                Session.Add("photopath", photopath);
                Response.Redirect("Phototags.aspx", true);                
            }
        }
        
    }
}