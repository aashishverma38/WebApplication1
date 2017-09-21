<%@ Page Title="Search Friends" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchFriends.aspx.cs" Inherits="Flickr.Contacts.SearchFriends" %>
<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Search Friends: 
    </h2>
    <p>
        Search using Username or Email ID:
        <br />
        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="SearchTextRequired" runat="server" ControlToValidate="txtSearch" 
                        CssClass="failureNotification" ErrorMessage="Search Text is required." 
                        >*</asp:RequiredFieldValidator>
        <asp:Button ID="btnSearch" runat="server" Text="Search" 
             /> 
        <br />
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="UserName" OnItemCommand="AddFriend"
        DataSourceID="SqlDataSource1">
            <EmptyDataTemplate>
                <span>No data was returned.</span>
            </EmptyDataTemplate>
            <ItemTemplate>
                <span>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ProfilePhotoPath") %>'
                    Height="80" Width="80" BorderWidth="2"/>
                    <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                    <asp:Button ID="btnAddFriend" runat="server" Text="Send Friend Request" CommandName="SendFriendRequest" />
                <br />
                <br /></span>
            </ItemTemplate>
            <LayoutTemplate>
                <div ID="itemPlaceholderContainer" runat="server" 
                    style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div>
                    <asp:DataPager ID="DataPager1" runat="server" PageSize="2">
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
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:FlickrConnectionString %>" 
            
        SelectCommand="SELECT * FROM Users WHERE ( UserName LIKE '%'+@SearchText+'%' OR EmailID = @SearchText ) AND UserName NOT LIKE @currUser AND UserName NOT IN ( SELECT FriendName FROM Friends WHERE UserName = @currUser UNION SELECT UserName FROM Friends WHERE FriendName = @currUser ) ">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtSearch" Name="SearchText" 
                    PropertyName="Text" />
                <asp:SessionParameter Name="currUser" SessionField="currUser" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
