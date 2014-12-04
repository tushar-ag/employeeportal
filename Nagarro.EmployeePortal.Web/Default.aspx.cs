using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Nagarro.EmployeePortal.BLL;

namespace Nagarro.EmployeePortal.Web
{
    public partial class Default : System.Web.UI.Page
    {
        IssueList allissues = new IssueList();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                
                Display();
            }
            
        }

        protected void Display()
        {
            try
            {
                NoticeList allnotices = new NoticeList();
                allnotices = NoticeList.GetAllNotices();
                ListView1.DataSource = allnotices;
                ListView1.DataBind();
                EPPrincipal objEPPrincipal = Session["CurrentPrincipal"] as EPPrincipal;

                int employeeId = objEPPrincipal.EmployeeId;

                if (IssueList.GetUserOpenIssues(employeeId).Count > 0)
                {
                    
                    allissues = IssueList.GetUserOpenIssues(employeeId);
                    GridView1.DataSource = allissues ;
                    GridView1.DataBind();
                }
                else
                {
                    Label2.Text = "<br>No issues posted by you";
                }


            }
            catch (ApplicationException ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected string GetName(int postedBy)
        {
            return (allissues.Find(x => x.PostedBy == postedBy)).PostedByName;
        }


        protected void ListView1_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (ListView1.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            Display();
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Display();
        }
    }
}
