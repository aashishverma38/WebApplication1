<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Phototags.aspx.cs" Inherits="WebApplication1.Photos.Phototags" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <center>
    <asp:Image ID="Image1" runat="server" Width="275" Height="250" /><br />
    
    <h2>
    <b>TAGS:  </b>
    <asp:Table ID="tagstable" runat="server">
    </asp:Table>
    </h2>
    
    <b>Enter Tags:</b>&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="usertag" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;<asp:Button ID="usernewtag" runat="server" Text="ADD NEW TAG" 
        onclick="usernewtag_Click" />

    
    
    </center>
</asp:Content>
