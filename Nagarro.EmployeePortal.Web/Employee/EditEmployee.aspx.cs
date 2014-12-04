using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Nagarro.EmployeePortal.BLL;

namespace Nagarro.EmployeePortal.Web.Employee
{
    public partial class EditEmployee : System.Web.UI.Page
    {

        
        
        
        protected void Page_Load(object sender, EventArgs e)
        {
            int employeeId;
            if (!IsPostBack)
            {
                
                 if(Request.QueryString["Mode"]=="add")
                {
                    Add();
                }
                else
                {
                    if (string.IsNullOrEmpty(Request.QueryString["id"]))
                    {
                        EPPrincipal objEPPrincipal = Session["CurrentPrincipal"] as EPPrincipal;

                        employeeId = objEPPrincipal.EmployeeId;

                    }
                    else
                    {
                        employeeId = Convert.ToInt32(Request.QueryString["id"]);
                    }
                    Edit(employeeId);
                }
            }
        }


        protected void Edit(int employeeId)
        {
            
            try
            {
                Label1.Text = "Edit Employee";
                Button1.Text = "Update"; 

             // EPPrincipal objEPPrincipal = Session["CurrentPrincipal"] as EPPrincipal;

               // int employeeId = objEPPrincipal.EmployeeId;


                BLL.Employee showemployee = BLL.Employee.GetEmployee(employeeId);
                TextBox1.Visible = false;
                Label2.Text = showemployee.EmployeeCode;
                RequiredFieldValidator1.Enabled = false;

                TextBox2.Visible = false;
                Label3.Text = showemployee.DateOfJoining.ToString();
                RequiredFieldValidator2.Enabled = false;

                TextBox3.Text = showemployee.FirstName;
                TextBox4.Text = showemployee.LastName;
                TextBox5.Text = showemployee.DateOfBirth.ToShortDateString();
                TextBox6.Text = showemployee.Email;
                
                Label4.Visible = false;
                TextBox8.Visible = false;
                RequiredFieldValidator8.Enabled = false;

                DropDownList1.SelectedValue = showemployee.Department.DepartmentId.ToString();                

            }
            catch (ApplicationException ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void Add()
        {
            try
            {
                Label1.Text = "Add Employee";
                Button1.Text = "Add";
               

                Label2.Visible = false;
                TextBox1.Visible = true;
                RequiredFieldValidator1.Enabled = true;
                Label3.Visible = false;
                TextBox2.Visible = true;
                RequiredFieldValidator2.Enabled = true;

                

                Label4.Visible = true;
                TextBox8.Visible = true;
                
                RequiredFieldValidator8.Enabled = true;

              
                
            }
            catch (ApplicationException ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Button1.Text.Equals("Update"))
            {
                
                BLL.Employee editEmployee = new BLL.Employee();

                editEmployee.EmployeeId = (Session["CurrentPrincipal"] as EPPrincipal).EmployeeId;
                
                    editEmployee.FirstName = TextBox3.Text;
                
                
                
                    editEmployee.LastName = TextBox4.Text;
                
                
                    if(!editEmployee.DateOfBirth.Equals(TextBox5.Text))
                    editEmployee.DateOfBirth = Convert.ToDateTime(TextBox5.Text);
                
               
                
                    editEmployee.Email = TextBox6.Text;
                
                
                
                    editEmployee.Password = TextBox7.Text;
                
                
                
                    editEmployee.Department = new BLL.Department(Convert.ToInt32(DropDownList1.SelectedValue));
                
                BLL.Employee.UpdateEmployee(editEmployee);
                Response.Write("<script>alert('Updated Successfully');</script>");
            }
            if (Button1.Text.Equals("Add"))
            {
                BLL.Employee newEmployee;
                newEmployee = new BLL.Employee();
             
                newEmployee.EmployeeCode = TextBox1.Text;
                newEmployee.DateOfJoining = Convert.ToDateTime(TextBox2.Text);
                newEmployee.FirstName = TextBox3.Text;
                newEmployee.LastName = TextBox4.Text;
                newEmployee.DateOfBirth = Convert.ToDateTime(TextBox5.Text);
                newEmployee.Email = TextBox6.Text;
                newEmployee.Password = TextBox7.Text;
                newEmployee.LoginName = TextBox8.Text;
                newEmployee.Department=  new BLL.Department(Convert.ToInt32(DropDownList1.SelectedValue));
                newEmployee.Role = 'U';

                BLL.Employee.InsertEmployee(newEmployee);
                Response.Write("<script>alert('Added Successfully');</script>");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/Default.aspx");
        }

    }
}