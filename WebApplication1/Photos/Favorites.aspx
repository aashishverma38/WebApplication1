<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Favorites.aspx.cs" Inherits="Flickr.Photos.Favorites" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2>
    Your Favorite Photos
</h2>
<center>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="someaction" 
        GroupItemCount="3">
        <EditItemTemplate>
            <td runat="server" style="">
                Username:
                <asp:TextBox ID="UsernameTextBox" runat="server" 
                    Text='<%# Bind("Username") %>' />
                <br />PhotoName:
                <asp:TextBox ID="PhotoNameTextBox" runat="server" 
                    Text='<%# Bind("PhotoName") %>' />
                <br />FavouritePhotoPath:
                <asp:TextBox ID="FavouritePhotoPathTextBox" runat="server" 
                    Text='<%# Bind("FavouritePhotoPath") %>' />
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
                        You have no favorite photos..</td>
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
                Username:
                <asp:TextBox ID="UsernameTextBox" runat="server" 
                    Text='<%# Bind("Username") %>' />
                <br />PhotoName:
                <asp:TextBox ID="PhotoNameTextBox" runat="server" 
                    Text='<%# Bind("PhotoName") %>' />
                <br />FavouritePhotoPath:
                <asp:TextBox ID="FavouritePhotoPathTextBox" runat="server" 
                    Text='<%# Bind("FavouritePhotoPath") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                    Text="Insert" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                <br />
            </td>
        </InsertItemTemplate>
        <ItemTemplate>
            <td runat="server" style=""><center>
                <asp:Label ID="UsernameLabel" runat="server" Visible="false" Text='<%# Eval("Username") %>' />
                <br />
                <asp:Label ID="PhotoNameLabel" runat="server" Text='<%# Eval("PhotoName") %>' Font-Bold="True" Font-Size="Medium" ForeColor="#000099" Font-Underline="True" />
                <br />
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("FavouritePhotoPath") %>' Width="275" Height="250" />
                <br />
                <asp:LinkButton ID="LinkButton1" runat="server" Text="DELETE PHOTO" CommandName="deletephoto" BackColor="#003366" ForeColor="White" Font-Bold="True"></asp:LinkButton>
                <asp:Label ID="FavouritePhotoPathLabel" runat="server" Visible="false" Text='<%# Eval("FavouritePhotoPath") %>' />
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
                Username:
                <asp:Label ID="UsernameLabel" runat="server" Text='<%# Eval("Username") %>' />
                <br />PhotoName:
                <asp:Label ID="PhotoNameLabel" runat="server" Text='<%# Eval("PhotoName") %>' />
                <br />FavouritePhotoPath:
                <asp:Label ID="FavouritePhotoPathLabel" runat="server" Text='<%# Eval("FavouritePhotoPath") %>' />
                <br />
            </td>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FlickrConnectionString %>" 
        SelectCommand="SELECT [Username], [PhotoName], [FavouritePhotoPath] FROM [Favourites] WHERE ([Username] = @Username)">
        <SelectParameters>
            <asp:SessionParameter Name="Username" SessionField="currUser" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</center>
</asp:Content>
