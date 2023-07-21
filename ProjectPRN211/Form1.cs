using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using ProjectPRN211.Models;
using System.Diagnostics;
using System.Windows.Forms;
namespace ProjectPRN211
{
    public partial class Form1 : Form
    {
        AutoCheckPRFContext context = new AutoCheckPRFContext();
        public User user;
        List<TestCase> testCases = new List<TestCase>();
        public Form1()
        {
            InitializeComponent();
        }
        private void Form1_Load(object sender, EventArgs e)
        {
            GetData();
            cbListStudent.DataSource = context.Users.Select(x => x.Mssv).Distinct().ToList();
            GetDataResult();
        }
        private void GetDataResult()
        {
            dgvResult.DataSource = context.Results.ToList();
        }
        private void GetData()
        {
            //Doc file json va parse content sang JObject
            string jsonFilePath = "TestCase.json";
            string jsonContent = File.ReadAllText(jsonFilePath);
            JObject jsonObject = JObject.Parse(jsonContent);
            JArray jsonArray = (JArray)jsonObject["answer"];
            //lặp qua các phần từ trong mảng
            foreach (JObject item in jsonArray)
            {
                TestCase testCase = item.ToObject<TestCase>();
                testCases.Add(testCase);
            }
        }
        private void ExcuteFile(string filepath, TestCase program)
        {
            program.passcase = 0;
            string exePath = filepath;
            //bắt đầu process để chạy file exe
            Process process = new Process();
            process.StartInfo.FileName = exePath;
            process.StartInfo.UseShellExecute = false;
            process.StartInfo.RedirectStandardInput = true;
            process.StartInfo.RedirectStandardOutput = true;
            //process.OutputDataReceived += new DataReceivedEventHandler(OutputDataReceived);
            try
            {
                if (program.input.Length > 0)//check xem input có bị rỗng ko
                {
                    foreach (string inputs in program.input)
                    {
                        process.Start();
                        string[] input = inputs.Split(",");//tach cac input bằng dấu ,
                        foreach (string var in input)//truyen input vao program
                        {
                            process.StandardInput.WriteLine(var);
                        }
                        string outPut = process.StandardOutput.ReadToEnd();

                        string[] stringArray = outPut.Split(',');
                        foreach (string item in stringArray)
                        {
                            foreach (string expectOutput in program.output)
                            {
                                if (item.Equals(expectOutput))//so sanh output expect output
                                {
                                    // program.totalpoint += 1;
                                    program.passcase += 2;
                                }
                                else
                                {
                                    //program.totalpoint = 0;
                                    program.passcase = 0;
                                }
                            }
                            // program.totalpoint += 1;
                            process.WaitForExit();
                            process.Close();
                        }
                    }
                }
                else
                {
                    process.Start();
                    string output = process.StandardOutput.ReadToEnd();
                    //Console.WriteLine("Output from executable: " + output);
                    if (output.Equals(program.output))
                        program.passcase += 1;
                    process.WaitForExit();
                    process.Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error type file");
            }
        }
        private void btnSubmit_Click(object sender, EventArgs e)
        {
            lbSubmit.Items.Clear();//clear file cu khi nap file moi
            foreach (TestCase testCase in testCases)
            {
                testCase.passcase = 0;//set passcase ve 0
            };
            //mo folder de nap bai
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Reset();
            openFileDialog.InitialDirectory = "C:\\";
            openFileDialog.Multiselect = true;
            openFileDialog.Filter = "Executable Files (*.exe)|*.exe|All Files (*.*)|*.*";//filter file exe hay all
            if (openFileDialog.ShowDialog() == DialogResult.OK)//check xem cua so nop file đã mở chưa
            {
                string filePath = openFileDialog.FileName;
                string[] selectedFilePaths = openFileDialog.FileNames;
                lbSubmit.Items.AddRange(selectedFilePaths);
                foreach (string path in selectedFilePaths)
                {
                    string file = path.Split('\\').Last();
                    if (IsFileValid(file))//check file valid hay ko
                    {
                        TestCase program = testCases.FirstOrDefault(p => file.Contains(p.name));
                        if (program != null)//neu khac null thi thuc thi file va bat dau test
                        {
                            ExcuteFile(path, program);
                            showResult();
                        }
                    }
                    else
                    {

                        lbResult.Items.Add(file + " invalid");
                    }
                }
            }
            GetDataResult();
        }
        //check xem co dung dinh dang file ko
        private bool IsFileValid(string filePath)
        {
            return Path.GetExtension(filePath).ToLower() == ".exe";
        }
        //ham show ket qua
        public void showResult()
        {
            float grade1 = 0;
            lbResult.Items.Clear();
            foreach (TestCase program in testCases)
            {
                lbResult.Items.Add(program.name + ": passcases(" + program.passcase + "/" + program.testcase + ")");

                if (program.passcase == 2)
                {
                    grade1 += program.totalpoint;
                }
                //add to database
                addResult(new Result
                {
                    Mssv = cbListStudent.SelectedItem.ToString(),
                    PassCases = (byte)program.passcase,
                    Question = program.name
                });
                //addNewReSult();
            }
            //
            //addGrade(grade1);
            addNewGrade(new Grade
            {
                Mssv = cbListStudent.SelectedItem.ToString(),
                Grade1 = grade1
            }

                );
            lbResult.Items.Add("grade: " + grade1);
        }
        // add grade vao database
        private void addNewGrade(Grade grade)
        {
            var g = context.Grades.SingleOrDefault(g => g.Mssv.Equals(grade.Mssv));
            if (g == null)
            {
                context.Grades.Add(grade);
                context.SaveChanges();

            }


        }
        private void addGrade(float grade)
        {
            var g = context.Grades.SingleOrDefault(g => g.Mssv.Equals(user.Mssv));
            if (g == null)
            {
                context.Grades.Add(new Grade
                {
                    Grade1 = grade,
                    Mssv = user.Mssv
                });
                context.SaveChanges();
            }
            else
            {
                g.Grade1 = grade;
                context.SaveChanges();
            }
        }
        //add result vào database

        private void addResult(Result result)
        {
            var res = context.Results.SingleOrDefault(r => r.Question.Equals(result.Question) && r.Mssv.Equals(result.Mssv));
            if (res == null)
            {
                context.Results.Add(result);
                context.SaveChanges();
            }
            else
            {
                res.PassCases = result.PassCases;
                context.SaveChanges();
            }
        }
        public Result getResult()
        {
            Result result = new Result();
            result.Mssv = cbListStudent.SelectedItem.ToString();
            return result;
        }

        private void dgvResult_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dgvResult_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow clickedRow = dgvResult.Rows[e.RowIndex];

            //tbCode.Text = clickedRow.Cells[1].Value.ToString();

            //tbGrade.Text = clickedRow.Cells[0].Value.ToString();
        }

       
    }
}