using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flickr;

namespace WebApplication1.Photos
{
    public partial class Phototags : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String photopath = Session["photopath"].ToString();
            Image1.ImageUrl = photopath;
            DatabaseHandler dbh = new DatabaseHandler();
            String tagsfromdb = dbh.getAllPhotoTags(photopath);

            String[] seperatetags = tagsfromdb.Split(',');
            TableRow tr = new TableRow();
            for (int i = 0; i < seperatetags.Length; i++)
            {
                Label l = new Label();
                l.Text = seperatetags[i] + "   ";
                
                TableCell td = new TableCell();
                td.Controls.Add(l);
                tr.Cells.Add(td);                
            }
            this.tagstable.Rows.Add(tr);         
            
        }

        protected void usernewtag_Click(object sender, EventArgs e)
        {
            String photopath = Session["photopath"].ToString();
            String usergiventag = usertag.Text;
            DatabaseHandler dbh = new DatabaseHandler();
            dbh.addTagToPhoto(photopath,usergiventag);
            Response.Redirect("Phototags.aspx", true);

        }
    }
}