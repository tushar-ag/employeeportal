using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlTypes;
using Nagarro.EmployeePortal.BLL;
using Nagarro.EmployeePortal.DAL;

namespace Nagarro.EmployeePortal.Web.Employee
{
    public partial class SearchEmployee : System.Web.UI.Page
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
            protected void Button1_Click(object sender, EventArgs e)
            {
                EmployeeManager.Employee employeeSearchData = new EmployeeManager.Employee();

                if (!string.IsNullOrEmpty(TextBox1.Text))
                {
                    employeeSearchData.employeeCode = TextBox1.Text;
                }

             
                if (!string.IsNullOrEmpty(TextBox2.Text))
                {
                    employeeSearchData.dateOfJoining = Convert.ToDateTime(TextBox2.Text);
                }
                else
                {
                    employeeSearchData.dateOfJoining = (DateTime)SqlDateTime.MinValue;
                }
                
                if (!string.IsNullOrEmpty(TextBox3.Text))
                {
                    employeeSearchData.firstName = TextBox3.Text;
                }
                if (!string.IsNullOrEmpty(TextBox4.Text))
                {
                    employeeSearchData.lastName = TextBox4.Text;
                }

                if (!DropDownList1.SelectedValue.Equals('0'))
                {
                    employeeSearchData.deptId = Convert.ToInt32(DropDownList1.SelectedValue);
                }

                try
                {
                    GridView1.DataSource = EmployeeList.SearchEmployees(employeeSearchData);
                    GridView1.DataBind();
                }
                catch (ApplicationException ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
            {
                GridView1.PageIndex = e.NewPageIndex;
                DisplayEmployees();
            }
    }
}