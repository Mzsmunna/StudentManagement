using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HimelStudent
{
    public partial class LoginController : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Request["username"] == null) || (Request["password"] == null))
            {
                Response.Redirect("~/Login.aspx");
            }
            else if ((Request["username"] == "") || (Request["password"] == ""))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "message", "alert('Access Denied. Please Enter your username!');location.href = 'Login.aspx';", true);
            }
            else
            {
                string username = Request["username"];
                string password = Request["password"];

                StudentDataSetTableAdapters.studentsTableAdapter student_table = new StudentDataSetTableAdapters.studentsTableAdapter();
                StudentDataSet.studentsDataTable student_query_data = new StudentDataSet.studentsDataTable();

                student_query_data = student_table.Login(username, password);

                StudentDataSetTableAdapters.adminsTableAdapter admin_table = new StudentDataSetTableAdapters.adminsTableAdapter();
                StudentDataSet.adminsDataTable admin_query_data = new StudentDataSet.adminsDataTable();

                student_query_data = student_table.Login(username, password);
                admin_query_data = admin_table.Login(username, password);

                if (student_query_data.Count >= 1)
                {
                    Session["id"] = student_query_data[0]["id"];
                    Session["username"] = student_query_data[0]["username"];
                    Session["sid"] = student_query_data[0]["sid"];
                    Session["fname"] = student_query_data[0]["fname"];
                    Session["lname"] = student_query_data[0]["lname"];
                    Session["email"] = student_query_data[0]["email"];
                    Session["number"] = student_query_data[0]["number"];   
                    Session["gender"] = student_query_data[0]["gender"];
                    Session["password"] = student_query_data[0]["password"];
                    Session["cgpa"] = student_query_data[0]["cgpa"];
                    Session["department"] = student_query_data[0]["department"];
                    Session["semester"] = student_query_data[0]["semester"];
                    Session["usertype"] = student_query_data[0]["usertype"];

                    Response.Redirect("~/Student.aspx");

                }
                else if (admin_query_data.Count >= 1)
                {
                    Session["id"] = admin_query_data[0]["id"];
                    Session["username"] = admin_query_data[0]["username"];
                    Session["email"] = admin_query_data[0]["email"];
                    Session["password"] = admin_query_data[0]["password"];
                    Session["number"] = admin_query_data[0]["number"];
                    Session["usertype"] = admin_query_data[0]["usertype"];

                    Response.Redirect("~/Admin.aspx");

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "message", "alert('Error! Wrong Username or Password!');location.href = 'Login.aspx';", true);
                }
            }
        }
    }
}