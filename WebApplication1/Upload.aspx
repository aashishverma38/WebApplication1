<%@ Page Title="Upload" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Upload.aspx.cs" Inherits="Flickr.Upload" %>
<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Upload
    </h2>
    <center>
        <table class="style1">
            <tr>
                <td>
                    &nbsp;Enter Photo Name: </td>
                <td>
                    &nbsp;<asp:TextBox ID="photoname" runat="server">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="photonamereq" runat="server" 
                        ErrorMessage="Enter Photo name" Text="*" ForeColor="Red" ControlToValidate="photoname"></asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td>
                    &nbsp;Enter Description: </td>
                <td>
                    &nbsp;<asp:TextBox ID="TextBox2" runat="server" 
                        TextMode="MultiLine" Wrap="False"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    &nbsp;Select Photo Accessibility: </td>
                <td>
                    <asp:RadioButton ID="access1" runat="server" Checked="True" 
                    GroupName="accessright" Text="Share with Friends" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RadioButton ID="access2" runat="server" GroupName="accessright" 
                    Text="Private" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RadioButton ID="access3" runat="server" GroupName="accessright" 
                    Text="Public" /></td>
            </tr>
            <tr>
                <td>
                    &nbsp;Upload Photo: </td>
                <td>
                    &nbsp;<asp:FileUpload ID="filUpload" runat="server" />
                    <br />
                    &nbsp;<asp:Button ID="btnUpload" runat="server" Text="Upload" onclick="btnUpload_Click" />
                    <asp:Label ID="lblStatus" runat="server"></asp:Label>
                    </td>
            </tr>
        </table>
    <h3>
        <asp:Label ID="lblHead" runat="server" Text="Uploaded Image"></asp:Label>
    </h3>
    <br />
    <asp:Image ID="imgUpload" runat="server" Height="200px" Width="200px" BorderWidth="3"/>
    <br />
    <br />
    <br />
    <br />
    </center>
</asp:Content>
