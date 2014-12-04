<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/PortalTemplate.Master" Theme="MainTheme" CodeBehind="EmployeeDetails.aspx.cs" Inherits="Nagarro.EmployeePortal.Web.Employee.EmployeeDetails" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="mainContentPlaceHolder">
    <h2 style="margin-bottom:0%">
        Employee Details
       </h2> 
        <div align="right">
        <asp:Button ID="Button3" runat="server" Text="Back" OnClick="Button3_Click" 
            Height="100%" Width="50px" />
            </div>
    <asp:FormView ID="FormView1" runat="server" margin-top="37px" Width="100%" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" OnPageIndexChanging="FormView1_PageIndexChanging">
        
       
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <ItemTemplate>
         <table style="font-family: Arial; font-size: small" cellpadding="10" cellspacing="5">
                <tr>
                    <td>
                        <strong>Employee Code:</strong>
                    </td>
                    <td>
                        <asp:Label ID="Label1" runat="Server" Text='<%# Eval("EmployeeCode")%>' Height="25px"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td>
                        <strong>Date of Joining:</strong>
                    </td>
                    <td>
                        <asp:Label ID="Label2" runat="Server" Text='<%# Eval("DateOfJoining", "{0:dd-MMM-yyyy}")%>'  Height="25px"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td>
                       <strong>First Name:</strong>
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="Server" Text='<%# Eval("FirstName")%>'  Height="25px"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td>
                        <strong>Last Name:</strong>
                    </td>
                    <td>
                        <asp:Label ID="Label4" runat="Server" Text='<%#Eval("LastName")%>'  Height="25px"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td>
                        <strong>Date of Birth:</strong>
                    </td>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("DateOfBirth", "{0:dd-MMM-yyyy}") %>'  Height="25px"></asp:Label>
                    </td>
                </tr>
             <tr>
                    <td>
                        <strong>Email ID:</strong>
                    </td>
                    <td>
                        <asp:Label ID="Label6" runat="Server" Text='<%#Eval("Email")%>'  Height="25px"></asp:Label>
                    </td>
                </tr>
             <tr>
                    <td>
                        <strong>Department:</strong>
                    </td>
                    <td>
                        <asp:Label ID="Label7" runat="Server" Text='<%#Eval("Department.DepartmentName")%>'  Height="25px"></asp:Label>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
        


    </asp:FormView>


    </asp:Content>