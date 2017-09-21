<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AllGalleryPhotos.aspx.cs" Inherits="Flickr.Photos.AllGalleryPhotos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<center>
    <h2>
        <%= Session["galleryname"].ToString()%> &nbsp;Gallery Photos
    </h2>
    <br />
    <br />
    <center style="font-weight: bold; font-size: medium; color: #FF0000"><asp:Label ID="deletestatus" runat="server"></asp:Label></center>
    <br />
    <br />
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="someaction" 
        GroupItemCount="3">
        <EditItemTemplate>
            <td runat="server" style="">
                PhotoName:
                <asp:TextBox ID="PhotoNameTextBox" runat="server" 
                    Text='<%# Bind("PhotoName") %>' />
                <br />PhotoPath:
                <asp:TextBox ID="PhotoPathTextBox" runat="server" 
                    Text='<%# Bind("PhotoPath") %>' />
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
                        No data was returned.</td>
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
                PhotoName:
                <asp:TextBox ID="PhotoNameTextBox" runat="server" 
                    Text='<%# Bind("PhotoName") %>' />
                <br />PhotoPath:
                <asp:TextBox ID="PhotoPathTextBox" runat="server" 
                    Text='<%# Bind("PhotoPath") %>' />
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
                <asp:Label ID="PhotoNameLabel" runat="server" Text='<%# Eval("PhotoName") %>' ForeColor="#003366" Font-Underline="True" Font-Size="Medium" Font-Bold="True" />
                <br />
                <asp:Image ID="Image1" runat="server" Width="275" Height="250" ImageUrl='<%# Eval("PhotoPath") %>' /><br />
                <asp:LinkButton ID="LinkButton1" runat="server" Text="DELETE FROM GALLERY" CommandName="deletephoto" BackColor="#003366" ForeColor="White" Font-Bold="True"></asp:LinkButton>
                <asp:Label ID="PhotoPathLabel" runat="server" Text='<%# Eval("PhotoPath") %>' Visible="false" />
                <br /></center>
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
                PhotoName:
                <asp:Label ID="PhotoNameLabel" runat="server" Text='<%# Eval("PhotoName") %>' />
                <br />PhotoPath:
                <asp:Label ID="PhotoPathLabel" runat="server" Text='<%# Eval("PhotoPath") %>' />
                <br />
            </td>
        </SelectedItemTemplate>
    </asp:ListView>




    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FlickrConnectionString %>" 
        SelectCommand="SELECT PhotoName,PhotoPath FROM GalleryPhotos WHERE GalleryID=(SELECT GalleryID FROM UserGalleries WHERE (UserName = @username AND GalleryName = @galleryname))">
        <SelectParameters>
            <asp:SessionParameter Name="username" SessionField="currUser" />
            <asp:SessionParameter Name="galleryname" SessionField="galleryname" />
        </SelectParameters>
    </asp:SqlDataSource>




</center>
</asp:Content>
