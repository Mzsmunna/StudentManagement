using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//MineD
using System.Web.Script.Serialization;

namespace HimelStudent
{
    public partial class Search : System.Web.UI.Page
    {
        public StudentDataSetTableAdapters.studentsTableAdapter student_table;
        public StudentDataSet.studentsDataTable student_query_data;

        protected void Page_Load(object sender, EventArgs e)
        {
            string text = Request["text"];

            student_table = new StudentDataSetTableAdapters.studentsTableAdapter();
            student_query_data = new StudentDataSet.studentsDataTable();
            student_query_data = student_table.GetSearchResult(text);

            string bind = "<thead><tr><th> ID </th><th> Username </th><th> Full Name </th><th> Gender </th><th> Email </th><th> Department </th><th> Semester </th></tr></thead>";

            if(student_query_data.Count>0)
            {
                for (int i = 0; i < student_query_data.Count; i++)
                {
                    bind += "<tr><td>" + student_query_data[i].sid + "</td><td> " + student_query_data[i].username + " </td><td> " + student_query_data[i].fname + " " + student_query_data[i].lname + " </td><td> " + student_query_data[i].gender + "</td><td> " + student_query_data[i].email + " </td><td> " + student_query_data[i].department + " </td><td> " + student_query_data[i].semester + " </td></tr> ";
                }
            } 

            //Response.Write(student_query_data);
            Response.Write(bind);

            //JavaScriptSerializer js = new JavaScriptSerializer();
            //js.Serialize(student_query_data);
            //Response.Write(js.Serialize(student_query_data));
            Response.End();

        }
    }
}