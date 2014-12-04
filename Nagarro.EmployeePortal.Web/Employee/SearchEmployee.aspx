<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/PortalTemplate.Master" Theme="MainTheme" CodeBehind="SearchEmployee.aspx.cs" Inherits="Nagarro.EmployeePortal.Web.Employee.SearchEmployee" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="mainContentPlaceHolder">
    <h2>Search Employee</h2>

    <%-- <asp:table ID="Table1" runat="server" style="font-family: Arial; font-size: small" cellpadding="10" cellspacing="5" width="100%" border="1" >
        <tr>
            <td align="right">
                <strong>Employee Code:</strong>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
            <td align="right">
               <strong>Date of Joining:</strong>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                <strong>First Name:</strong>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
            <td align="right">
                <strong>Last Name:</strong>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td  align="right">
                <strong>Department:</strong>
                <asp:DropDownList ID="DropDownList1" runat="server" >
                    <asp:ListItem Selected="True" Value="1">HR</asp:ListItem>
                    <asp:ListItem Value="2">Administration</asp:ListItem>
                    <asp:ListItem Value="3">Finance</asp:ListItem>
                    <asp:ListItem Value="4">IT</asp:ListItem>
                    <asp:ListItem Value="5">Engineering</asp:ListItem>
                    <asp:ListItem Value="6">Marketing</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td align="right">
                <asp:Button ID="Button1" runat="server" Text="Search" />
            </td>
        </tr>

    </asp:table>--%>

    <asp:Table ID="Table1" runat="server" BackColor="#CCCCCC" BorderColor="Gray" BorderWidth="1px" ForeColor="Black" Width="100%">
        <asp:TableRow runat="server" HorizontalAlign="Right" VerticalAlign="Middle">
            <asp:TableCell runat="server" HorizontalAlign="Right" VerticalAlign="Middle">
                <strong>Employee Code:</strong>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

            </asp:TableCell>
            <asp:TableCell runat="server" HorizontalAlign="Right" VerticalAlign="Middle">
                <strong>Date of Joining:</strong>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>

            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server" HorizontalAlign="Right" VerticalAlign="Middle">
            <asp:TableCell runat="server" HorizontalAlign="Right" VerticalAlign="Middle">
                <strong>First Name:</strong>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>

            </asp:TableCell>
            <asp:TableCell runat="server">
                <strong>Last Name:</strong>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>

            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server" HorizontalAlign="Right" VerticalAlign="Middle">
            <asp:TableCell runat="server" HorizontalAlign="Right" VerticalAlign="Middle">
                <strong>Department:</strong>
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem Selected="True" Value="0">No Name</asp:ListItem>
                    <asp:ListItem Value="1">HR</asp:ListItem>

                    <asp:ListItem Value="2">Administration</asp:ListItem>

                    <asp:ListItem Value="3">Finance</asp:ListItem>

                    <asp:ListItem Value="4">IT</asp:ListItem>

                    <asp:ListItem Value="5">Engineering</asp:ListItem>

                    <asp:ListItem Value="6">Marketing</asp:ListItem>

                </asp:DropDownList>

            </asp:TableCell>
            <asp:TableCell runat="server" HorizontalAlign="Right" VerticalAlign="Middle">
                <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />

            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <br />

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EnableModelValidation="True" Width="100%" AllowPaging="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" PageSize="3" OnPageIndexChanging="GridView1_PageIndexChanging">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
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
            <asp:HyperLinkField Text="View Detail" DataNavigateUrlFields="EmployeeId" DataNavigateUrlFormatString="~/Employee/EmployeeDetails.aspx?id={0}" />
        </Columns>


        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerSettings Mode="NumericFirstLast" PageButtonCount="2" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />


    </asp:GridView>
</asp:Content>
