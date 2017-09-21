using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flickr
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if ((Session["currUser"] == null))
            {
                NavigationMenuCommon.Visible = true;
                NavigationMenuUser.Visible = false;
                NavigationMenuAdministrator.Visible = false;
            }
            else
            {
                String User = Session["currUser"].ToString();
                if (User == "Administrator")
                {
                    NavigationMenuCommon.Visible = false;
                    NavigationMenuUser.Visible = false;
                    NavigationMenuAdministrator.Visible = true;
                }
                else
                {
                    NavigationMenuAdministrator.Visible = false;
                    NavigationMenuCommon.Visible = false;
                    NavigationMenuUser.Visible = true;
                }
            }
        }
        protected void lnkbtnLogout_Click(object sender, EventArgs e)
        {
            Session["currUser"] = null;
            Response.Redirect("~/Default.aspx");
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

            Response.Redirect("/TermsAndCondition.aspx");
                
        }

        protected void ContactAdministrator_Click(object sender, EventArgs e)
        {
            Response.Redirect("/help.aspx");
           
        }

     
    }
}

