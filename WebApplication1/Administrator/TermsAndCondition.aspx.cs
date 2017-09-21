using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flickr;

namespace WebApplication1.Administrator
{
    public partial class TermsAndCondition : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DatabaseHandler dbHandler = new DatabaseHandler();
                TextBox1.Text = dbHandler.selectTermsAndCondition();
                Success.Visible = false;
            }

        }

      

        protected void Button1_Click(object sender, EventArgs e)
        {
           string TermsAndCond =  TextBox1.Text;
           DatabaseHandler dbHandler = new DatabaseHandler();
           dbHandler.updateTermsAndCondition(TermsAndCond);
           Button1.Enabled = false;
           Success.Visible = true;
        }
    }
}