<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditBuddyIcon.aspx.cs" Inherits="WebApplication1.Photos.EditBuddyIcon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<center>

<br /><br />
    <asp:Label ID="Label2" runat="server" Text="YOUR PROFILE PICTURE" 
        Font-Size="Medium" Font-Bold="True"></asp:Label><br /><br />
    <asp:Image ID="profilepicture" runat="server" Width="150" Height="150" /><br /><br />

    <asp:Label ID="Label1" runat="server" Text="UPLOAD PHOTO" Font-Bold="True" Font-Size="Medium"></asp:Label><br /><br />
    <asp:FileUpload ID="filUpload" runat="server" />&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnUpload" runat="server" Text="UPLOAD" OnClick="btnUpload_Click" /><br /><br />
    <asp:Label ID="lblStatus" runat="server"></asp:Label>

    <asp:Label ID="lblHead" runat="server" Text="Your Profile Picture"></asp:Label><br /><br />
    <asp:Image ID="imgUpload" runat="server" Width="150" Height="150" />

</center>
</asp:Content>
