<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReportedUsers.aspx.cs" Inherits="WebApplication1.Administrator.ReportedUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" 
        Text="Block Users"></asp:Label>
    <br />
    <br />
    <br />
    <br />
    <center>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
       
        
        <EmptyDataTemplate>
            <span>There are not reported users in the Website</span>
        </EmptyDataTemplate>
        
        <ItemTemplate>
         <hr />
            <span style="">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("ProfilePhotoPath") %>' Height="120" BorderWidth="2" Width="120" />
           
            <br />
            UserName:
                <asp:LinkButton ID="LinkButton1" runat="server"  Text='<%# Eval("FriendName") %>'></asp:LinkButton>
           
            <br />
                <asp:Button ID="Button1" runat="server" Text="Block" />
                <asp:Button ID="Button2" runat="server" Text="UnBlock" />
            <br />
            </span>
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
            <span style="">FriendName:
            <asp:Label ID="FriendNameLabel" runat="server" 
                Text='<%# Eval("FriendName") %>' />
            <br />
            ProfilePhotoPath:
            <asp:Label ID="ProfilePhotoPathLabel" runat="server" 
                Text='<%# Eval("ProfilePhotoPath") %>' />
            <br />
            <br />
            </span>
        </SelectedItemTemplate>
    </asp:ListView></center>
    <hr/>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FlickrConnectionString %>" 
        SelectCommand="SELECT DISTINCT FriendName , ProfilePhotoPath FROM ReportAbuse , Users WHERE FriendName = Users.UserName">
    </asp:SqlDataSource>
    <br />
    <br />
</asp:Content>
