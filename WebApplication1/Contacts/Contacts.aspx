<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contacts.aspx.cs" Inherits="WebApplication1.Contacts.Contacts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


        <asp:Label ID="Label1" runat="server" Text="Your Contact List" Font-Size="Large" Font-Bold="True"></asp:Label>
    <asp:ListView ID="ListView1" runat="server" OnItemCommand="someaction" DataSourceID="SqlDataSource1">
       
      
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
      
        <ItemTemplate>
            <center>
            <asp:LinkButton ID="profilepicture" runat="server" CommandName="imageclick">            
            <asp:Image ID="Image1" runat="server" Width="150" Height="150" ImageUrl='<%# Eval("ProfilePhotoPath") %>' /></asp:LinkButton>            
            <br />
            <asp:Label ID="FriendNameLabel" runat="server" Text='<%# Eval("FriendName") %>' Font-Bold="True" ForeColor="#006600" Font-Size="Large" />
            <br />
            <asp:LinkButton ID="Delete" runat="server" CommandName="Delete" Text="UNFRIEND" ForeColor="White" BackColor="#003366" Font-Bold="True"></asp:LinkButton>
            <asp:Label ID="lab" runat="server" Visible="false" Text='<%# Eval("ProfilePhotoPath") %>'></asp:Label>
            </center><br />
        </ItemTemplate>
        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="">
                <asp:DataPager ID="DataPager1" runat="server">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <span style="">ProfilePhotoPath:
            <asp:Label ID="ProfilePhotoPathLabel" runat="server" 
                Text='<%# Eval("ProfilePhotoPath") %>' />
            <br />
            FriendName:
            <asp:Label ID="FriendNameLabel" runat="server" 
                Text='<%# Eval("FriendName") %>' />
            <br />
<br /></span>
        </SelectedItemTemplate>
    </asp:ListView>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:FlickrConnectionString %>" 
            DeleteCommand="DELETE FROM Friends WHERE ((UserName = @currUser) AND (FriendName = @friendName)) OR ((UserName = @friendName) AND (FriendName = @currUser))" 
            SelectCommand="SELECT U.ProfilePhotoPath, F.FriendName FROM Friends AS F INNER JOIN Users AS U ON F.FriendName = U.UserName WHERE (F.UserName = @currUser) AND (F.Status = 1) UNION SELECT U.ProfilePhotoPath, F.UserName FROM Friends AS F INNER JOIN Users AS U ON F.UserName = U.UserName WHERE (F.FriendName = @currUser) AND (F.Status = 1)">
            <DeleteParameters>
                <asp:Parameter Name="currUser" />
                <asp:Parameter Name="friendName" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter Name="currUser" SessionField="currUser" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    </p>
    <p>
        &nbsp;</p>
</asp:Content>
