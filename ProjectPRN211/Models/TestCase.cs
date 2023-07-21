using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectPRN211.Models
{
    public class TestCase
    {
        private string Name;
        private string[] Input;
        private string[] Output;
        private int Testcase;
        private int Passcase = 0;
        private float Totalpoint;
        
        public string name
        {
            get { return Name; }
            set { Name = value; }
        }

        public string[] input
        {
            get { return Input; }
            set { Input = value; }
        }

        public string[] output
        {
            get { return Output; }
            set { Output = value; }
        }

        public int testcase
        {
            get { return Input.Length > 0 ? Input.Length : 1; }
            set { Testcase = value; }
        }

        public int passcase
        {
            get { return Passcase; }
            set { Passcase = value; }
        }

        public float totalpoint
        {
            get { return Totalpoint; }
            set { Totalpoint = value; }
        }
       
    }
}
