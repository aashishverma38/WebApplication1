using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flickr;
using Flickr.Models;

namespace WebApplication1.Account
{
    public partial class WebForm1 : System.Web.UI.Page
    {
    

       
        protected void Page_Load(object sender, EventArgs e)
        {

            
            if (!Page.IsPostBack)
            {
                ForgotPassword.Visible = false;
               
            }
           
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            DatabaseHandler dbHandler = new DatabaseHandler();
           string UserName = TextUserName.Text;
            User user = new User();
           bool UserNameValid = dbHandler.CheckUserName(UserName);
           if (UserNameValid)
           {
               user = dbHandler.getDetailForUserEditing(UserName);
               UserNameSuccess.Text = "User Name Exist!";
               TextQuestion.Text = user.Question;
               ForgotPassword.Visible = true;
               UserNameTable.Enabled = false;
               
           }
           else
           {
               UserNameSuccess.Text = "Invalid User Name";
           }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (UserNameSuccess.Text.Equals("User Name Exist!") && (!TextQuestion.Text.Equals(null)))
            {
                DatabaseHandler dbHandler = new DatabaseHandler();
                
                string Answer = TextAnswer.Text;
                User user = new User();
                user.UserName = TextUserName.Text; 
                user.Answer = Answer;
                if (dbHandler.CheckAnswer(user))
                {
                    string password = TextConfirmPassword.Text;
                    dbHandler.updatePassword(password, user.UserName);
                    FormSuccess.Text = "Success! Password Changed";
                    Button1.Enabled = false;
                }
                else
                {
                    FormSuccess.Text = "Answer is not matched";
                }

                
                
            }


        }



      
    }
}