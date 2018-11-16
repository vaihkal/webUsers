using System;
using System.Collections.Generic;

namespace WebUsers.Models
{
    public partial class Users
    {
        public long Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Username { get; set; }
        public DateTime? CreatedAt { get; set; }
        public bool? Enabled { get; set; }
    }
}
