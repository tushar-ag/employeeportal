<%@ Page Language="C#" MasterPageFile="~/PortalTemplate.Master" AutoEventWireup="true" CodeBehind="EditEmployee.aspx.cs" Inherits="Nagarro.EmployeePortal.Web.Employee.EditEmployee" Theme="MainTheme" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="mainContentPlaceHolder">


    <h2>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </h2>
    <br />
    <table style="font-family:Arial;font-size:medium" cellpadding="10" cellspacing="5">
        <tr>
            <td align="right" style="width: 147px">
                <strong>Employee Code:</strong>
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Visible="false"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                <asp:Label ID="Label2" runat="server" ></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" style="width: 147px">
                <strong>Date of Joining:</strong>
            </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" Visible="false"></asp:TextBox>
                <ajaxtoolkit:calendarextender id="CalendarExtender2" runat="server" targetcontrolid="TextBox2"  Format="dd/MM/yyyy">
                </ajaxtoolkit:calendarextender>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Required Field" ToolTip="Enter the date of joining"></asp:RequiredFieldValidator>
                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" style="width: 147px">
                <strong>First Name:</strong>
            </td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" ></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ControlToValidate="TextBox3" ErrorMessage="RequiredField"></asp:RequiredFieldValidator>
                
            </td>
        </tr>
        <tr>
            <td align="right" style="width: 147px">
                <strong>Last Name:</strong>
            </td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ControlToValidate="TextBox4" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                
            </td>
        </tr>
        <tr>
            <td align="right" style="width: 147px">
                <strong>Date Of Birth:</strong>
            </td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server"  ></asp:TextBox>
                <ajaxtoolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextBox5" Format="dd/MM/yyyy">
                </ajaxtoolkit:CalendarExtender>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic" ControlToValidate="TextBox5" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox5" MaximumValue="DateTime.Now.ToShortDateString()" ErrorMessage="Enter the Correct Date"></asp:RangeValidator>
                
            </td>
        </tr>
        <tr>
            <td align="right" style="width: 147px">
                <strong>Email ID:</strong>
            </td>
            <td>
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Display="Dynamic" ControlToValidate="TextBox6" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox6" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Please Enter a Valid Email Id"></asp:RegularExpressionValidator>
                
            </td>
        </tr>
        <tr>
            <td align="right" style="width: 147px">
                <strong>Department:</strong>
            </td>
            <td>

                <asp:DropDownList ID="DropDownList1" runat="server" Width="173px">
                    <asp:ListItem Selected="True" Value="1">HR</asp:ListItem>
                    <asp:ListItem Value="2">Administration</asp:ListItem>
                    <asp:ListItem Value="3">Finance</asp:ListItem>
                    <asp:ListItem Value="4">IT</asp:ListItem>
                    <asp:ListItem Value="5">Engineering</asp:ListItem>
                    <asp:ListItem Value="6">Marketing</asp:ListItem>
                </asp:DropDownList>

            </td>
        </tr>
        <tr>
            <td align="right" style="width: 147px">
                <strong>
                    <asp:Label ID="Label4" runat="server" Text="Login Id:"></asp:Label></strong>
            </td>
            <td>

                <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" Display="Dynamic" ControlToValidate="TextBox8" runat="server" ErrorMessage="Required Field"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td align="right" style="width: 147px">
                <strong>Password:</strong>
            </td>
            <td>

                <asp:TextBox ID="TextBox7" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Display="Dynamic" ControlToValidate="TextBox7" ErrorMessage="Password must be changed !"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox7" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}" ErrorMessage="Password must contain: Minimum 8 characters atleast 1 UpperCase Alphabet, 1 LowerCase Alphabet, 1 Number and 1 Special Character"></asp:RegularExpressionValidator>

            </td>
        </tr>
    </table>
    <div align ="center">
    <asp:Button ID="Button1" runat="server" Text="Button1" OnClick="Button1_Click"/>
        <asp:Button ID="Button2" runat="server" Text="Cancel" OnClick="Button2_Click" CausesValidation="False" />
        </div>
    <ajaxtoolkit:ToolkitScriptManager id="scriptmanager1" runat="server"></ajaxtoolkit:ToolkitScriptManager>
    </asp:Content>