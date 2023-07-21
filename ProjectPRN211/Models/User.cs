using System;
using System.Collections.Generic;

namespace ProjectPRN211.Models
{
    public partial class User
    {
        public User()
        {
            Grades = new HashSet<Grade>();
            Results = new HashSet<Result>();
        }

        public string Mssv { get; set; } = null!;
        public string? Password { get; set; }
        public int? RoleId { get; set; }

        public virtual Role? Role { get; set; }
        public virtual ICollection<Grade> Grades { get; set; }
        public virtual ICollection<Result> Results { get; set; }
    }
}
