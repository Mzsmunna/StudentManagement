using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HimelStudent
{
    public partial class AddStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Write("Student username : " + Request["username"]);
            if((Request["username"] ==null) || (Request["sid"] == null) || (Request["firstname"] == null) || (Request["lastname"] == null) || (Request["gender"] == null) || (Request["cgpa"] == null) || (Request["department"] == null) || (Request["semester"] ==null) || (Request["email"] == null) || (Request["pnumber"] == null) || (Request["password"] == null) || (Request["cpassword"] == null))
            {
                Response.Redirect("~/Admin.aspx");
            }
            else if ((Request["username"] == "") || (Request["sid"] == "") || (Request["firstname"] == "") || (Request["lastname"] == "") || (Request["gender"] == "") || (Request["cgpa"] == "") || (Request["department"] == "") || (Request["semester"] == "") || (Request["email"] == "") || (Request["pnumber"] == "") || (Request["password"] == "") || (Request["cpassword"] == ""))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "message", "alert('Please fill up all the boxes!');location.href = 'Admin.aspx';", true);
            }
            else
            {
                if (String.Equals(Request["password"], Request["Cpassword"]))
                {
                    string username = Request["username"];
                    string sid = Request["sid"];
                    string firstname = Request["firstname"];
                    string lastname = Request["lastname"];
                    string gender = Request["gender"];
                    float cgpa = float.Parse(Request["cgpa"]);
                    string department = Request["department"];
                    string semester = Request["semester"];
                    string email = Request["email"];
                    string number = Request["pnumber"];
                    string password = Request["password"];
                    string cpassword = Request["cpassword"];
                    string usertype = "student";

                    StudentDataSetTableAdapters.studentsTableAdapter student_table = new StudentDataSetTableAdapters.studentsTableAdapter();
                    //StudentDataSet.studentsDataTable student_query_data = new StudentDataSet.studentsDataTable();

                    student_table.AddStudent(sid, username, firstname, lastname, gender, email, number, password, usertype, department, cgpa, semester);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "message", "alert('Student Added successfully!');location.href = 'Admin.aspx';", true);

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "message", "alert('Error!! password did not match!');location.href = 'Admin.aspx';", true);
                }
            }

        }
    }
}