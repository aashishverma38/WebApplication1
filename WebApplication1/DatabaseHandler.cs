using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using Flickr.Models;
using System.Configuration;
using System.Collections;
using WebApplication1.Models;

namespace Flickr
{
    public class DatabaseHandler
    {
        private SqlConnection SqlConn;
        private SqlCommand SqlCmd;
    
        public DatabaseHandler()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["FlickrConnectionString"].ConnectionString;
            SqlConn = new SqlConnection(connectionString);
        }


        public void AddNewPhoto(Photo photo, String accessright)
        {

            SqlConn.Open();
            SqlCmd = new SqlCommand("INSERT INTO Photos(PhotoName, PhotoPath, UserName, AccessRight)"
                + "VALUES('" + photo.PhotoName + "','" + photo.PhotoPath
                              + "','" + photo.UserName + "','" + accessright + "')", SqlConn);
            SqlCmd.ExecuteNonQuery();
            SqlConn.Close();
        }

        

        public bool CheckLogin(User user)
        {
            bool isFlickrUser = false;


            SqlConn.Open();
            SqlCmd = new SqlCommand("Select * From Users", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();

            while (SqlDtr.Read())
            {
                if (SqlDtr["UserName"].ToString() == user.UserName && SqlDtr["Password"].ToString() == user.Password)
                {
                    isFlickrUser = true;
                }
            }

            SqlDtr.Close();
            SqlConn.Close();

            return isFlickrUser;
        }

        public bool CheckEmail(string emailID)
        {
            bool isEmailExist = false;
            SqlConn.Open();
            SqlCmd = new SqlCommand("Select * From Email", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();
            while (SqlDtr.Read())
            {
                if (SqlDtr["MailID"].ToString() == emailID)
                {
                    isEmailExist = true;
                }
            }

            SqlDtr.Close();
            SqlConn.Close();

            return isEmailExist;

        }

        //=================================

        public Boolean isUsernameExists(String username)
        {
            Boolean flag = false;

            SqlConn.Open();
            SqlCmd = new SqlCommand("Select UserName From Users Where UserName='" + username + "'", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();

            if (SqlDtr.Read())
            {
                flag = true;
            }
            SqlDtr.Close();
            SqlConn.Close();


            return flag;
        }


        //===================================

        public void AddNewUser(User user)
        {
            SqlConn.Open();
            SqlCmd = new SqlCommand("INSERT INTO Users(UserName, EmailID, Password, ProfilePhotoPath) "
                + " VALUES('" + user.UserName + "','" + user.EmailID
                              + "','" + user.Password + "','" + user.ProfilePhotoPath + "')", SqlConn);
            SqlCmd.ExecuteNonQuery();
            SqlConn.Close();
        }

        

        public List<Photo> GetMyPhotostream(String UserName)
        {
            List<Photo> photos = new List<Photo>();


            SqlConn.Open();
            SqlCmd = new SqlCommand("Select * From Photos Where UserName = '"
                        + UserName + "'", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();

            while (SqlDtr.Read())
            {
                Photo photo = new Photo();
                photo.PhotoName = SqlDtr["PhotoName"].ToString();
                photo.PhotoPath = SqlDtr["PhotoPath"].ToString();
                photo.Description = SqlDtr["Description"].ToString();
                photo.UserName = SqlDtr["UserName"].ToString();
                photo.accessright = SqlDtr["AccessRight"].ToString();
                photos.Add(photo);
            }

            SqlDtr.Close();
            SqlConn.Close();

            return photos;
        }

        public string getUsernamebyEmailId(String email)
        {
            string username = "";
            try
            {
                SqlConn.Open();
               
                SqlCmd = new SqlCommand("Select * From Users Where EmailID = '" + email + "'",  SqlConn);
                SqlDataReader SqlDtr = SqlCmd.ExecuteReader();

                while (SqlDtr.Read())
                {

                    username = SqlDtr["UserName"].ToString();
                }
                SqlDtr.Close();
                SqlConn.Close();
            }
            catch (Exception e)
            {

            }
            return username;
        }

        public void changeAccessibility(Photo photo, String access)
        {
            SqlConn.Open();
            SqlCmd = new SqlCommand("UPDATE Photos SET AccessRight='" + access + "' WHERE PhotoName='" + photo.PhotoName + "'", SqlConn);
            SqlCmd.ExecuteNonQuery();
            SqlConn.Close();
        }

        public string GetProfilePhotoPath(string UserName)
        {
            string ProfilePhotoPath = null;


            SqlConn.Open();
            SqlCmd = new SqlCommand("Select * From Users Where UserName = '"
                        + UserName + "'", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();

            if (SqlDtr.Read())
            {
                ProfilePhotoPath = SqlDtr["ProfilePhotoPath"].ToString();
            }
            SqlDtr.Close();
            SqlConn.Close();
            return ProfilePhotoPath;
        }

        public void SendFriendRequest(string From, string To)
        {
            SqlConn.Open();
            SqlCmd = new SqlCommand("INSERT INTO Friends(UserName, FriendName, Status) VALUES('"
                + From + "','" + To + "'," + 0 + ")", SqlConn);
            SqlCmd.ExecuteNonQuery();
            SqlConn.Close();
        }

        public bool insertEmail(Email email)
        {
            bool insert = false;
            try
            {
                SqlConn.Open();
                SqlCmd = new SqlCommand("INSERT INTO Email(ReceiverID, SenderID, Subject , Body , Date , ReadBit, SenderBit,ReceiverBit) VALUES('"
                   + email.Receiver + "','" + email.Sender + "','" + email.Subject + "','" + email.Body + "','" + email.MailDate + "'," + 0 + "," + 0 + "," + 0 + ")", SqlConn);
                SqlCmd.ExecuteNonQuery();
                SqlConn.Close();
                insert = true;
            }
            catch (Exception e) { insert = false; }
            return insert;
        }

        public void AcceptFriendRequest(string From, string To)
        {

            SqlConn.Open();
            SqlCmd = new SqlCommand("UPDATE Friends SET Status = 1 WHERE UserName = '"
                + From + "' AND FriendName = '" + To + "'", SqlConn);
            SqlCmd.ExecuteNonQuery();
            SqlConn.Close();
        }

        public void deleteUserPhoto(string photoPath, string accessRight)
        {
            SqlConn.Open();
            SqlCmd = new SqlCommand("DELETE FROM Photos WHERE PhotoPath='" + photoPath + "'", SqlConn);
            SqlCmd.ExecuteNonQuery();
            SqlConn.Close();
        }

        public String getAllPhotoTags(String photopath)
        {
            String tags = null;
            SqlConn.Open();
            SqlCmd = new SqlCommand("Select Tags From Photos Where PhotoPath = '" + photopath + "'", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();

            if (SqlDtr.Read())
            {
                tags = SqlDtr["Tags"].ToString();
            }
            SqlDtr.Close();
            SqlConn.Close();
            return tags;
        }

        public void addTagToPhoto(String photopath, String phototag)
        {
            String tags = null;
            SqlConn.Open();
            SqlCmd = new SqlCommand("Select Tags From Photos Where PhotoPath = '" + photopath + "'", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();

            if (SqlDtr.Read())
            {
                tags = SqlDtr["Tags"].ToString();
            }
            SqlDtr.Close();
            SqlConn.Close();
            tags = tags + phototag;
            SqlConn.Open();
            SqlCmd = new SqlCommand("UPDATE Photos SET Tags='" + tags + "' WHERE PhotoPath='" + photopath + "'", SqlConn);
            SqlCmd.ExecuteNonQuery();
            SqlConn.Close();
        }

        public List<String> userPhotosForHomePage(String username)
        {
            //String photopaths = null;
            //String photospath = "";

            int count = 0;

            SqlConn.Open();
            SqlCmd = new SqlCommand("SELECT PhotoPath FROM Photos WHERE UserName='" + username + "'", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();
            List<String> photos = new List<String>();

            while (SqlDtr.Read() && count <= 5)
            {
                photos.Add(SqlDtr["PhotoPath"].ToString());
                count++;
            }
            if (photos.Count == 0)
            {
                SqlDtr.Close();
                SqlConn.Close();
                return null;
            }
            else
            {
                SqlDtr.Close();
                SqlConn.Close();
                return photos;
            }

        }

        public int userNumberOfSets(String username)
        {
            int numberofsets = 0;

            SqlConn.Open();
            SqlCmd = new SqlCommand("SELECT COUNT(*) FROM UserSets WHERE UserName='" + username + "'", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();

            while (SqlDtr.Read())
            {
                numberofsets = Convert.ToInt16(SqlDtr.GetValue(0));

            }
            SqlDtr.Close();
            SqlConn.Close();

            return numberofsets;
        }


        public List<String> getAllSetNames(String username)
        {
            List<String> setnames = new List<string>();
            SqlConn.Open();
            SqlCmd = new SqlCommand("SELECT SetName FROM UserSets WHERE UserName='" + username + "'", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();

            while (SqlDtr.Read())
            {
                setnames.Add(SqlDtr["SetName"].ToString());

            }
            SqlDtr.Close();
            SqlConn.Close();


            return setnames;
        }


        public String getFirstPhotoOfSet(String username, String setname)
        {
            //Boolean flag = true;
            String coverphoto = null;

            SqlConn.Open();
            SqlCmd = new SqlCommand("SELECT CoverPhoto FROM UserSets WHERE SetID=(SELECT SetID FROM UserSets WHERE SetName='" + setname + "' AND UserName='" + username + "')", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();

            if (SqlDtr.Read())
            {
                coverphoto = SqlDtr["CoverPhoto"].ToString();

            }
            SqlDtr.Close();
            SqlConn.Close();

            return coverphoto;
        }

        public String getNumberOfPhotosInSet(String username, String setname)
        {
            Boolean flag = true;
            String photopath = null;

            SqlConn.Open();
            SqlCmd = new SqlCommand("SELECT PhotoPath FROM SetPhotos WHERE SetID=(SELECT SetID FROM UserSets WHERE SetName='" + setname + "' AND UserName='" + username + "')", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();

            if (SqlDtr.Read() && flag)
            {
                photopath = SqlDtr["PhotoPath"].ToString();
                flag = false;
            }
            SqlDtr.Close();
            SqlConn.Close();

            return photopath;
        }

        //public string getUserCoverPhoto(String username, String photopath)
        //{
        //    String pho = null;

        //    SqlConn.Open();
        //    SqlCmd = new SqlCommand("SELECT PhotoPath FROM Photos WHERE PhotoName='" + photopath + "' AND UserName='" + username + "'", SqlConn);
        //    SqlDataReader SqlDtr = SqlCmd.ExecuteReader();

        //    if (SqlDtr.Read())
        //    {
        //        photopath = SqlDtr["PhotoPath"].ToString();
        //    }
        //    SqlDtr.Close();
        //    SqlConn.Close();

        //    return photopath;
        //}

        public Hashtable getDropDownNames(String username)
        {
            Hashtable pair = new Hashtable();

            SqlConn.Open();
            SqlCmd = new SqlCommand("SELECT PhotoPath,PhotoName FROM Photos WHERE UserName='" + username + "'", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();

            while (SqlDtr.Read())
            {
                pair.Add(SqlDtr["PhotoPath"].ToString(), SqlDtr["PhotoName"].ToString());
            }
            SqlDtr.Close();
            SqlConn.Close();

            return pair;
        }


        // ==========ADDED

        public Boolean isUniqueSetName(String username, String setname)
        {
            Boolean flag = true;

            SqlConn.Open();
            SqlCmd = new SqlCommand("SELECT SetName FROM UserSets WHERE UserName='" + username + "' AND SetName='" + setname + "'", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();

            if (SqlDtr.Read())
            {
                flag = false;
            }
            SqlDtr.Close();
            SqlConn.Close();


            return flag;
        }


        //=========ADDED


        public void createUserSet(String username, String usersetname, String usercoverphoto)
        {
            SqlConn.Open();
            SqlCmd = new SqlCommand("INSERT INTO UserSets(SetName,UserName,CoverPhoto) VALUES('" + usersetname + "','" + username + "','" + usercoverphoto + "')", SqlConn);
            SqlCmd.ExecuteNonQuery();
            SqlCmd = new SqlCommand("INSERT INTO SetPhotos(PhotoPath,SetID) VALUES('" + usercoverphoto + "',(SELECT SetID FROM UserSets WHERE CoverPhoto='" + usercoverphoto + "' AND SetName='" + usersetname + "' AND UserName='" + username + "'))", SqlConn);
            SqlCmd.ExecuteNonQuery();
            SqlConn.Close();
        }

        public void deleteuserSet(String username, String usersetname, String usercoverphoto)
        {
            SqlConn.Open();
            SqlCmd = new SqlCommand("DELETE FROM SetPhotos WHERE SetID=(SELECT SetID FROM UserSets WHERE SetName='" + usersetname + "' AND UserName='" + username + "' AND CoverPhoto='" + usercoverphoto + "')", SqlConn);
            SqlCmd.ExecuteNonQuery();
            SqlCmd = new SqlCommand("DELETE FROM UserSets WHERE SetName='" + usersetname + "' AND UserName='" + username + "' AND CoverPhoto='" + usercoverphoto + "'", SqlConn);
            SqlCmd.ExecuteNonQuery();
            SqlConn.Close();
        }



        public Boolean isThisCoverPhoto(String photopath)
        {
            Boolean flag = false;

            SqlConn.Open();
            SqlCmd = new SqlCommand("SELECT CoverPhoto FROM UserSets WHERE CoverPhoto='" + photopath + "'", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();

            if (SqlDtr.Read())
            {
                flag = true;
            }
            else
                flag = false;

            SqlDtr.Close();
            SqlConn.Close();


            return flag;
        }

        public void deleteThisFromSet(String photopath)
        {
            SqlConn.Open();
            SqlCmd = new SqlCommand("DELETE FROM SetPhotos WHERE PhotoPath='" + photopath + "'", SqlConn);
            SqlCmd.ExecuteNonQuery();
        }

        public void addThisToSet(int setid, String photopath)
        {
            SqlConn.Open();
            SqlCmd = new SqlCommand("INSERT INTO SetPhotos(SetID,PhotoPath) VALUES(" + setid + ",'" + photopath + "')", SqlConn);
            SqlCmd.ExecuteNonQuery();
        }





        //=======================================================================================09-07

        public User getFriendDetails(string friendname)
        {
            User u = new User();
            SqlConn.Open();
            SqlCmd = new SqlCommand("SELECT UserName,EmailID,ProfilePhotoPath FROM Users WHERE UserName='" + friendname + "'", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();

            while (SqlDtr.Read())
            {
                u.UserName = SqlDtr["UserName"].ToString();
                u.EmailID = SqlDtr["EmailID"].ToString();
                u.ProfilePhotoPath = SqlDtr["ProfilePhotoPath"].ToString();
            }
            SqlDtr.Close();
            SqlConn.Close();
            return u;
        }


        public Boolean addToFavourites(String username, String photoname, String photopath)
        {
            Boolean flag = false;

            SqlConn.Open();
            SqlCmd = new SqlCommand("SELECT FavouritePhotoPath FROM Favourites WHERE UserName='" + username + "' AND PhotoName='" + photoname + "' AND FavouritePhotoPath='" + photopath + "'", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();

            if (SqlDtr.Read())
            {
                flag = true;
            }
            SqlDtr.Close();
            SqlConn.Close();

            if (!flag)
            {
                SqlConn.Open();
                SqlCmd = new SqlCommand("INSERT INTO Favourites(UserName,PhotoName,FavouritePhotoPath) VALUES('" + username + "','" + photoname + "','" + photopath + "')", SqlConn);
                SqlCmd.ExecuteNonQuery();
                SqlConn.Close();
            }

            return flag;
        }

        // -------------------- ADDED
        public Boolean isUniqueGalleryName(String galleryname, String username)
        {
            Boolean flag = true;

            SqlConn.Open();
            SqlCmd = new SqlCommand("SELECT GalleryName FROM UserGalleries WHERE UserName='" + username + "' AND GalleryName='" + galleryname + "'", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();

            if (SqlDtr.Read())
            {
                flag = false;
            }
            SqlDtr.Close();
            SqlConn.Close();

            return flag;
        }

        //--------- ADDED

        public void createGalleryAddPhoto(String username, String galleryname, String photoname, String photopath)
        {
            SqlConn.Open();
            SqlCmd = new SqlCommand("INSERT INTO UserGalleries(GalleryName,UserName,CoverPhoto) VALUES('" + galleryname + "','" + username + "','" + photopath + "')", SqlConn);
            SqlCmd.ExecuteNonQuery();
            SqlConn.Close();

            SqlConn.Open();
            SqlCmd = new SqlCommand("SELECT GalleryID FROM UserGalleries WHERE UserName='" + username + "' AND GalleryName='" + galleryname + "' AND CoverPhoto='" + photopath + "'", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();
            int id = 0;
            while (SqlDtr.Read())
            {
                String idstring = SqlDtr["GalleryID"].ToString();
                id = int.Parse(idstring);
            }
            SqlDtr.Close();
            SqlConn.Close();

            SqlConn.Open();
            //SqlConn.Open();
            SqlCmd = new SqlCommand("INSERT INTO GalleryPhotos(GalleryID,PhotoName,PhotoPath) VALUES(" + id + ",'" + photoname + "','" + photopath + "')", SqlConn);
            SqlCmd.ExecuteNonQuery();
            SqlConn.Close();

        }


        public Boolean addPhotoToGallery(String username, String galleryname, String photopath, String photoname, String coverphoto)
        {
            Boolean flag = false;

            SqlConn.Open();
            SqlCmd = new SqlCommand("SELECT GalleryID FROM UserGalleries WHERE UserName='" + username + "' AND GalleryName='" + galleryname + "' AND CoverPhoto='" + coverphoto + "'", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();
            int id = 0;
            while (SqlDtr.Read())
            {
                String idstring = SqlDtr["GalleryID"].ToString();
                id = int.Parse(idstring);
            }
            SqlDtr.Close();
            SqlConn.Close();

            SqlConn.Open();
            SqlCmd = new SqlCommand("SELECT PhotoPath FROM GalleryPhotos WHERE GalleryID=" + id + " AND PhotoPath='" + photopath + "' AND PhotoName='" + photoname + "'", SqlConn);
            SqlDtr = SqlCmd.ExecuteReader();

            if (SqlDtr.Read())
            {
                flag = true;
            }
            SqlDtr.Close();
            SqlConn.Close();

            if (!flag)
            {
                SqlConn.Open();
                SqlCmd = new SqlCommand("INSERT INTO GalleryPhotos(GalleryID,PhotoName,PhotoPath) VALUES((SELECT GalleryID FROM UserGalleries WHERE UserName='" + username + "' AND GalleryName='" + galleryname + "' AND CoverPhoto='" + coverphoto + "'),'" + photoname + "','" + photopath + "')", SqlConn);

                SqlCmd.ExecuteNonQuery();
                SqlConn.Close();
            }

            return flag;
        }


        public void deleteThisGallery(String username, String usergalleryname, String usercoverphoto)
        {
            SqlConn.Open();
            SqlCmd = new SqlCommand("DELETE FROM GalleryPhotos WHERE GalleryID=(SELECT GalleryID FROM UserGalleries WHERE GalleryName='" + usergalleryname + "' AND UserName='" + username + "' AND CoverPhoto='" + usercoverphoto + "')", SqlConn);
            SqlCmd.ExecuteNonQuery();
            SqlCmd = new SqlCommand("DELETE FROM UserGalleries WHERE GalleryName='" + usergalleryname + "' AND UserName='" + username + "' AND CoverPhoto='" + usercoverphoto + "'", SqlConn);
            SqlCmd.ExecuteNonQuery();
            SqlConn.Close();
        }

        //========================================09-07

        //=======================================10-07

        public Boolean isThisGalleryCoverPhoto(String username, String galleryname, String photoname, String photopath)
        {
            Boolean flag = false;
            //SqlDataReader SqlDtr = SqlCmd.ExecuteReader();

            SqlConn.Open();
            SqlCmd = new SqlCommand("SELECT CoverPhoto FROM UserGalleries WHERE CoverPhoto='" + photopath + "' AND UserName='" + username + "' AND GalleryName='" + galleryname + "'", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();

            if (SqlDtr.Read())
            {
                flag = true;
            }
            SqlDtr.Close();
            SqlConn.Close();


            return flag;
        }

        public void deleteThisFromGallery(String photopath)
        {
            SqlConn.Open();
            SqlCmd = new SqlCommand("DELETE FROM GalleryPhotos WHERE PhotoPath='" + photopath + "'", SqlConn);
            SqlCmd.ExecuteNonQuery();
        }


        public Photo getAllPhotoDetails(String username, String photopath)
        {
            Photo p = new Photo();

            SqlConn.Open();
            SqlCmd = new SqlCommand("SELECT PhotoName,Description,Tags FROM Photos WHERE UserName='" + username + "' AND PhotoPath='" + photopath + "'", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();

            while (SqlDtr.Read())
            {
                p.PhotoName = SqlDtr["PhotoName"].ToString();
                p.Description = SqlDtr["Description"].ToString();
                p.PhotoPath = photopath;
                p.UserName = username;
            }
            SqlDtr.Close();
            SqlConn.Close();

            return p;
        }

        public String getThisPhotoTags(String username, String photopath)
        {
            String tags = "";

            SqlConn.Open();
            SqlCmd = new SqlCommand("SELECT Tags FROM Photos WHERE UserName='" + username + "' AND PhotoPath='" + photopath + "'", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();

            while (SqlDtr.Read())
            {
                tags = SqlDtr["Tags"].ToString();
            }
            SqlDtr.Close();
            SqlConn.Close();

            return tags;
        }

        public Boolean isThisAbuseProfile(String username, String friendname)
        {
            Boolean flag = false;

            SqlConn.Open();
            SqlCmd = new SqlCommand("SELECT UserName FROM ReportAbuse WHERE UserName='" + username + "' AND FriendName='" + friendname + "'", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();

            if (SqlDtr.Read())
            {
                flag = true;
            }
            SqlDtr.Close();
            SqlConn.Close();


            return flag;
        }

        public void reportThisAsAbusive(String username, String friendname)
        {
            SqlConn.Open();
            SqlCmd = new SqlCommand("INSERT INTO ReportAbuse(UserName,FriendName) VALUES('" + username + "','" + friendname + "')", SqlConn);

            SqlCmd.ExecuteNonQuery();
            SqlConn.Close();
        }




        //=======================================10-07

        //========================12-07-2011

        public void deleteThisFavouritePhoto(String username, String photoname, String photopath)
        {
            SqlConn.Open();
            SqlCmd = new SqlCommand("DELETE FROM Favourites WHERE UserName='" + username + "' AND PhotoName='" + photoname + "' AND FavouritePhotoPath='" + photopath + "'", SqlConn);
            SqlCmd.ExecuteNonQuery();
        }


        //========================12-07-2011
       
        public bool CheckAnswer(User user)
        {
            bool isAnswerCorrect = false;
            try
            {
                SqlConn.Open();
                SqlCmd = new SqlCommand("Select * From Users", SqlConn);
                SqlDataReader SqlDtr = SqlCmd.ExecuteReader();

                while (SqlDtr.Read())
                {
                    if (SqlDtr["UserName"].ToString() == user.UserName && SqlDtr["Answer"].ToString() == user.Answer)
                    {
                        isAnswerCorrect = true;
                    }
                }

                SqlDtr.Close();

                SqlConn.Close();
            }
            catch (Exception e)
            {
            }
            return isAnswerCorrect;
        }
        public bool CheckUserName(String UserName)
        {    bool isFlickrUser = false;

        try
        {
            SqlConn.Open();
            SqlCmd = new SqlCommand("Select * From Users", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();

            while (SqlDtr.Read())
            {
                if (SqlDtr["UserName"].ToString() == UserName)
                {
                    isFlickrUser = true;
                }
            }

            SqlDtr.Close();

            SqlConn.Close();
        }
        catch (Exception e)
        {
        }

        return isFlickrUser;
        }

       
        public void DeleteFriend(String UserName, String FriendName)
        {
            SqlConn.Open();
             SqlCommand SqlCmd2;
            SqlCmd = new SqlCommand("DELETE FROM Friends WHERE UserName='" + UserName + "' AND FriendName='" + FriendName + "'", SqlConn);
            SqlCmd2 = new SqlCommand("DELETE FROM Friends WHERE UserName='" + FriendName + "' AND FriendName='" + UserName + "'", SqlConn);
            SqlCmd.ExecuteNonQuery();
            SqlCmd2.ExecuteNonQuery();
            SqlConn.Close();
        }

       


        public User getDetailForUserEditing(string UserName)
        {
            User user = new User();
            SqlConn.Open();
            SqlCmd = new SqlCommand("Select * from Users where UserName = '" + UserName + "'", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();
            if (SqlDtr.Read())
            {
                user.FirstName=     SqlDtr["FirstName"].ToString();
                user.LastName =     SqlDtr["LastName"].ToString();
                user.EmailID =      SqlDtr["EmailID"].ToString();
                user.Question =     SqlDtr["Question"].ToString();
                user.Answer =       SqlDtr["Answer"].ToString();
                user.ProfilePhotoPath = SqlDtr["ProfilePhotoPath"].ToString();

            }
            SqlDtr.Close();
            SqlConn.Close();
            return user;
        }

        public void uploadUserProfilePicture(String username, String photopath)
        {
            SqlConn.Open();
            SqlCmd = new SqlCommand("UPDATE Users SET ProfilePhotoPath='" + photopath + "' WHERE UserName='" + username + "'", SqlConn);
            SqlCmd.ExecuteNonQuery();
            SqlConn.Close();
        }



        /// <summary>
        
        /// </summary>
        /// <param name="emailID"></param>
        /// <returns></returns>
        public Email getEmail(string emailID)
        {
            Email email = new Email();

            SqlConn.Open();
            SqlCmd = new SqlCommand("Select * from Email where MailID = '" + emailID + "'", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();
            if (SqlDtr.Read())
            {
                email.MailID = SqlDtr["MailID"].ToString();
                email.Receiver = SqlDtr["ReceiverID"].ToString();
                email.Sender = SqlDtr["SenderID"].ToString();
                email.Subject = SqlDtr["Subject"].ToString();
                email.Body = SqlDtr["Body"].ToString();
                email.MailDate = Convert.ToDateTime(SqlDtr["Date"]);
                email.ReceiverBit = (int)SqlDtr["ReceiverBit"];
                email.SenderBit = (int)SqlDtr["SenderBit"];
                email.ReadBit = (int)SqlDtr["ReadBit"];
            } 
            SqlDtr.Close();
            SqlConn.Close();
            return email;
             }
        public bool isPasswordMatchWithCurrentPassword(string Username,string passwordEnter)
        {
            string password = null;
            bool valid = false;
            SqlConn.Open();
            SqlCmd = new SqlCommand("Select * from Users where UserName = '" + Username + "'", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();
             if (SqlDtr.Read()){
                 password = SqlDtr["Password"].ToString();
                 }
             SqlDtr.Close();
            SqlConn.Close();
            if (password.Equals(passwordEnter))
            {
                valid = true;
            }
            return valid;
        }

        public void updateUserDetails(User user)
        {
            SqlConn.Open();
            SqlCmd = new SqlCommand("UPDATE Users SET EmailID = '" + user.EmailID + "', FirstName = '" + user.FirstName + "',LastName ='" + user.LastName + "',Question='" + user.Question + "',Answer='" + user.Answer + "'  WHERE UserName = '"
                + user.UserName + "'", SqlConn);
            SqlCmd.ExecuteNonQuery();
            SqlConn.Close();
        }


        public void updatePassword(string password,string userName)
        {
            SqlConn.Open();
            SqlCmd = new SqlCommand("UPDATE Users SET Password = '" + password + "' WHERE UserName = '"+ userName + "'", SqlConn);
            SqlCmd.ExecuteNonQuery();
            SqlConn.Close();
        }

        //***************************************************************************************************

        public string selectTermsAndCondition() 
        {
            string TermsAndCond = "";
            string Version = "1";
            SqlConn.Open();
            SqlCmd = new SqlCommand("Select * from TermsAndConditions where Version = '" + Version + "'", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();
            if (SqlDtr.Read())
            {
               TermsAndCond = SqlDtr["TermsAndCondition"].ToString();
             
            }
            SqlDtr.Close();
            SqlConn.Close();

            return TermsAndCond;   
        }


        public void updateTermsAndCondition(String TermsAndCond)
        {
            SqlConn.Open();
            SqlCmd = new SqlCommand("UPDATE TermsAndConditions SET TermsAndCondition = '" + TermsAndCond + "' WHERE Version = " + 1 + "", SqlConn);
            SqlCmd.ExecuteNonQuery();
            SqlConn.Close();
        
        
        }

        //******************************************************************************************************

        public void changeReadBit(string MailID )
        {
        SqlConn.Open();
        SqlCmd = new SqlCommand("UPDATE Email SET ReadBit = " + 1 + " WHERE MailID = '" + MailID + "'", SqlConn);
        SqlCmd.ExecuteNonQuery();
        SqlConn.Close();
        
        }
        public void changeReceiverBit(string MailID)
        {
            SqlConn.Open();
            SqlCmd = new SqlCommand("UPDATE Email SET ReceiverBit = " + 1 + " WHERE MailID = '" + MailID + "'", SqlConn);
            SqlCmd.ExecuteNonQuery();
            SqlConn.Close();
        }

        public void changeSenderBit(string MailID)
        {
            SqlConn.Open();
            SqlCmd = new SqlCommand("UPDATE Email SET SenderBit = " + 1 + " WHERE MailID = '" + MailID + "'", SqlConn);
            SqlCmd.ExecuteNonQuery();
            SqlConn.Close();
        }

        //*************************************** Administrator******************************************//

        //------------------------------------------------------------------------------------------------

        public int getNumbOfUsers()
        {
            int numberofusers = 0;

            SqlConn.Open();
            SqlCmd = new SqlCommand("SELECT COUNT(UserName) FROM Users ", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();

            while (SqlDtr.Read())
            {
                numberofusers = Convert.ToInt16(SqlDtr.GetValue(0));

            }
            SqlDtr.Close();
            SqlConn.Close();

            return numberofusers;
        }

        public int getNumbOfPhotos()
        {
            int numberofphotos = 0;

            SqlConn.Open();
            SqlCmd = new SqlCommand("SELECT COUNT(PhotoPath) FROM Photos ", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();

            while (SqlDtr.Read())
            {
                numberofphotos = Convert.ToInt16(SqlDtr.GetValue(0));

            }
            SqlDtr.Close();
            SqlConn.Close();

            return numberofphotos;
        }

        public int getNumbOfSets()
        {
            int numberofsets = 0;

            SqlConn.Open();
            SqlCmd = new SqlCommand("SELECT COUNT(SetID) FROM UserSets ", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();

            while (SqlDtr.Read())
            {
                numberofsets = Convert.ToInt16(SqlDtr.GetValue(0));
                
            }
            SqlDtr.Close();
            SqlConn.Close();

            return numberofsets;
        }

        public int getNumbOfGalleries()
        {
            int numberofgallaries = 0;

            SqlConn.Open();
            SqlCmd = new SqlCommand("SELECT COUNT(GalleryID) FROM UserGalleries ", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();

            while (SqlDtr.Read())
            {
                numberofgallaries = Convert.ToInt16(SqlDtr.GetValue(0));

            }
            SqlDtr.Close();
            SqlConn.Close();

            return numberofgallaries;
        }
       
  //============================================================

//*******************************************************************************************************************************
        public Photo getPhotoDetails(string photopath)
        {
            Photo photo = new Photo();


            SqlConn.Open();
            SqlCmd = new SqlCommand("Select * From Photos Where PhotoPath = '"
                        + photopath + "'", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();

            while (SqlDtr.Read())
            {

                photo.PhotoName = SqlDtr["PhotoName"].ToString();
                photo.PhotoPath = SqlDtr["PhotoPath"].ToString();
                photo.Description = SqlDtr["Description"].ToString();
                photo.UserName = SqlDtr["UserName"].ToString();
                photo.accessright = SqlDtr["AccessRight"].ToString();
                photo.tags = SqlDtr["Tags"].ToString();


            }

            SqlDtr.Close();
            SqlConn.Close();

            return photo;
        }

        public bool checkShareBit(string photoPath)
        {
            bool isShare = false;
            string value = "1";

            SqlConn.Open();
            SqlCmd = new SqlCommand("Select * From Photos", SqlConn);
            SqlDataReader SqlDtr = SqlCmd.ExecuteReader();

            while (SqlDtr.Read())
            {
                if (SqlDtr["PhotoPath"].ToString() == photoPath && SqlDtr["ShareWithExplorer"].ToString() == value)
                {
                    isShare = true;
                }
            }

            SqlDtr.Close();
            SqlConn.Close();

            return isShare;



        }
        public void shareWithExplorer(string photoPath)
        {

            SqlConn.Open();
            SqlCmd = new SqlCommand("UPDATE Photos SET ShareWithExplorer = " + 1 + " WHERE PhotoPath = '" + photoPath + "'", SqlConn);
            SqlCmd.ExecuteNonQuery();
            SqlConn.Close();

        }
        public void unShareWithExplorer(string photoPath)
        {

            SqlConn.Open();
            SqlCmd = new SqlCommand("UPDATE Photos SET ShareWithExplorer = " + 0 + " WHERE PhotoPath = '" + photoPath + "'", SqlConn);
            SqlCmd.ExecuteNonQuery();
            SqlConn.Close();

        }
   


    }
}