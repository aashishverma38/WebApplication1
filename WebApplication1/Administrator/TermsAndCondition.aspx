<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TermsAndCondition.aspx.cs" Inherits="WebApplication1.Administrator.TermsAndCondition" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" 
        Text="Terms And Conditions"></asp:Label>
&nbsp; <br/> 
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="TextBox1" ErrorMessage="Please Fill the Box" 
        ForeColor="#FF3300"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Success" runat="server" Font-Size="Medium" ForeColor="#009933" 
        Text="Successfully Updated!"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
<br />
<br />
<asp:TextBox ID="TextBox1" runat="server" Font-Size="Medium" Height="353px" 
     TextMode="MultiLine" Width="629px" Font-Bold="True"></asp:TextBox>
<br />
<br />
<br />
<asp:Button ID="Button1" runat="server" Font-Bold="True" Font-Size="Medium" 
    onclick="Button1_Click" Text="Update" />
<br />
<br/> <br/>

</asp:Content>
