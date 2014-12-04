<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/PortalTemplate.Master" Theme="MainTheme" CodeBehind="ManageEmployees.aspx.cs" Inherits="Nagarro.EmployeePortal.Web.Employee.ManageEmployees" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="mainContentPlaceHolder">
    <h2>Manage Employees</h2>
    <div align="right">
        <asp:Button ID="addButton" runat="server" Text="Add Employee" OnClick="addButton_Click" 
            Height="100%" Width="100px" />
            </div>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EnableModelValidation="True" Width="100%" OnRowCommand="GridView1_RowCommand"  OnRowDeleting="GridView1_RowDeleting" AllowPaging="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" PageSize="3" OnPageIndexChanging="GridView1_PageIndexChanging">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
           <%-- <asp:BoundField DataField="EmployeeId" HeaderText="Employee Id" />--%>


            <asp:BoundField DataField="EmployeeCode" HeaderText="Employee Code" />
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <%#string.Concat(Eval("FirstName"),string.Concat(" ",Eval("LastName")))%>
                </ItemTemplate>
            </asp:TemplateField>


            
            <asp:BoundField DataField="DateOfJoining" HeaderText="Date of Joining" DataFormatString="{0:dd-MMM-yyyy}" />
            <asp:TemplateField HeaderText="Department">
                <ItemTemplate>
                    <%#Eval("Department.DepartmentName") %>

                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:HyperLinkField Text="Edit" DataNavigateUrlFields="EmployeeId" DataNavigateUrlFormatString="~/Employee/EditEmployee.aspx?id={0}" />
           <asp:TemplateField>
               <ItemTemplate>
               <asp:LinkButton runat="server" CommandArgument=' <%#Eval("EmployeeId") %>' CommandName="Delete"  Text="Delete"  OnClientClick='<%# Eval("EmployeeCode", "return confirm(\"Are you sure want to delete the employee (code:{0})?\");") %>'>Delete</asp:LinkButton>
                   </ItemTemplate>
               </asp:TemplateField> 
        </Columns>
        

        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerSettings Mode="NumericFirstLast" PageButtonCount="2" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        

    </asp:GridView>

   <%-- <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1" runat="server">
        <title></title>
    </head>
    <body>
        <script type="text/javascript">
            function DeleteItem(Id) 
            {

            }

        </script>
    </body>
    </html>--%>



    </asp:Content>



