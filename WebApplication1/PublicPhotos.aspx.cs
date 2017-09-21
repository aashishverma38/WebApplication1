using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class PublicPhotos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        protected void someaction(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "seeImage")
            {
                ImageButton button = (ImageButton)e.Item.FindControl("ImageButton1");
                string photoPath = button.ImageUrl;
                string backPage = "~/PublicPhotos.aspx";
                Session.Add("photoName", photoPath);
                Session.Add("back", backPage);
                Response.Redirect("~/photoZoom.aspx", true);
                      



            }
           

        
        }
    }
}