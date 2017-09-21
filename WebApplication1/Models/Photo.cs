using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Flickr.Models
{
    public class Photo
    {
        public String PhotoName { get; set; }
        public String PhotoPath { get; set; }
        public String Description { get; set; }
        public DateTime UploadedDate { get; set; }
        public String UserName { get; set; }
        public string accessright { get; set; }
        public string tags { get; set; }
    }
}