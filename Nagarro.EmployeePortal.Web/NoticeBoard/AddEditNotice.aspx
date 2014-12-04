<%@ Page Language="C#" MasterPageFile="~/PortalTemplate.Master" Theme="MainTheme" AutoEventWireup="true" CodeBehind="AddEditNotice.aspx.cs" Inherits="Nagarro.EmployeePortal.Web.NoticeBoard.AddEditNotice" %>

  
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="mainContentPlaceHolder">
     <h2>
    <asp:Label ID="headinglabel" runat="server" Text="Label"></asp:Label>
    </h2>
    <br />

    <table style="font-family:Arial;font-size:medium" cellpadding="10" cellspacing="5" align="center">
        <tr>
            <td align="right">
               <strong><asp:Label ID="IDlabel" runat="server" Text="Notice ID:"></asp:Label></strong>
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
            <td align="right">
                <strong>Start Date:</strong>
            </td>
            <td>
                <asp:TextBox ID="startdatebox" runat="server"></asp:TextBox>
                <ajaxtoolkit:calendarextender id="CalendarExtender1" runat="server" targetcontrolid="startdatebox"  Format="dd/MM/yyyy">
                </ajaxtoolkit:calendarextender>

            </td>
        </tr>
         <tr>
            <td align="right">
                <strong>Expiration Date:</strong>
            </td>
            <td>
                <asp:TextBox ID="expirationdatebox" runat="server"></asp:TextBox>
                <ajaxtoolkit:calendarextender id="CalendarExtender2" runat="server" targetcontrolid="expirationdatebox"  Format="dd/MM/yyyy">
                </ajaxtoolkit:calendarextender>
           </td>
        </tr>
        <tr>
            <td align="right">
                <strong>
                    <asp:Label ID="postedbylabel" runat="server" Text="Posted By:"></asp:Label>
                </strong>
            </td>
            <td>
                <asp:Label ID="postedbylabelvalue" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>

        </table>
     <br />
    <div id="Div1" runat ="server" align="center">
    <asp:Button ID="Button1" runat="server" Text="Update" Width="57px" OnClick="Button1_Click" />
    <asp:Button ID="Button2" runat="server" Text="Cancel" OnClick="Button2_Click" />
        </div>
    <ajaxtoolkit:ToolkitScriptManager id="scriptmanager1" runat="server"></ajaxtoolkit:ToolkitScriptManager>
    </asp:Content>