<%@ Page Language="C#" MasterPageFile="~/PortalTemplate.Master" Theme="MainTheme" AutoEventWireup="true" CodeBehind="AddNewIssue.aspx.cs" Inherits="Nagarro.EmployeePortal.Web.IssueTracker.AddNewIssue" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="mainContentPlaceHolder">

    <h2>
    <asp:Label ID="headinglabel" runat="server" Text="Label"></asp:Label>
    </h2>
    <br />

    <table style="font-family:Arial;font-size:medium" cellpadding="10" cellspacing="5" align="center">
        <tr>
            <td align="right">
                <strong><asp:Label ID="IDlabel" runat="server" Text="Issue ID:"></asp:Label></strong>
            </td>
            <td>
                <asp:Label ID="IDvaluelabel" runat="server" Text="Label"></asp:Label>
            </td>
            
        </tr>
        <tr>
            <td align="right"><strong>Title:</strong></td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>

        </tr>
        <tr>
            <td align="right"><strong>Description:</strong></td>
            <td>
                <textarea id="TextArea1" cols="30" rows="7" runat="server"></textarea>
            </td>
        </tr>
        <tr>
            <td align="right"><strong>Priority:</strong></td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" Width="128px">
                    <asp:ListItem Selected="True" Value="1">Normal</asp:ListItem>
                    <asp:ListItem Value="2">Immediate</asp:ListItem>
                    <asp:ListItem Value="3">Urgent</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align ="right">
                <strong>
                    <asp:Label ID="statuslabel" runat="server" Text="Status"></asp:Label>
                </strong>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" Width="128px">
                    <asp:ListItem Selected="True" Value="1">Raised</asp:ListItem>
                    <asp:ListItem Value="2">Work In Progress</asp:ListItem>
                    <asp:ListItem Value="3">Resolved</asp:ListItem>
                    <asp:ListItem Value="4">Closed</asp:ListItem>

                </asp:DropDownList>
            </td>
        </tr>


    </table>
    <br />
    <div runat ="server" align="center">
    <asp:Button ID="Button1" runat="server" Text="Update" Width="57px" OnClick="Button1_Click" />
    <asp:Button ID="Button2" runat="server" Text="Cancel" OnClick="Button2_Click" />
        </div>


    </asp:Content>