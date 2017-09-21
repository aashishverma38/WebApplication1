<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShowEmail.aspx.cs" Inherits="WebApplication1.Mail.ShowEmail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 97px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    
    
    
        <br />
        <br />
    
    
    
    
        <table class="style1">
            <tr>
                <td class="style2">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" 
                        Text="Sender :"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="SenderName" runat="server" Font-Bold="True"></asp:Label>
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="Label" runat="server" Font-Bold="True" Font-Size="Large" 
                        Text="Subject:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Subject" runat="server" Font-Bold="True"></asp:Label>
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" 
                        Text="Message :"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Message" runat="server" Font-Bold="True"></asp:Label>
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Delete" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="BACK" />
                    <br />
                    <br />
                    </td>
            </tr>
        </table>
        <br />
    
    
    
    
</asp:Content>
