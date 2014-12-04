using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Nagarro.EmployeePortal.BLL;

namespace Nagarro.EmployeePortal.Web.NoticeBoard
{
    public partial class ManageNotices : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayNotices();
            }
        }
        protected void DisplayNotices()
        {
            
            try
            {
                GridView1.DataSource = NoticeList.GetAllNotices();
                GridView1.DataBind();
            }
            catch (ApplicationException ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        protected void addButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/NoticeBoard/AddEditNotice.aspx");
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Delete")
                {

                    int noticeId = Convert.ToInt32(e.CommandArgument);

                    BLL.Notice.DeleteNotice(noticeId);
                    DisplayNotices();

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
            DisplayNotices();
        }
    }
}