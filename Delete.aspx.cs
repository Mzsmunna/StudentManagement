using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HimelStudent
{
    public partial class Delete : System.Web.UI.Page
    {
        public StudentDataSetTableAdapters.studentsTableAdapter student_table;
        public StudentDataSet.studentsDataTable student_query_data;

        protected void Page_Load(object sender, EventArgs e)
        {
            student_table = new StudentDataSetTableAdapters.studentsTableAdapter();
            student_query_data = new StudentDataSet.studentsDataTable();
            int did;

            if (Session["usertype"] != null)
            {
                if ((Session["usertype"].ToString() == "admin") || (Session["usertype"].ToString() == "Admin"))
                { 
                    if (Request["did"] != null)
                    {
                        did = Convert.ToInt32(Request["did"]);
                        student_table.DeleteStudent(did);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "message", "alert('Student Deleated successfully!');location.href = 'Admin.aspx';", true);

                    }
                    else
                    {
                        Response.Redirect("~/Admin.aspx");
                    }
                }
                else
                {
                    Response.Redirect("~/Admin.aspx");
                }

            }
            else
            {
                Response.Redirect("~/Admin.aspx");
            }
        }
    }
}