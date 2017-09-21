<%@ Page Title="Flickr Mail" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Mail.aspx.cs" Inherits="Flickr.Mail" %>
<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <asp:Label ID="CMailLabel" runat="server" Font-Bold="True" Font-Size="Large" 
         Text="Flickr Mail"></asp:Label>
     <br />
     <br />
     <br />
        <br />
        <asp:Panel ID="Panel1" runat="server" Height="21px" Width="818px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:HyperLink ID="ComposeMailLink" 
                runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Black" 
                NavigateUrl="~/Mail/ComposeMail.aspx">Compose Mail</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="NotificationLink" runat="server" Font-Bold="True" 
                Font-Size="Medium" ForeColor="Black" NavigateUrl="~/Mail/Mail.aspx">Notifications</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:HyperLink ID="InboxLink" runat="server" Font-Bold="True" 
                Font-Size="Medium" ForeColor="Black" NavigateUrl="~/Mail/InBox.aspx">InBox</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="SentBoxLink" runat="server" Font-Bold="True" 
                Font-Size="Medium" ForeColor="Black" NavigateUrl="~/Mail/SentBox.aspx">SentBox</asp:HyperLink>
     </asp:Panel>
        <br />
     <br />
     <br />
     <br />
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <br />
     <br />
     <asp:Label ID="CMLabel" runat="server" Font-Bold="True" Font-Size="Medium" 
         Text="Notifications"></asp:Label>
     <br />

        <br />
        &nbsp; 
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="UserName" 
        DataSourceID="SqlDataSource1" OnItemCommand="AcceptFriend">
            <EmptyDataTemplate>
                <span>No data was returned.</span>
            </EmptyDataTemplate>
            <ItemTemplate>
                <span>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ProfilePhotoPath") %>'
                    Height="80" Width="80" BorderWidth="2"/>
                    <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                    <asp:Button ID="btnAcceptFriend" runat="server" Text="Accept Friend Request" CommandName="AcceptFriendRequest" />
                    <br />
                <br /></span>
            </ItemTemplate>
            <LayoutTemplate>
                <div ID="itemPlaceholderContainer" runat="server" 
                    style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                    <asp:DataPager ID="DataPager1" runat="server" PageSize="2">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                ShowLastPageButton="True" />
                        </Fields>
                    </asp:DataPager>
                </div>
            </LayoutTemplate>
        </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FlickrConnectionString %>" SelectCommand="SELECT * FROM Users WHERE UserName IN
(SELECT UserName FROM Friends WHERE FriendName = @currUser AND Status = 0)">
        <SelectParameters>
            <asp:SessionParameter Name="currUser" SessionField="currUser" />
        </SelectParameters>
    </asp:SqlDataSource>
    
</asp:Content>
