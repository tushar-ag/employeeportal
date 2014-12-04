using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Nagarro.EmployeePortal.BLL;

namespace Nagarro.EmployeePortal.Web.IssueTracker
{
    public partial class AddNewIssue : System.Web.UI.Page
    {
        int issueId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    Add();
                }
                else
                {
                    issueId = Convert.ToInt32(Request.QueryString["id"]);
                    Edit(issueId);
                }
            }
        }

        private void Edit(int issueId)
        {
            headinglabel.Text = " Edit Issue";
            IDlabel.Visible = true;
            IDvaluelabel.Visible = true;
            statuslabel.Visible = true;
            DropDownList2.Visible = true;

            BLL.Issue showIssue = BLL.Issue.GetIssue(issueId);

            IDvaluelabel.Text = showIssue.IssueId.ToString();
            TextBox1.Text = showIssue.Title;
            TextArea1.InnerText = showIssue.Description;
            DropDownList1.SelectedValue = showIssue.Priority.ToString();
            DropDownList2.SelectedValue = showIssue.Status.ToString();

        }


        void Add()
        {
            headinglabel.Text = "Add New Issue";
            IDlabel.Visible = false;
            IDvaluelabel.Visible = false;
            statuslabel.Visible = false;
            DropDownList2.Visible = false;

        }



        

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    BLL.Issue newIssue = new BLL.Issue();
                    newIssue.IssueId = 0;
                    newIssue.Title = TextBox1.Text;
                    newIssue.Description = TextArea1.InnerText;
                    newIssue.DatePosted = DateTime.Now;
                    newIssue.PostedBy = (Session["CurrentPrincipal"] as EPPrincipal).EmployeeId;
                    newIssue.AssignedTo = 1;            //assigned to admin only
                    newIssue.Status = 1;                //always raised
                    newIssue.Priority = Convert.ToInt32(DropDownList1.SelectedValue);

                    BLL.Issue.InsertIssue(newIssue);
                    Response.Write("<script>alert('Updated Successfully');</script>");
                }
                else
                {
                    BLL.Issue editIssue = new BLL.Issue();
                    editIssue.IssueId = Convert.ToInt32(IDvaluelabel.Text);
                    editIssue.Title = TextBox1.Text;
                    editIssue.Description = TextArea1.InnerText;
                    editIssue.PostedBy = (Session["CurrentPrincipal"] as EPPrincipal).EmployeeId;
                    editIssue.AssignedTo = 1; // assigned to admin only;
                    editIssue.Status = Convert.ToInt32(DropDownList2.SelectedValue);
                    editIssue.Priority = Convert.ToInt32(DropDownList1.SelectedValue);

                    BLL.Issue.UpdateIssue(editIssue);
                    Response.Write("<script>alert('Updated Successfully');</script>");
                }
            }
            catch (ApplicationException ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/Default.aspx");
        }
    }
}