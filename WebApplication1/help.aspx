<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="help.aspx.cs" Inherits="WebApplication1.help" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">

        .style1
        {
            width: 74%;
            margin-left: 0px;
        }
        .style2
        {
            width: 149px;
            align: left;
        }
        .style3
        {
            width: 149px;
            align: left;
            height: 33px;
        }
        .style4
        {
            height: 33px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Large" 
        Text="Ask  from Administrator"></asp:Label>
    <br />
    <br />
    <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <table class="style1">
            <tr>
                <td class="style2">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Medium" 
                        Text="TO(FlickrName) :"></asp:Label>
                </td>
                <td>
                    &nbsp;<asp:Label ID="ReceiverTextBox" runat="server" Font-Bold="True" 
                        Font-Size="Medium" ForeColor="Black" Text="Administrator"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" 
                        Text="Subject :"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="SubjectTextBox" runat="server" Height="44px" Width="462px" 
                        TextMode="MultiLine"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="SubjectTextBox" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Medium" 
                        Text="Body :"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="BodyTextBox" runat="server" Height="245px" Width="462px" 
                        TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                </td>
                <td class="style4">
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Send" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="SuccessText" runat="server" Font-Bold="True" Font-Size="Medium" 
                        ForeColor="#33CC33" Text="Your Message send Successfully !"></asp:Label>
                    <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="FaiureText" runat="server" Font-Bold="True" Font-Size="Medium" 
                        ForeColor="#FF3300" Text="Sorry! FlcikrMail  is not valid."></asp:Label>
                    <br />
                </td>
            </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
