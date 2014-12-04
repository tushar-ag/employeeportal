<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="Employee.WEB.Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1 align="center" style="border-style: groove; background-color: #808080;">Employee Details</h1>
    </div>
        <div id="EmployeeTable">
            
    <asp:GridView ID="ViewAllEmployees" runat="server" AutoGenerateColumns="False" DataKeyNames="EmployeeID" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
        <Columns>
            <asp:TemplateField HeaderText="Employee Name">
                <ItemTemplate>
                    <%#Eval("EmployeeName") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtEmployeeName" runat="server" Text='<%#Eval("EmployeeName") %>'></asp:TextBox>

                </EditItemTemplate>
               <FooterTemplate>
                   <asp:TextBox ID="txtNewEmployeeName" runat="server"></asp:TextBox>
               </FooterTemplate>

            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Date Of Birth">
                <ItemTemplate>
                    <%#Eval("DateOfBirth") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtDateOfbirth" runat="server" Text='<%#Eval("DateOfBirth") %>'></asp:TextBox>

                </EditItemTemplate>
               <FooterTemplate>
                   <asp:TextBox ID="txtNewDateOfBirth" runat="server"></asp:TextBox>
               </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Phone Number">
                <ItemTemplate>
                    <%#Eval("PhoneNumber") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtPhoneNumber" runat="server" Text='<%#Eval("PhoneNumber") %>'></asp:TextBox>

                </EditItemTemplate>
               <FooterTemplate>
                   <asp:TextBox ID="txtNewPhoneNumber" runat="server"></asp:TextBox>
               </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="btnedit" runat="server" CommandName="Edit" Text="Edit" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="btnupdate" runat="server" CommandName="Update" Text="Update" />
                    <asp:LinkButton ID="btncancel" runat="server" CommandName="Cancel" Text="Cancel" />
                    <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="btnInsert" runat="Server" Text="Insert" CommandName="Insert" UseSubmitBehavior="False" />
                </FooterTemplate>
            </asp:TemplateField>    
        </Columns>
            </asp:GridView>
        </div>
        <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="AddNewRecord" />

    </form>
</body>
</html>
