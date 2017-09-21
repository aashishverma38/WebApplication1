<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GalleriesNew.aspx.cs" Inherits="Flickr.Photos.GalleriesNew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<center><b style="font-size: medium; font-weight: bold; font-style: normal; color: #FFFFFF; background-color: #003366">
        CREATE A NEW GALLERY AND ADD PHOTO
</b></center>
<center>
    <br /><br />
    <asp:Label ID="gallerycreatestatus" runat="server" ForeColor="#006600" Font-Size="Medium"></asp:Label><br /><br />
    
    <asp:Table ID="Table1" runat="server">
        <asp:TableRow runat="server">
            <asp:TableCell runat="server"><center><b>Enter your Gallery Name</b></center></asp:TableCell>
            <asp:TableCell runat="server"><center>
                <asp:TextBox ID="galleryname" runat="server"></asp:TextBox></center></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="TableRow1" runat="server">
            <asp:TableCell ID="TableCell1" runat="server"><center>
                <asp:Button ID="creategallery" runat="server" Text="CREATE GALLERY" onclick="creategallery_Click" /></center></asp:TableCell>            
        </asp:TableRow>
    </asp:Table>
    <asp:Label ID="photopreview" runat="server"></asp:Label><br />
    <asp:Image ID="coverphoto" Width="150" Height="150" runat="server" />


    <br />
    <hr />  
    <br />
    <center><b style="font-size: medium; font-weight: bold; font-style: normal; color: #FFFFFF; background-color: #003366">
        YOUR EXISTING GALLERIES
    </b></center>
    <br />


    <asp:Label ID="addstatus" runat="server" Font-Size="Medium" ForeColor="#339933" Font-Bold="True"></asp:Label><br />
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="someaction" 
        GroupItemCount="3">
        <EditItemTemplate>
            <td runat="server" style="">
                GalleryName:
                <asp:TextBox ID="GalleryNameTextBox" runat="server" 
                    Text='<%# Bind("GalleryName") %>' />
                <br />CoverPhoto:
                <asp:TextBox ID="CoverPhotoTextBox" runat="server" 
                    Text='<%# Bind("CoverPhoto") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                    Text="Update" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                    Text="Cancel" />
                <br />
            </td>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>
                        <center>You don't have any Galleries. Create new gallery.</center></td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
<td runat="server" />
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr ID="itemPlaceholderContainer" runat="server">
                <td ID="itemPlaceholder" runat="server">
                </td>
            </tr>
        </GroupTemplate>
        <InsertItemTemplate>
            <td runat="server" style="">
                GalleryName:
                <asp:TextBox ID="GalleryNameTextBox" runat="server" 
                    Text='<%# Bind("GalleryName") %>' />
                <br />CoverPhoto:
                <asp:TextBox ID="CoverPhotoTextBox" runat="server" 
                    Text='<%# Bind("CoverPhoto") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                    Text="Insert" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                    Text="Clear" />
                <br />
            </td>
        </InsertItemTemplate>
        <ItemTemplate>
            <td runat="server" style=""><center>
                <asp:Label ID="GalleryNameLabel" runat="server" Text='<%# Eval("GalleryName") %>' ForeColor="#003366" Font-Underline="True" Font-Size="Medium" Font-Bold="True"/>
                <br />
                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="coverphotoclick">
                    <asp:Image ID="Image1" runat="server" Width="275" Height="250" ImageUrl='<%# Eval("CoverPhoto") %>' /></asp:LinkButton>
                <br />
                <asp:LinkButton ID="LinkButton2" runat="server" CommandName="addtogallery" Text="ADD TO THIS GALLERY" BackColor="#003366" Font-Bold="True" ForeColor="White"></asp:LinkButton>
                <br />
                <asp:Label ID="CoverPhotoLabel" runat="server" Visible="false" Text='<%# Eval("CoverPhoto") %>' /></center>
            </td>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table ID="groupPlaceholderContainer" runat="server" border="0" style="">
                            <tr ID="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <td runat="server" style="">
                GalleryName:
                <asp:Label ID="GalleryNameLabel" runat="server" 
                    Text='<%# Eval("GalleryName") %>' />
                <br />CoverPhoto:
                <asp:Label ID="CoverPhotoLabel" runat="server" 
                    Text='<%# Eval("CoverPhoto") %>' />
                <br />
            </td>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FlickrConnectionString %>" 
        SelectCommand="SELECT [GalleryName], [CoverPhoto] FROM [UserGalleries] WHERE ([UserName] = @UserName)">
        <SelectParameters>
            <asp:SessionParameter Name="UserName" SessionField="currUser" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>



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
</center>
</asp:Content>
