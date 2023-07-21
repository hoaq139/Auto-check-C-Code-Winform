namespace ProjectPRN211
{
    partial class Form3
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            label1 = new Label();
            label2 = new Label();
            tbCode = new TextBox();
            tbGrade = new TextBox();
            btnDelete = new Button();
            btnUpdate = new Button();
            dgvStudent = new DataGridView();
            btnExit = new Button();
            ((System.ComponentModel.ISupportInitialize)dgvStudent).BeginInit();
            SuspendLayout();
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Location = new Point(73, 50);
            label1.Name = "label1";
            label1.Size = new Size(37, 15);
            label1.TabIndex = 0;
            label1.Text = "MSSV";
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Location = new Point(73, 107);
            label2.Name = "label2";
            label2.Size = new Size(38, 15);
            label2.TabIndex = 1;
            label2.Text = "Grade";
            // 
            // tbCode
            // 
            tbCode.Location = new Point(145, 47);
            tbCode.Name = "tbCode";
            tbCode.Size = new Size(141, 23);
            tbCode.TabIndex = 2;
            // 
            // tbGrade
            // 
            tbGrade.Location = new Point(145, 107);
            tbGrade.Name = "tbGrade";
            tbGrade.Size = new Size(141, 23);
            tbGrade.TabIndex = 3;
            // 
            // btnDelete
            // 
            btnDelete.Location = new Point(409, 107);
            btnDelete.Name = "btnDelete";
            btnDelete.Size = new Size(75, 23);
            btnDelete.TabIndex = 4;
            btnDelete.Text = "Delete";
            btnDelete.UseVisualStyleBackColor = true;
            btnDelete.Click += btnDelete_Click;
            // 
            // btnUpdate
            // 
            btnUpdate.Location = new Point(552, 107);
            btnUpdate.Name = "btnUpdate";
            btnUpdate.Size = new Size(75, 23);
            btnUpdate.TabIndex = 5;
            btnUpdate.Text = "Update";
            btnUpdate.UseVisualStyleBackColor = true;
            btnUpdate.Click += btnUpdate_Click;
            // 
            // dgvStudent
            // 
            dgvStudent.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dgvStudent.Location = new Point(73, 200);
            dgvStudent.Name = "dgvStudent";
            dgvStudent.RowTemplate.Height = 25;
            dgvStudent.Size = new Size(667, 212);
            dgvStudent.TabIndex = 6;
            dgvStudent.CellClick += dgvStudent_CellClick;
            dgvStudent.CellContentClick += dgvStudent_CellContentClick;
            // 
            // btnExit
            // 
            btnExit.Location = new Point(685, 107);
            btnExit.Name = "btnExit";
            btnExit.Size = new Size(75, 23);
            btnExit.TabIndex = 7;
            btnExit.Text = "Exit";
            btnExit.UseVisualStyleBackColor = true;
            btnExit.Click += btnExit_Click;
            // 
            // Form3
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(btnExit);
            Controls.Add(dgvStudent);
            Controls.Add(btnUpdate);
            Controls.Add(btnDelete);
            Controls.Add(tbGrade);
            Controls.Add(tbCode);
            Controls.Add(label2);
            Controls.Add(label1);
            Name = "Form3";
            Text = "Form3";
            Load += Form3_Load;
            ((System.ComponentModel.ISupportInitialize)dgvStudent).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label label1;
        private Label label2;
        private TextBox tbCode;
        private TextBox tbGrade;
        private Button btnDelete;
        private Button btnUpdate;
        private DataGridView dgvStudent;
        private Button btnExit;
    }
}