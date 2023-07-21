using Microsoft.EntityFrameworkCore;
using ProjectPRN211.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace ProjectPRN211
{
    public partial class LoginForm : Form
    {
        AutoCheckPRFContext context = new AutoCheckPRFContext();
        public LoginForm()
        {
            InitializeComponent();
        }

        private void LoginForm_Load(object sender, EventArgs e)
        {
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            var mssv = tbUser.Text;
            var pass = tbPassword.Text;

            var sv = context.Users.SingleOrDefault(u => u.Mssv.Equals(mssv) && u.Password.Equals(pass));

            if (sv != null)
            {
                if (sv.RoleId == 2)
                {
                    Form1 f1 = new Form1();
                    f1.user = sv;
                    this.Hide();
                    f1.ShowDialog();
                    this.Close();
                }
                else
                {
                    Form3 f3 = new Form3();
                    this.Hide();
                    f3.ShowDialog();
                    this.Close();
                }

            }
            else
            {
                MessageBox.Show("Account dosent exist");
            }
        }
    }
}
