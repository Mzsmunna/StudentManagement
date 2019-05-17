using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HimelStudent
{
    public partial class Student : System.Web.UI.Page
    {
        public StudentDataSetTableAdapters.studentsTableAdapter student_table;
        public StudentDataSet.studentsDataTable student_query_data;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usertype"] != null)
            {
                student_table = new StudentDataSetTableAdapters.studentsTableAdapter();
                student_query_data = new StudentDataSet.studentsDataTable();
                int id;

                if ((Session["usertype"].ToString() == "admin") || (Session["usertype"].ToString() == "Admin"))
                {      
                    if(Request["id"] != null)
                    {
                        id = Convert.ToInt32(Request["id"]);
                        student_query_data = student_table.GetStudent(id);
                    }
                    else
                    {
                        Response.Redirect("~/Admin.aspx");
                    }
                    
                }
                else if ((Session["usertype"].ToString() == "student") || (Session["usertype"].ToString() == "Student"))
                {
                    id = Convert.ToInt32(Session["id"]);
                    student_query_data = student_table.GetStudent(id);
                }
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }
    }
}