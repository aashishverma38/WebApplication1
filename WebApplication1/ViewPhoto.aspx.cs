using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flickr.Models;

namespace Flickr
{
    public partial class ViewPhoto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DatabaseHandler dbh = new DatabaseHandler();
            Photo p = dbh.getAllPhotoDetails(Session["friendname"].ToString(), Session["friendsphotopath"].ToString());
            String tag = dbh.getThisPhotoTags(Session["friendname"].ToString(), Session["friendsphotopath"].ToString());

            username.Text = p.UserName;
            photoname.Text = p.PhotoName;
            picture.ImageUrl = p.PhotoPath;
            description.Text = p.Description;

            String[] seperatetags = tag.Split(',');
            //TableRow tr = new TableRow();
            String tagss = "";
            for (int i = 0; i < seperatetags.Length; i++)
            {
                tagss = tagss + seperatetags[i] + "   ";
            }
            //this.tagstable.Rows.Add(tr); 
            tags.Text = tagss;


        }
    }
}