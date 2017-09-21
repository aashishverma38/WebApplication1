using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Flickr.Models
{
    public class User
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string UserName { get; set; }
        public string EmailID { get; set; }
        public string Password { get; set; }
        public string ProfilePhotoPath { get; set; }
        public string Question { get; set; }
        public string Answer { get; set; }
    }
}