using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HimelStudent
{
    public partial class Admin : System.Web.UI.Page
    {
        public StudentDataSetTableAdapters.studentsTableAdapter student_table;
        public StudentDataSet.studentsDataTable student_query_data;
        public StudentDataSetTableAdapters.adminsTableAdapter admin_table = new StudentDataSetTableAdapters.adminsTableAdapter();
        public StudentDataSet.adminsDataTable admin_query_data = new StudentDataSet.adminsDataTable();

        protected void Page_Load(object sender, EventArgs e)
        {

            if(Session["usertype"] != null)
            {
                if((Session["usertype"].ToString() == "admin") || (Session["usertype"].ToString() == "Admin"))
                {
                    string username = Session["username"].ToString();
                    string password = Session["password"].ToString();
                    student_table = new StudentDataSetTableAdapters.studentsTableAdapter();
                    student_query_data = new StudentDataSet.studentsDataTable();

                    admin_query_data = admin_table.Login(username, password);
                    student_query_data = student_table.GetData();
                }
                else if ((Session["usertype"].ToString() == "student") || (Session["usertype"].ToString() == "Student"))
                {
                    Response.Redirect("~/Student.aspx");
                }
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        public string getAllStudents()
        {
            StudentDataSetTableAdapters.studentsTableAdapter student_table = new StudentDataSetTableAdapters.studentsTableAdapter();
            StudentDataSet.studentsDataTable student_query_data = new StudentDataSet.studentsDataTable();

            student_query_data = student_table.GetData();

            string bind = "";

            for (int i = 0; i < student_query_data.Count; i++)
            {
                bind += "<tr><td> " + (i + 1) + "</td><td>" + student_query_data[i].sid + "</td><td> " + student_query_data[i].username + " </td><td> " + student_query_data[i].fname + " </td><td> " + student_query_data[i].lname + " </td><td> " + student_query_data[i].gender + "</td><td> " + student_query_data[i].email + " </td><td> " + student_query_data[i].number + " </td><td> " + student_query_data[i].password + " </td><td> " + student_query_data[i].usertype + " </td><td> " + student_query_data[i].department + " </td><td> " + student_query_data[i].cgpa + " </td><td> " + student_query_data[i].semester + " </td></tr> ";
            }

            return bind;
        }
    }
}