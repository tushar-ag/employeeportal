using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Nagarro.EmployeePortal.BLL;

namespace Nagarro.EmployeePortal.Web.IssueTracker
{
    public partial class IssueDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

            try
            {
                string id = Request.QueryString["id"];

               // var issueDetails = new List<Issue> { BLL.Issue.GetIssue(Convert.ToInt32(id)) };
                //FormView1.DataSource = issueDetails;

                FormView1.DataSource = new List<Issue> {Issue.GetIssue(Convert.ToInt32(id))};

                FormView1.DataBind();
            }
            catch (ApplicationException ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }



        }

        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        } 
    }
}