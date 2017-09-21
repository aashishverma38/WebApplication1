using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace Flickr.Photos
{
    public partial class Sets : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {               
                createsettable.Visible = false;
                saveset.Visible = false;
                //cancelset.Visible = false;
            }
            
            String username = Session["currUser"].ToString();
            DatabaseHandler dbh = new DatabaseHandler();
            int setnumber = dbh.userNumberOfSets(username);
            if (setnumber == 0)
                numberofsets.Text = "You have no Uploaded sets.";
            else
            {
                numberofsets.Text = "You have  " + setnumber.ToString() + "  uploaded sets";
                //List<String> setnames = dbh.getAllSetNames(username);

                
                //TableRow tr = new TableRow();
                //tr.Width = 80;
                //tr.Height = 80;
                //for (int i = 0; i < setnames.Count; i++)
                //{
                //    TableCell td = new TableCell();
                //    Table table = new Table();
                //    table.BorderWidth = 1;
                    
                //        TableRow tr1 = new TableRow();
                //        // Set name

                //        Label l = new Label();
                //        l.Text = "Label";
                //        l.Font.Size = 22;
                //        TableCell td1 = new TableCell();
                //        td1.Controls.Add(l);
                //        tr1.Cells.Add(td1);

                //        TableRow tr2 = new TableRow();
                //        // Set first Photo

                //        String photopath;
                //        photopath = dbh.getFirstPhotoOfSet(username, setnames[i]);
                //        Image setPhoto = new Image();
                //        setPhoto.ImageUrl = photopath;
                //        setPhoto.Width = 80;
                //        setPhoto.Height = 80;
                //        TableCell td2 = new TableCell();
                //        td2.Controls.Add(setPhoto);
                //        tr2.Cells.Add(td2);
                //        // Set Number of Photos
                        

                //        table.Rows.Add(tr1);
                //        table.Rows.Add(tr2);
                    
                //    td.Controls.Add(table);                    
                //}
                //this.setstable.Rows.Add(tr);


                if (!Page.IsPostBack)
                {
                    String photoname;
                    String photopath;
                    Hashtable pair = dbh.getDropDownNames(Session["currUser"].ToString());
                    IDictionaryEnumerator ide = pair.GetEnumerator();
                    while(ide.MoveNext())
                    {
                        photoname = ide.Value.ToString();
                        photopath = ide.Key.ToString();
                        
                        photonamesDropDown.Items.Insert(0,new ListItem(photoname,photopath));

                    }
                }

            }
        }


        protected void someaction(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "coverphotoclick")
            {
                Label coverphotopathfromui = (Label)e.Item.FindControl("CoverPhotoLabel");
                Label setnamefromui = (Label)e.Item.FindControl("Label1");
                String coverphoto = coverphotopathfromui.Text.ToString();
                String setname = setnamefromui.Text.ToString();
                Label setId = (Label)e.Item.FindControl("Label2");
                Session.Add("coverphoto",coverphoto);
                Session.Add("setID",setId.Text);
                Session.Add("setname",setname);

                Response.Redirect("AllSetPhotos.aspx", true);
            }

            if (e.CommandName == "deleteset")
            {
                Label coverphotopathfromui = (Label)e.Item.FindControl("CoverPhotoLabel");

                Label setnamefromui = (Label)e.Item.FindControl("Label1");
                String coverphoto = coverphotopathfromui.Text.ToString();
                String setname = setnamefromui.Text.ToString();
                Label setId = (Label)e.Item.FindControl("Label2");
                String username = Session["currUser"].ToString();
                Session.Add("coverphoto", coverphoto);
                Session.Add("setID", setId.Text);

                DatabaseHandler dbh = new DatabaseHandler();
                dbh.deleteuserSet(username,setname,coverphoto);
                Response.Redirect("Sets.aspx", true);
            }

        }


        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            String photopath = photonamesDropDown.SelectedValue.ToString();
            


            photopreview.Text = "Your Set cover photo ";
            coverphoto.ImageUrl = photopath;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Button1.Enabled = false;

            createsettable.Visible = true;
            saveset.Visible = true;
            //cancelset.Visible = true;
        }

        protected void saveset_Click(object sender, EventArgs e)
        {

            String username = Session["currUser"].ToString();
            String usersetname = setname.Text;
            String usercoverphoto = photonamesDropDown.Text;

            DatabaseHandler dbh = new DatabaseHandler();
            dbh.createUserSet(username,usersetname,usercoverphoto);
            setcreatestatus.Text = "Created a set with name  " + usersetname;
            Response.Redirect("Sets.aspx",true);
        }








        //protected void cancelcreateset(object sender, EventArgs e)
        //{
        //    RequiredFieldValidator1.IsValid = true;
        //    RequiredFieldValidator2.IsValid = true;
        //    //if (!Page.IsValid)
        //    {
        //        createsettable.Visible = false;
        //        saveset.Visible = false;
        //        cancelset.Visible = false;
        //        Button1.Enabled = true;
        //    }

        //}


        //protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //   // if (Page.IsPostBack)
        //    {
        //        String photopath = null;

        //        DatabaseHandler dbh = new DatabaseHandler();
        //        String photoname = DropDownList1.Text;
        //        photopath = dbh.getUserCoverPhoto(Session["currUser"].ToString(), photoname);

        //        //coverphoto.Width = 80;
        //        //coverphoto.Height = 80;

        //        coverphoto.ImageUrl = photopath;
        //        Label1.Text = photopath;
        //    }
        //}

        //protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    Label1.Text = DropDownList2.SelectedItem.Value;
        //}

    }
}