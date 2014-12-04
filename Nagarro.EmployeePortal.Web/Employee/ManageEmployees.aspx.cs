using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Nagarro.EmployeePortal.BLL;

namespace Nagarro.EmployeePortal.Web.Employee
{
    public partial class ManageEmployees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayEmployees();
            }
        }
        protected void DisplayEmployees()
        {
            try
            {
                GridView1.DataSource = EmployeeList.GetAllEmployees();
                GridView1.DataBind();
            }
            catch (ApplicationException ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void addButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Employee/EditEmployee.aspx?mode=add");
        }
        /*
        protected void Delete_Click(object sender, EventArgs e)
        {
                                                                              //also correct but need to add the additional column(employeeid) in gridview
            LinkButton delBtn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)delBtn.NamingContainer;
            string id = row.Cells[0].Text;
            int employeeId = Convert.ToInt32(id);
            try
            {
                BLL.Employee.DeleteEmployee(employeeId);
                //Response.Write("<script>alert('Record deleted successfully')</script>");
                DisplayEmployees();
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
          */

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Delete")
                {

                    int employeeId = Convert.ToInt32(e.CommandArgument);

                    BLL.Employee.DeleteEmployee(employeeId);
                    DisplayEmployees();

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
            DisplayEmployees();
        }
    }
}