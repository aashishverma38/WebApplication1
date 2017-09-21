<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyGalleries.aspx.cs" Inherits="Flickr.Photos.MyGalleries" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<center>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="GalleryID" OnItemCommand="someaction" 
        DataSourceID="SqlDataSource1" GroupItemCount="3">
        <EditItemTemplate>
            <td runat="server" style=""><center>
                <asp:Label ID="GalleryIDLabel1" runat="server" Visible="false" Text='<%# Eval("GalleryID") %>' />
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("GalleryName") %>'></asp:Label>
                <asp:TextBox ID="GalleryNameTextBox" runat="server" Text='<%# Bind("GalleryName") %>' />
                <asp:TextBox ID="UserNameTextBox" runat="server" Visible="false" Text='<%# Bind("UserName") %>' />
                <br />
                <asp:TextBox ID="CoverPhotoTextBox" runat="server" Visible="false" Text='<%# Bind("CoverPhoto") %>' />
                <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" Text="CAHNGE NAME" BackColor="#003366" Font-Bold="True" ForeColor="White"></asp:LinkButton>
                <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" Text="CANCEL" BackColor="#003366" Font-Bold="True" ForeColor="White"></asp:LinkButton>
                <br /></center>
            </td>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>
                        <center><b style="font-size: medium; color: #FF0000; font-weight: bold">You don't have any Galleries..</b></center></td>
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
                <br />UserName:
                <asp:TextBox ID="UserNameTextBox" runat="server" 
                    Text='<%# Bind("UserName") %>' />
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
                <asp:Label ID="GalleryIDLabel" runat="server" Visible="false" Text='<%# Eval("GalleryID") %>' />
                <asp:Label ID="GalleryNameLabel" runat="server" Text='<%# Eval("GalleryName") %>' Font-Bold="True" Font-Size="Medium" ForeColor="#000099" Font-Underline="True" />
                <br />
                <asp:Label ID="UserNameLabel" runat="server" Visible="false" Text='<%# Eval("UserName") %>' />
                <asp:ImageButton ID="ImageButton1" runat="server" CommandName="coverphotoclick" Width="275" Height="250" ImageUrl='<%# Eval("CoverPhoto") %>' />
                <asp:Label ID="CoverPhotoLabel" runat="server" Visible="false" Text='<%# Eval("CoverPhoto") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" Text="CHANGE GALLERY NAME" BackColor="#003366" Font-Bold="True" ForeColor="White"></asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="deletegallery" Text="DELETE GALLERY" BackColor="#003366" Font-Bold="True" ForeColor="White"></asp:LinkButton>
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
                GalleryID:
                <asp:Label ID="GalleryIDLabel" runat="server" Text='<%# Eval("GalleryID") %>' />
                <br />GalleryName:
                <asp:Label ID="GalleryNameLabel" runat="server" 
                    Text='<%# Eval("GalleryName") %>' />
                <br />UserName:
                <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                <br />CoverPhoto:
                <asp:Label ID="CoverPhotoLabel" runat="server" 
                    Text='<%# Eval("CoverPhoto") %>' />
                <br />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                <br />
            </td>
        </SelectedItemTemplate>
    </asp:ListView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:FlickrConnectionString %>" 
        DeleteCommand="DELETE FROM [UserGalleries] WHERE [GalleryID] = @original_GalleryID AND [GalleryName] = @original_GalleryName AND [UserName] = @original_UserName AND [CoverPhoto] = @original_CoverPhoto" 
        InsertCommand="INSERT INTO [UserGalleries] ([GalleryName], [UserName], [CoverPhoto]) VALUES (@GalleryName, @UserName, @CoverPhoto)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT [GalleryID], [GalleryName], [UserName], [CoverPhoto] FROM [UserGalleries] WHERE ([UserName] = @UserName)" 
        UpdateCommand="UPDATE UserGalleries SET GalleryName = @GalleryName WHERE (GalleryID = @original_GalleryID) AND (UserName = @UserName) AND (@GalleryName NOT IN (SELECT GalleryName FROM UserGalleries AS g2))">
        <DeleteParameters>
            <asp:Parameter Name="original_GalleryID" Type="Int64" />
            <asp:Parameter Name="original_GalleryName" Type="String" />
            <asp:Parameter Name="original_UserName" Type="String" />
            <asp:Parameter Name="original_CoverPhoto" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="GalleryName" Type="String" />
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="CoverPhoto" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="UserName" SessionField="currUser" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="GalleryName" Type="String" />
            <asp:SessionParameter Name="UserName" SessionField="currUser" Type="String" />
            <asp:Parameter Name="CoverPhoto" Type="String" />
            <asp:Parameter Name="original_GalleryID" Type="Int64" />
            <asp:Parameter Name="original_GalleryName" Type="String" />
            <asp:Parameter Name="original_UserName" Type="String" />
            <asp:Parameter Name="original_CoverPhoto" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

</center>
</asp:Content>
