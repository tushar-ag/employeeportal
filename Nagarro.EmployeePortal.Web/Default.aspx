<%@ Page AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Nagarro.EmployeePortal.Web.Default"
    Language="C#" MasterPageFile="~/PortalTemplate.Master" Theme="MainTheme" Title="Home" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="mainContentPlaceHolder">
    <h2>Home</h2>
    <div align="left">
        <!-- Page Content Here-->
        <h3>Notice Board</h3>
        <br />
        <div>
            <asp:ListView ID="ListView1" runat="server" OnPagePropertiesChanging="ListView1_PagePropertiesChanging">
                <LayoutTemplate>
                    <table width="600px">
                        <tr runat="server" id="itemPlaceholder">
                        </tr>
                    </table>
                    <asp:DataPager ID="DataPager1" runat="server" PageSize="2" >
                        <Fields>
                             
                                   <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="true" ShowPreviousPageButton="true"
                            ShowNextPageButton="false" ButtonCssClass="last_button"  />
                        <asp:NumericPagerField ButtonType="Link" CurrentPageLabelCssClass="current_page" NumericButtonCssClass="numeric_button" NextPreviousButtonCssClass="next_button" />
                        <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="true" ShowPreviousPageButton = "false" ButtonCssClass="last_button" />
                
                        </Fields>
                    </asp:DataPager>
                    <style type="text/css">
     .numeric_button{background-color:#384B69;color:#FFFFFF;font-family:Arial;padding:2px;  border:none;}
    .current_page{background-color:#09151F;color:#FFFFFF;font-family:Arial;padding:2px;}
    .next_button{background-color:#1F3548;color:#FFFFFF;font-family:Arial;padding:2px;}
    .last_button{background-color:#1F3548;color:#FFFFFF;font-family:Arial;padding:2px;}
   </style>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr id="Tr1" runat="server">
                        <td id="Td1" runat="server">
                           
                            <b>
                            <asp:Label ID="Title" runat="server" Text='<%#Eval("Title") %>' ForeColor="#94283A" Font-Size="Large" />
                            <br />
                            <asp:Label ID="PostedOn" runat="server" Text='<%#Eval("StartDate" , "{0:dd MMM yyyy}") %>' /></b>
                            <br />
                            <hr />
                            <asp:Label ID="Description" runat="server" Text='<%#Eval("Description") %>' />
                            <br />
                            <br />
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
            <%--datapager cant be used with datalist
            <%--<asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                <ItemTemplate>
                             <b>
                             <asp:Label ID="Title" runat="server" Text='<%#string.Concat("Notice ",Eval("NoticeId")) %>' ForeColor="Black" /></b>
                            <br />                          
                            <asp:Label ID="PostedOn" runat="server" Text='<%#Eval("StartDate" , "{0:dd MMM yyyy}") %>' />
                            <br />
                            <hr />
                            <asp:Label ID="Description" runat="server" Text='<%#Eval("Description") %>' />
                            <br />
                            <br />
                </ItemTemplate>
            </asp:DataList>--%>


        </div>
        <h3>My Open Issues</h3>
         <asp:Label ID="Label2" runat="server" ForeColor="Blue"></asp:Label>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EnableModelValidation="True" Width="665px" AllowPaging="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" PageSize="2" OnPageIndexChanging="GridView1_PageIndexChanging">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="IssueId" HeaderText="Issue Id"  />
                    <asp:BoundField DataField="Title" HeaderText="Title"  />
                    <asp:BoundField DataField="DatePosted" HeaderText="Posted On" DataFormatString="{0:dd-MMM-yyyy}"  />
                    <asp:TemplateField HeaderText="Posted By" >
                    <ItemTemplate>
                       <%-- <%#GetName((int)Eval("PostedBy"))%>--%>         <%--also correct--%>
                        <%#Eval("PostedByName")%>
                    </ItemTemplate>

                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <%#Eval("StatusName") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:HyperLinkField Text="View Detail" DataNavigateUrlFields="IssueId" DataNavigateUrlFormatString="~/IssueTracker/IssueDetails.aspx?id={0}" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NumericFirstLast" PageButtonCount="2" />
                <PagerStyle BackColor="#F7F7DE" BorderStyle="None" ForeColor="#003366" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>
