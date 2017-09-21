using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class Folder
    {
        public string name { get; set; }
        public List<Email> mail = new List<Email>();

    }
}