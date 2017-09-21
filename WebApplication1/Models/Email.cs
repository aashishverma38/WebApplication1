using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class Email
    {
        public string MailID { get; set; }
        public string Sender { get; set; }
        public string Receiver { get; set; }
        public string Subject { get; set; }
        public string Body { get; set; }
        public DateTime MailDate { get; set; }
        public int ReadBit { get; set; }
        public int SenderBit { get; set; }
        public int ReceiverBit { get; set; }
    }
}
