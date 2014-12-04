using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Employee.BLL;
using Employee.SharedObjects;
namespace Employee.WEB
{
    public partial class Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayData();
            }

        }

        protected void DisplayData()
        {
            try
            {
                ViewAllEmployees.DataSource = Employee.BLL.Employee.GetAllEmployees();
                ViewAllEmployees.DataBind();
            }
            catch (ApplicationException e)
            {
                Response.Write("<script>alert('" + e.Message + "');</script>");
            }
                
        }

        protected void AddNewRecord(object sender, EventArgs e)
        {
            ViewAllEmployees.ShowFooter = true;
            DisplayData();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            ViewAllEmployees.EditIndex = -1;
            DisplayData();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int employeeId = Convert.ToInt32(ViewAllEmployees.DataKeys[e.RowIndex].Value.ToString());
            //delete the product
            Employee.BLL.Employee.DeleteEmployee(employeeId);
            ViewAllEmployees.EditIndex = -1;
            DisplayData();

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ViewAllEmployees.EditIndex = e.NewEditIndex;
            DisplayData();

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = ViewAllEmployees.Rows[e.RowIndex];

            EmployeeDTO employeeDetails = new EmployeeDTO();
            employeeDetails.EmployeeID = Convert.ToInt32(ViewAllEmployees.DataKeys[e.RowIndex].Value.ToString());
            employeeDetails.EmployeeName = ((TextBox)row.FindControl("txtEmployeeName")).Text;
            employeeDetails.DateOfBirth = Convert.ToDateTime(((TextBox)row.FindControl("txtDateOfBirth")).Text);
            employeeDetails.PhoneNumber = Convert.ToInt64(((TextBox)row.FindControl("txtPhoneNumber")).Text);

            Employee.BLL.Employee.UpdateEmployee(employeeDetails);
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Insert"))
            {
                EmployeeDTO employeeDetails = new EmployeeDTO();
                employeeDetails.EmployeeName = ((TextBox)ViewAllEmployees.FooterRow.FindControl("txtNewEmployeeName")).Text;
                employeeDetails.DateOfBirth = Convert.ToDateTime(((TextBox)ViewAllEmployees.FooterRow.FindControl("txtNewDateOfBirth")).Text);
                employeeDetails.PhoneNumber = Convert.ToInt64(((TextBox)ViewAllEmployees.FooterRow.FindControl("txtNewPhoneNumber")).Text);

                Employee.BLL.Employee.InsertEmployee(employeeDetails);
            }
        }
    }
}