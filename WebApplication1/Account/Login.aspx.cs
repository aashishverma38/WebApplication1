using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flickr.Models;
using System.Web.Security;

namespace Flickr.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void LoginButton_Click(object sender, EventArgs e)
        {
            if( Page.IsPostBack ) 
            {
                if (Page.IsValid)
                {
                    User user = new User();
                    user.UserName = UserName.Text;
                    user.Password = Password.Text;
                    DatabaseHandler dbHandler = new DatabaseHandler();
                    if (dbHandler.CheckLogin(user))
                    {
                        Session["currUser"] = user.UserName;
                        if (user.UserName == "Administrator")
                        { Response.Redirect("~/Administrator/Home.aspx"); }
                        else
                        {
                            //Session.Add("currUser",user);
                            Response.AddHeader("Refresh", Convert.ToString((Session.Timeout * 0)));
                            Response.Cache.SetCacheability(HttpCacheability.NoCache);
                            Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
                            Response.Cache.SetNoStore();

                            Session.Add("fromReply", "no");
                            Response.CacheControl = "no-cache";
                            Response.Redirect("~/Default.aspx");
                        }
                    }
                    else
                    {
                        FailureText.Text = "Your login attempt was not successful. Please try again.";
                        UserName.Focus();
                    }        
                }
            }
        }
    }
}
