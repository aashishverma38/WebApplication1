using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flickr;

namespace WebApplication1.Photos
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DatabaseHandler dbHandler = new DatabaseHandler();
            string password = TextOldPassword.Text;
            string newPassword = TextNewPassword.Text;
            string confirmPassword = TextConfirmPassword.Text;
            bool newAndConfirmPasswordMatch = newPassword.Equals(confirmPassword);
            bool valid = dbHandler.isPasswordMatchWithCurrentPassword(Session["currUser"].ToString(),password);
            if (valid && newAndConfirmPasswordMatch)
            {
                dbHandler.updatePassword(confirmPassword, Session["currUser"].ToString());
                FormSuccess.Text = "Password Changed";
            }
            else
            {
                FormSuccess.Text = "Old Password is not Valid";
            }
        }
    }
}