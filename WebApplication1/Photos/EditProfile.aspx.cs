using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flickr;
using Flickr.Models;

namespace WebApplication1.Photos
{
    
    public partial class EditProfile : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            //this.lblHead.Visible = false;
            //this.imgUpload.Visible = false;

            if (!Page.IsPostBack)
            {
                DatabaseHandler dbHandler = new DatabaseHandler();
                User user = new User();
                user = dbHandler.getDetailForUserEditing(Session["currUser"].ToString());
                //profilepicture.ImageUrl = user.ProfilePhotoPath;
                TextFirstName.Text = user.FirstName;
                TextLastName.Text = user.LastName;
                TextEmail.Text = user.EmailID;
               // ProfileImage.ImageUrl = user.ProfilePhotoPath;
                 DropDownList1.Text=  user.Question;
                FormSuccess.Visible = false;
                TextAnswer.Text = user.Answer;
               // this.lblHead.Visible = false;
               // this.imgUpload.Visible = false;
            }
            

        }

  
        protected void Update_Click(object sender, EventArgs e)
        {
            User user = new User();
            user.FirstName = this.TextFirstName.Text;
            user.LastName = this.TextLastName.Text;
            user.EmailID = this.TextEmail.Text;
            user.Question = DropDownList1.SelectedValue;
            user.Answer = this.TextAnswer.Text;
            FormSuccess.Text = "Your profile successfuly Updated!";
            FormSuccess.Visible = true;
            Update.Enabled = false;
            user.UserName = Session["currUser"].ToString();
            DatabaseHandler dbHandler = new DatabaseHandler();
            dbHandler.updateUserDetails(user);
        }

        protected void TextFirstName_TextChanged(object sender, EventArgs e)
        {
           

        }

        protected void TextLastName_TextChanged(object sender, EventArgs e)
        {
           
        }

        protected void TextEmail_TextChanged(object sender, EventArgs e)
        {
           
        }


        /*protected void btnUpload_Click(object sender, EventArgs e)
        {
            string fileFullname = this.filUpload.PostedFile.FileName;
            string dataName = DateTime.Now.ToString("yyyy-MM-dd hh-mm-ss");
            string fileName = fileFullname.Substring(fileFullname.LastIndexOf("\\") + 1);
            string type = fileFullname.Substring(fileFullname.LastIndexOf(".") + 1);
            if (filUpload.PostedFile.ContentType.ToUpper().IndexOf("IMAGE") > -1)
            {
                System.Drawing.Image img = System.Drawing.Image.FromStream(filUpload.PostedFile.InputStream);
                int Width = img.Width;
                int Height = img.Height;

                if (Width > 1000 || Height > 1000 || filUpload.PostedFile.ContentLength > 1024 * 1024 * 200)
                {
                    this.lblStatus.Text = "The image size is too large!";
                }
                else
                {
                    if (type == "jpg" || type == "gif" || type == "bmp" || type == "JPG" || type == "GIF")
                    {
                        // My code for Access right 
                        

                        // Murugun code
                        //Photo photo = new Photo();
                        DatabaseHandler dbHandler = new DatabaseHandler();
                        String photopath;
                        string ImagePath = "~/Images/";
                        string sPath = Server.MapPath(ImagePath) + dataName + fileName;
                        string imgPath = ImagePath + dataName + fileName;
                        this.filUpload.PostedFile.SaveAs(sPath);
                        //photo.PhotoName = photoname.Text;
                        photopath = imgPath;
                        //photo.UploadedDate = DateTime.Now;
                        //photo.UserName = Session["currUser"].ToString();
                        //photo.Description = TextBox2.Text;
                        //dbHandler.AddNewPhoto(photo, access);
                        dbHandler.uploadUserProfilePicture(Session["currUser"].ToString(), photopath);
                        this.lblStatus.Text = "The image is uploaded Successfully!";
                        this.imgUpload.Visible = true;
                        this.imgUpload.ImageUrl = imgPath;
                        this.lblHead.Visible = true;
                    }
                    else
                    {
                        this.lblStatus.Text = "File type is not right!";
                    }
                }
            }
            else
            {
                this.lblStatus.Text = "The uploaded file is not a image file!";
            }

        }*/

        

      


    }
}