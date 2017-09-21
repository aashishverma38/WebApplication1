using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace Flickr.Photos
{
    public partial class CreateNewSet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DatabaseHandler dbh = new DatabaseHandler();
            if (!Page.IsPostBack)
            {
                String photoname;
                String photopath;
                Hashtable pair = dbh.getDropDownNames(Session["currUser"].ToString());
                IDictionaryEnumerator ide = pair.GetEnumerator();
                while (ide.MoveNext())
                {
                    photoname = ide.Value.ToString();
                    photopath = ide.Key.ToString();

                    photonamesDropDown.Items.Insert(0, new ListItem(photoname, photopath));

                }
            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

            String photopath = photonamesDropDown.SelectedValue.ToString();



            photopreview.Text = "Your Set cover photo ";
            coverphoto.ImageUrl = photopath;

        }

        protected void saveset_Click(object sender, EventArgs e)
        {

            String username = Session["currUser"].ToString();
            String usersetname = setname.Text;
            String usercoverphoto = photonamesDropDown.Text;

            DatabaseHandler dbh = new DatabaseHandler();
            if(dbh.isUniqueSetName(Session["currUser"].ToString(), usersetname))
            {
                dbh.createUserSet(username, usersetname, usercoverphoto);
                setcreatestatus.Text = "Created a set with name  " + usersetname + ". Add more photos to your Set..";
                setname.Text = null;
                photonamesDropDown.Text = null;
                saveset.Text = "SET CREATED";
                saveset.Enabled = false;
                //Response.Redirect("Sets.aspx", true);
            }else
            {
                setcreatestatus.Text = "Set with this name already exists. Create with other name.";
            }
        }
    }
}