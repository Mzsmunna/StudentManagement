using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HimelStudent
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["usertype"] != null)
            {
                if ((Session["usertype"].ToString() == "admin") || (Session["usertype"].ToString() == "Admin"))
                {
                    Response.Redirect("~/Admin.aspx");
                }
                else if ((Session["usertype"].ToString() == "student") || (Session["usertype"].ToString() == "Student"))
                {
                    Response.Redirect("~/Student.aspx");
                }
            }

        }
    }
}