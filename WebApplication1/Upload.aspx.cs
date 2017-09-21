using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flickr.Models;

namespace Flickr
{
    public partial class Upload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.lblHead.Visible = false;
            this.imgUpload.Visible = false;
        }

        protected void btnUpload_Click(object sender, EventArgs e)
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
                        String access = "";
                        if(access1.Checked)
                            access = access1.Text.ToString();
                        else if(access2.Checked)
                            access = access2.Text.ToString();
                        else if(access3.Checked)
                            access = access3.Text.ToString();

                        // Murugun code
                        Photo photo = new Photo();
                        DatabaseHandler dbHandler = new DatabaseHandler();
                        string ImagePath = "~/Images/";
                        string sPath = Server.MapPath(ImagePath) + dataName + fileName;
                        string imgPath = ImagePath + dataName + fileName;
                        this.filUpload.PostedFile.SaveAs(sPath);
                        photo.PhotoName = photoname.Text;
                        photo.PhotoPath = imgPath;
                        photo.UploadedDate = DateTime.Now;
                        photo.UserName = Session["currUser"].ToString();
                        photo.Description = TextBox2.Text;
                        dbHandler.AddNewPhoto(photo,access);
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

        }
    }
}