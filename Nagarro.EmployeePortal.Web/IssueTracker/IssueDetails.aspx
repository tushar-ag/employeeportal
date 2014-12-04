<%@ Page Language="C#" MasterPageFile="~/PortalTemplate.Master" AutoEventWireup="true" CodeBehind="IssueDetails.aspx.cs" Inherits="Nagarro.EmployeePortal.Web.IssueTracker.IssueDetails" Theme="MainTheme" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="mainContentPlaceHolder">
   <h2 style="margin-bottom:0%">
        Issue Details
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
                        <strong>Title:</strong>
                    </td>
                    <td>
                        <asp:Label ID="Label1" runat="Server" Text='<%# Eval("Title")%>' Height="25px"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td>
                        <strong>Posted On:</strong>
                    </td>
                    <td>
                        <asp:Label ID="Label2" runat="Server" Text='<%# Eval("DatePosted", "{0:dd-MMM-yyyy}")%>'  Height="25px"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td>
                       <strong>Posted By:</strong>
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="Server" Text='<%# Eval("PostedByName")%>'  Height="25px"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td>
                        <strong>Status:</strong>
                    </td>
                    <td>
                        <asp:Label ID="Label4" runat="Server" Text='<%#Eval("StatusName")%>'  Height="25px"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td>
                        <strong>Description:</strong>
                    </td>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Description") %>'  Height="25px"></asp:Label>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
        


    </asp:FormView>
    
    </asp:Content>