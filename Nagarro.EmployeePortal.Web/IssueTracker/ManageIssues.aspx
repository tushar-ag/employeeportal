<%@ Page Language="C#" MasterPageFile="~/PortalTemplate.Master" Theme="MainTheme" AutoEventWireup="true" CodeBehind="ManageIssues.aspx.cs" Inherits="Nagarro.EmployeePortal.Web.IssueTracker.ManageIssues" %>


<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="mainContentPlaceHolder">
    
<h2>
    Manage Issues
</h2>
    <div align="right">
        <asp:Button ID="addButton" runat="server" Text="Add New Issue" OnClick="addButton_Click" 
            Height="100%" Width="100px" />
            </div>
    <br />
    <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" EnableModelValidation="True" OnRowCommand="GridView1_RowCommand"  OnRowDeleting="GridView1_RowDeleting" AllowPaging="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" PageSize="5" OnPageIndexChanging="GridView1_PageIndexChanging">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="IssueId" HeaderText="Issue Id" />
            <asp:BoundField DataField="Title" HeaderText="Title" />
            <asp:BoundField DataField="DatePosted" HeaderText="Posted On" />
            <asp:TemplateField HeaderText="Posted By">
                <ItemTemplate>
                    <%# Eval("PostedByName")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                    <%#Eval("StatusName")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField Text="Edit" DataNavigateUrlFields="IssueId" DataNavigateUrlFormatString="~/IssueTracker/AddNewIssue.aspx?id={0}"/>
            <asp:TemplateField>
               <ItemTemplate>
               <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument=' <%#Eval("IssueId") %>' CommandName="Delete"  Text="Delete"  OnClientClick='<%# Eval("IssueId", "return confirm(\"Are you sure want to delete the issue (Issue ID:{0})?\");") %>'>Delete</asp:LinkButton>
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
</asp:Content>