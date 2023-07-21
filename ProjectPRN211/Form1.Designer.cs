namespace ProjectPRN211
{
    partial class Form1
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
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
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            lbSubmit = new ListBox();
            lbResult = new ListBox();
            btnSubmit = new Button();
            cbListStudent = new ComboBox();
            dgvResult = new DataGridView();
            ((System.ComponentModel.ISupportInitialize)dgvResult).BeginInit();
            SuspendLayout();
            // 
            // lbSubmit
            // 
            lbSubmit.FormattingEnabled = true;
            lbSubmit.ItemHeight = 15;
            lbSubmit.Location = new Point(35, 36);
            lbSubmit.Name = "lbSubmit";
            lbSubmit.Size = new Size(581, 184);
            lbSubmit.TabIndex = 0;
            // 
            // lbResult
            // 
            lbResult.FormattingEnabled = true;
            lbResult.ItemHeight = 15;
            lbResult.Location = new Point(35, 231);
            lbResult.Name = "lbResult";
            lbResult.Size = new Size(267, 184);
            lbResult.TabIndex = 1;
            // 
            // btnSubmit
            // 
            btnSubmit.Location = new Point(659, 36);
            btnSubmit.Name = "btnSubmit";
            btnSubmit.Size = new Size(93, 61);
            btnSubmit.TabIndex = 2;
            btnSubmit.Text = "Submit";
            btnSubmit.UseVisualStyleBackColor = true;
            btnSubmit.Click += btnSubmit_Click;
            // 
            // cbListStudent
            // 
            cbListStudent.FormattingEnabled = true;
            cbListStudent.Location = new Point(631, 129);
            cbListStudent.Name = "cbListStudent";
            cbListStudent.Size = new Size(121, 23);
            cbListStudent.TabIndex = 3;
            // 
            // dgvResult
            // 
            dgvResult.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dgvResult.Location = new Point(346, 231);
            dgvResult.Name = "dgvResult";
            dgvResult.RowTemplate.Height = 25;
            dgvResult.Size = new Size(840, 184);
            dgvResult.TabIndex = 4;
            dgvResult.CellClick += dgvResult_CellClick;
            dgvResult.CellContentClick += dgvResult_CellContentClick;
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1198, 450);
            Controls.Add(dgvResult);
            Controls.Add(cbListStudent);
            Controls.Add(btnSubmit);
            Controls.Add(lbResult);
            Controls.Add(lbSubmit);
            Name = "Form1";
            Text = "SubmitFile";
            Load += Form1_Load;
            ((System.ComponentModel.ISupportInitialize)dgvResult).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private ListBox lbSubmit;
        private ListBox lbResult;
        private Button btnSubmit;
        private ComboBox cbListStudent;
        private DataGridView dgvResult;
    }
}