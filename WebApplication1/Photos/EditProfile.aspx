<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="WebApplication1.Photos.EditProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 66%;
        }
        .style2
        {
            width: 304px;
        }
        .style3
        {
            width: 493px;
        }
        .style4
        {
            width: 294px;
        }
        .style5
        {
            width: 294px;
            height: 64px;
        }
        .style6
        {
            width: 304px;
            height: 64px;
        }
        .style7
        {
            width: 493px;
            height: 64px;
        }
        .style8
        {
            width: 294px;
            height: 42px;
        }
        .style9
        {
            width: 304px;
            height: 42px;
        }
        .style10
        {
            width: 493px;
            height: 42px;
        }
        .style11
        {
            width: 294px;
            height: 22px;
        }
        .style12
        {
            width: 304px;
            height: 22px;
        }
        .style13
        {
            width: 493px;
            height: 22px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <center>
    <asp:HyperLink ID="HyperLink1" runat="server" Text="EDIT YOUR BUDDY ICON" 
                        NavigateUrl="EditBuddyIcon.aspx" ForeColor="#003399" Font-Size="Large" 
                        Font-Bold="True"></asp:HyperLink>
    </center>
                        <br />


    <table class="style1">
        <tr>
            <td class="style5">
                <br />
<asp:Label ID="Label2" runat="server" Font-Size="Large" Text="Your Profile" Font-Bold="True"></asp:Label>
            </td>
            <td class="style6">
            </td>
            <td class="style7">
            </td>
        </tr>
        <tr>
            <td class="style8">
                <asp:Label ID="Label3" runat="server" Text="FristName" Font-Bold="True" 
                    Font-Size="Medium"></asp:Label>
            </td>
            <td class="style9">
                <br />
    <asp:TextBox ID="TextFirstName" runat="server" 
        ontextchanged="TextFirstName_TextChanged" Width="213px"></asp:TextBox>
                <br />
                <br />
            </td>
            <td class="style10">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextFirstName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style11">
                <br />
    <asp:Label ID="Label4" runat="server" Text="LastName" Font-Bold="True" Font-Size="Medium"></asp:Label>
                <br />
                <br />
                <br />
            </td>
            <td class="style12">
    &nbsp;<asp:TextBox ID="TextLastName" runat="server" style="margin-left: 0px; margin-top: 0px;" 
        Width="213px" ontextchanged="TextLastName_TextChanged" Height="24px"></asp:TextBox>
            </td>
            <td class="style13">
            </td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Labelxy" runat="server" Text="Email" Font-Bold="True" 
                    Font-Size="Medium"></asp:Label>
                <br />
                <br />
            </td>
            <td class="style2">
                <br />
    <asp:TextBox ID="TextEmail" runat="server" 
        ontextchanged="TextEmail_TextChanged" Width="212px"></asp:TextBox>
                <br />
                <br />
            </td>
            <td class="style3">
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="TextEmail" ErrorMessage="*" 
        ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                <br />
    <asp:Label ID="Label5" runat="server" Text="Question" Font-Bold="True" Font-Size="Medium"></asp:Label>
                <br />
                <br />
            </td>
            <td class="style2">
                <br />
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>What is your first teacher name?</asp:ListItem>
                    <asp:ListItem>Where you are born?</asp:ListItem>
                    <asp:ListItem>What is your nick name?</asp:ListItem>
                    <asp:ListItem>What is your First school name</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
            </td>
            <td class="style3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                <br />
                <asp:Label ID="Label6" runat="server" Text="Answer" Font-Bold="True" 
                    Font-Size="Medium"></asp:Label>
                <br />
            </td>
            <td class="style2">
    <asp:TextBox ID="TextAnswer" runat="server" Width="271px"></asp:TextBox>
                </td>
            <td class="style3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="TextAnswer" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                <br />
                <br />
                <br />
                <br />
    <asp:Button ID="Update" runat="server" onclick="Update_Click" Text="Update" />
            </td>
            <td class="style2">
                <asp:Label ID="FormSuccess" runat="server" ForeColor="#33CC33" Font-Bold="True" 
                    Font-Size="Medium"></asp:Label>
            </td>
            <td class="style3">
                &nbsp;</td>
        </tr>
    </table>
<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    &nbsp;&nbsp;&nbsp;
    &nbsp;<br />
    <br />
    <br />
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;
    <br />
    <br />
    <br />
&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <br />
    <br />
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
<br />
<br />
<br />
<br />
<br />
<br />
</asp:Content>
