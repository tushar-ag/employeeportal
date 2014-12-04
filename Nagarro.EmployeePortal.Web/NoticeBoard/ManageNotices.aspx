<%@ Page Language="C#" MasterPageFile="~/PortalTemplate.Master" Theme="MainTheme" AutoEventWireup="true" CodeBehind="ManageNotices.aspx.cs" Inherits="Nagarro.EmployeePortal.Web.NoticeBoard.ManageNotices" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="mainContentPlaceHolder">
    
<h2>
    Manage Notices
</h2>
    <div align="right">
        <asp:Button ID="addButton" runat="server" Text="Add New Notice" OnClick="addButton_Click" 
            Height="100%" Width="108px" />
            </div>
    <br />

    <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" EnableModelValidation="True"  OnRowCommand="GridView1_RowCommand"  OnRowDeleting="GridView1_RowDeleting" AllowPaging="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" PageSize="5" OnPageIndexChanging="GridView1_PageIndexChanging">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="NoticeId" HeaderText="Notice Id" />
            <asp:BoundField DataField="Title" HeaderText="Title" />
            <asp:BoundField DataField="StartDate" HeaderText="Start Date"  DataFormatString="{0:dd-MMM-yyyy}"/>
            <asp:BoundField DataField="ExpirationDate" HeaderText="Expiration Date" DataFormatString="{0:dd-MMM-yyyy}" />
            <asp:TemplateField HeaderText="Posted By">
                <ItemTemplate>
                    <%# Eval("PostedByName")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField Text="Edit" DataNavigateUrlFields="NoticeId" DataNavigateUrlFormatString="~/NoticeBoard/AddEditNotice.aspx?id={0}" />
            <asp:TemplateField>
               <ItemTemplate>
               <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument=' <%#Eval("NoticeId") %>' CommandName="Delete"  Text="Delete"  OnClientClick='<%# Eval("NoticeId", "return confirm(\"Are you sure want to delete the notice (notice ID:{0})?\");") %>'>Delete</asp:LinkButton>
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