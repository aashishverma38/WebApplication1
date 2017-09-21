<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="WebApplication1.Account.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 44%;
        }
        .style2
        {
        }
        .style3
        {
            width: 311px;
        }
        .style4
        {
            width: 402px;
        }
        .style5
        {
            width: 318px;
        }
        .style6
        {
            width: 53%;
        }
        .style7
        {
            width: 178px;
        }
        .style9
        {
            width: 318px;
            height: 38px;
        }
        .style10
        {
            width: 402px;
            height: 38px;
        }
        .style11
        {
            width: 311px;
            height: 38px;
        }
        .style12
        {
            width: 222px;
        }
        .style13
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
    </p>
    <p>
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" 
            Text="Forget Password"></asp:Label>
    </p>
    <p>
        <asp:Label ID="Label3" runat="server" Font-Size="Large" 
            Text="Fill Your Username"></asp:Label>
    </p>
        
    <asp:table id="UserNameTable" class="style6" runat="server">
        <asp:TableRow>
            <asp:TableCell class="style7">
                <asp:Label ID="LabelUserName" runat="server" Text="UserName"></asp:Label>
            </asp:TableCell>
            <asp:TableCell class="style12">
                <asp:TextBox ID="TextUserName" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="UserNameValidator" runat="server" 
                    ControlToValidate="TextUserName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell class="style7">
                <asp:Button ID="Button2" runat="server" Height="24px" onclick="Button2_Click" 
                    Text="Submit" />
            </asp:TableCell>
            <asp:TableCell class="style12">
                <asp:Label ID="UserNameSuccess" runat="server" ForeColor="Black" Font-Bold="True"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                &nbsp;</asp:TableCell>
        </asp:TableRow>
    </asp:table>
   
    <asp:table  id="ForgotPassword" class="style2" runat="server" Width="518px">
       <asp:TableRow>
            <asp:TableCell class="style9">
                <asp:Label ID="QuestionLabel"  Font-Bold="True" Font-Size="Medium"  runat="server" Text="Question"></asp:Label>
            </asp:TableCell>
            <asp:TableCell class="style10">
                <asp:Label ID="TextQuestion" Font-Size="Medium"  runat="server" ForeColor="Blue"></asp:Label>
            </asp:TableCell> 
            <asp:TableCell class="style11">
                
             &nbsp;
            </asp:TableCell>
         </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell class="style5">
                <asp:Label ID="AnswerLabel" runat="server" Text="Your Answer"></asp:Label>
            </asp:TableCell>
            <asp:TableCell class="style4">
                <asp:TextBox ID="TextAnswer" runat="server" Width="185px"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell class="style3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextAnswer" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
         </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell class="style5">
                New Password</asp:TableCell>
            <asp:TableCell class="style4">
                <asp:TextBox ID="TextNewPassword" runat="server" TextMode="Password" 
                    Width="183px"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell class="style3">
                <asp:RequiredFieldValidator ID="RequiredNewPassword" runat="server" 
                    ErrorMessage="*" ForeColor="Red" ControlToValidate="TextNewPassword"></asp:RequiredFieldValidator>
            </asp:TableCell>
         </asp:TableRow>
       <asp:TableRow>
            <asp:TableCell class="style5">
                <asp:Label ID="Label2" runat="server" Text="Confirm Password"></asp:Label>
            </asp:TableCell>
            <asp:TableCell class="style4">
                <asp:TextBox ID="TextConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell class="style3">
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="TextNewPassword" ControlToValidate="TextConfirmPassword" 
                    ErrorMessage="Both Password should be match" 
                    ForeColor="#FF6666"></asp:CompareValidator>
            </asp:TableCell>
         </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell class="style5">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                    Text="Change Password" />
            </asp:TableCell>
            <asp:TableCell class="style4">
                <asp:Label ID="FormSuccess" runat="server" ForeColor="Black" Font-Bold="True"></asp:Label>
            </asp:TableCell>
            <asp:TableCell class="style3">
                &nbsp;</asp:TableCell>
         </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell class="style5">
                &nbsp;</asp:TableCell>
            <asp:TableCell class="style4">
                &nbsp;</asp:TableCell>
            <asp:TableCell class="style3">
                &nbsp;</asp:TableCell>
         </asp:TableRow>
     </asp:table>
    
    <p>
    </p>
</asp:Content>
