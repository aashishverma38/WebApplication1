using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flickr;

namespace WebApplication1
{
    public partial class TermsAndCondition : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DatabaseHandler dbHandler = new DatabaseHandler();
                TermText.Text = dbHandler.selectTermsAndCondition();

                
            }


        }
    }
}