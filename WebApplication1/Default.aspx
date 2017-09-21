<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Flickr._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2 align="center"> 
        Welcome to flickr!
    </h2>
    
        <% if (Session["currUser"] == null)
           { %>
            Home Page
        <% }
           else
           { %>
            <asp:Image ID="imgProfile" runat="server" Height="100" Width="100" /> &nbsp&nbsp&nbsp Hi, <b><%= Session["currUser"].ToString()%></b>
            <br /><br /><br />
            <h2>Your Uploaded Photos</h2>
            <% } %>

            
            
    <asp:Label ID="userphotoslabel" runat="server"></asp:Label>
    <asp:Table ID="imageTable" runat="server">
    </asp:Table>

    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />

</asp:Content>
