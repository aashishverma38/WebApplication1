<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateNewSet.aspx.cs" Inherits="Flickr.Photos.CreateNewSet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2>
    Create Set
</h2>
<center>
    <asp:Label ID="setcreatestatus" runat="server" ForeColor="#003399" Font-Size="Medium"></asp:Label><br />

    <asp:Table ID="createsettable" runat="server">
        <asp:TableRow ID="TableRow1" runat="server">
            <asp:TableCell ID="TableCell1" runat="server"><b>Enter your set name</b></asp:TableCell>
            <asp:TableCell ID="TableCell2" runat="server">
                <asp:TextBox ID="setname" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator
                    ID="RequiredFieldValidator1" runat="server" ErrorMessage="Set name is Required" ControlToValidate="setname" Text="*"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="TableRow2" runat="server">
            <asp:TableCell ID="TableCell3" runat="server"><b>Select cover Photo for Set</b></asp:TableCell>
            <asp:TableCell ID="TableCell4" runat="server">
                <asp:DropDownList ID="photonamesDropDown" AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" runat="server">
                    <asp:ListItem Selected="True">Select a Photo name</asp:ListItem>
                </asp:DropDownList>&nbsp;&nbsp;&nbsp;
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Cover Photo is Required" ControlToValidate="photonamesDropDown" ValueToCompare="Select a Photo name" Operator="NotEqual" Text="*"></asp:CompareValidator>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <asp:Button ID="saveset" runat="server" Text="SAVE" onclick="saveset_Click" />&nbsp;&nbsp;&nbsp;
    <br />
    <asp:Label ID="photopreview" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium"></asp:Label><br />
    <asp:Image ID="coverphoto" Width="150" Height="150" runat="server" /> <br />
    

</center>
</asp:Content>
