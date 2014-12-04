using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Nagarro.EmployeePortal.BLL;

namespace Nagarro.EmployeePortal.Web.IssueTracker
{
    public partial class ManageIssues : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayIssues();
            }
        }
        protected void DisplayIssues()
        {
            try
            {
                GridView1.DataSource = IssueList.GetAllIssues();
                GridView1.DataBind();
            }
            catch (ApplicationException ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        protected void addButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/IssueTracker/AddNewIssue.aspx");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Delete")
                {

                    int issueId = Convert.ToInt32(e.CommandArgument);

                    BLL.Issue.DeleteIssue(issueId);
                    DisplayIssues();

                }
            }
            catch (ApplicationException ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            DisplayIssues();
        }

    }
}