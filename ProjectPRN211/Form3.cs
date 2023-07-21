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
    public partial class Form3 : Form
    {
        AutoCheckPRFContext context = new AutoCheckPRFContext();
        public Form3()
        {

            InitializeComponent();
        }

        private void Form3_Load(object sender, EventArgs e)
        {
            try
            {


                dgvStudent.AutoGenerateColumns = false;

                // Create and configure the columns manually
                dgvStudent.Columns.Add(new DataGridViewTextBoxColumn()
                {
                    DataPropertyName = "Grade1", // Actual property name in the data source
                    HeaderText = "Grade", // Displayed column header text
                    Name = "GradeColumn" // Unique name for the column
                });

                dgvStudent.Columns.Add(new DataGridViewTextBoxColumn()
                {
                    DataPropertyName = "Mssv",
                    HeaderText = "Student ID",
                    Name = "MssvColumn"
                });

                // Set the data source
                dgvStudent.DataSource = context.Grades
                                          .Select(grade => new { grade.Mssv, grade.Grade1 })
                                          .ToList();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

            tbGrade.Text = "0";
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            var g = context.Grades.SingleOrDefault(g => g.Mssv.Equals(tbCode.Text));

            if (g != null)
            {
                context.Grades.Remove(g);
                context.SaveChanges();

                // Set the data source
                dgvStudent.DataSource = context.Grades
                                          .Select(grade => new { grade.Mssv, grade.Grade1 })
                                          .ToList();
            }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            var g = context.Grades.SingleOrDefault(g => g.Mssv.Equals(tbCode.Text));

            try
            {
                if (g != null)
                {
                    g.Grade1 = Convert.ToDouble(tbGrade.Text);
                    context.SaveChanges();

                    // Set the data source
                    dgvStudent.DataSource = context.Grades
                                              .Select(grade => new { grade.Mssv, grade.Grade1 })
                                              .ToList();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void dgvStudent_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow clickedRow = dgvStudent.Rows[e.RowIndex];

            tbCode.Text = clickedRow.Cells[1].Value.ToString();

            tbGrade.Text = clickedRow.Cells[0].Value.ToString();
        }

        private void dgvStudent_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
