using System;
using System.Collections.Generic;

namespace ProjectPRN211.Models
{
    public partial class Grade
    {
        public int GradeId { get; set; }
        public double? Grade1 { get; set; }
        public string? Mssv { get; set; }

        public virtual User? MssvNavigation { get; set; }
    }
}
