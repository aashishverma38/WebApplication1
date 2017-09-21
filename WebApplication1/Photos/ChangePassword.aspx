<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="WebApplication1.Photos.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 54%;
        }
        .style2
        {
            width: 151px;
        }
        .style3
        {
            width: 128px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
    <br />
    <asp:Label ID="Label1" runat="server" Font-Size="Large" Text="Change Password" 
            Font-Bold="True"></asp:Label>
</p>
    <table class="style1">
        <tr>
            <td class="style2">
    <asp:Label ID="Label2" runat="server" Text="Old Password" Font-Bold="True" 
                    Font-Size="Medium"></asp:Label>
            </td>
            <td class="style3">
    <asp:TextBox ID="TextOldPassword" runat="server" Height="16px" 
        style="margin-top: 0px" Width="130px" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextOldPassword" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
    <asp:Label ID="Label3" runat="server" Text="New Password" Font-Bold="True" 
                    Font-Size="Medium"></asp:Label>
            </td>
            <td class="style3">
    <asp:TextBox ID="TextNewPassword" runat="server" style="margin-left: 1px" 
        Width="131px" Height="17px" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextNewPassword" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
    <asp:Label ID="Label4" runat="server" Text="Confirm Password" Font-Bold="True" 
                    Font-Size="Medium"></asp:Label>
            </td>
            <td class="style3">
    <asp:TextBox ID="TextConfirmPassword" runat="server" style="margin-left: 0px" 
        Height="16px" Width="130px" TextMode="Password"></asp:TextBox>
            </td>
            <td>
    <asp:CompareValidator ID="CompareValidator1" runat="server" 
        ControlToCompare="TextNewPassword" ControlToValidate="TextConfirmPassword" 
        ErrorMessage="Confirm Password and new Password should be same" 
        ForeColor="#FF3300"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
        Text="Change Password" />
            </td>
            <td class="style3">
                <asp:Label ID="FormSuccess" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
<p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
<p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
<p>
&nbsp;
    </p>
<p>
    &nbsp;</p>
<p>
</p>
</asp:Content>
