using System;
using System.Collections.Generic;

namespace ProjectPRN211.Models
{
    public partial class Result
    {
        public string? Mssv { get; set; }
        public string? Question { get; set; }
        public byte? PassCases { get; set; }
        public int ResultId { get; set; }

        public virtual User? MssvNavigation { get; set; }
    }
}
