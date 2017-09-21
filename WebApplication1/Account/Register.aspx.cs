using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flickr.Models;

namespace Flickr.Account
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void CreateUserButton_Click(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                if (Page.IsValid)
                {
                    //============================Is Username Unique

                    DatabaseHandler dbh = new DatabaseHandler();

                    Boolean flag = dbh.isUsernameExists(UserName.Text);

                    if (flag)
                    {
                        usernameavailability.Text = "User with this name already exists.. Select any other name..";

                    }
                    else
                    {
                        // ===========================
                        string imgPath = null;
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
                                CustomValidator.ErrorMessage = "The image size is too large!";
                            }
                            else
                            {
                                if (type == "jpg" || type == "gif" || type == "bmp" || type == "JPG" || type == "GIF")
                                {
                                    Photo photo = new Photo();
                                    string ImagePath = "~/ProfilePhotos/";
                                    string sPath = Server.MapPath(ImagePath) + dataName + fileName;
                                    imgPath = ImagePath + dataName + fileName;
                                    this.filUpload.PostedFile.SaveAs(sPath);
                                    photo.PhotoName = fileName;
                                    photo.PhotoPath = imgPath;
                                    photo.UploadedDate = DateTime.Now;
                                    CustomValidator.ErrorMessage = "The image is uploaded Successfully!";
                                }
                                else
                                {
                                    CustomValidator.ErrorMessage = "File type is not right!";
                                }
                            }
                        }
                        else
                        {
                            CustomValidator.ErrorMessage = "The uploaded file is not a image file!";
                        }

                        User user = new User();
                        user.UserName = UserName.Text;
                        user.EmailID = Email.Text;
                        user.Password = Password.Text;
                        if (imgPath != null)
                            user.ProfilePhotoPath = imgPath;
                        DatabaseHandler dbHandler = new DatabaseHandler();
                        dbHandler.AddNewUser(user);
                        Response.Redirect("Login.aspx");
                    }
                }
            }
        }
    }
}
