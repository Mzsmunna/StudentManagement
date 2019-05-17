using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HimelStudent
{
    public partial class EditAdmin : System.Web.UI.Page
    {
        public StudentDataSetTableAdapters.adminsTableAdapter admin_table = new StudentDataSetTableAdapters.adminsTableAdapter();
        public StudentDataSet.adminsDataTable admin_query_data = new StudentDataSet.adminsDataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request["id"]);
            string username = Request["username"];
            string email = Request["email"];
            string password = Request["password"];
            string pnumber = Request["pnumber"];

            admin_table.UpdateAdmin(username,email,pnumber,password,"admin",id);
            //Response.Write("Admin name : " + Request["username"] + " Email : " + Request["email"] + " Number : " + Request["pnumber"] + " Password : " + Request["password"]);
            Response.Write("Admin Info Updated Successfully");
            Response.End();

        }
    }
}