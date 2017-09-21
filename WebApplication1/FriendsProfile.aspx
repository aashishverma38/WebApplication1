<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FriendsProfile.aspx.cs" Inherits="Flickr.FriendsProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Panel ID="friendprofile" runat="server" BorderColor="#336699" Width="100%">
        <asp:Image ID="profilepic" runat="server" Width="150" Height="150" 
            BorderColor="#003366" BorderWidth="3px" />
        <asp:Button ID="abusebutton" runat="server" 
            Font-Bold="True" ForeColor="#003366" 
            style="z-index: 1; left: 830px; top: 165px; position: absolute" 
            onclick="abusebutton_Click" />
        <br />
        <asp:Label ID="friendsname" runat="server" ForeColor="#003366" 
            Font-Bold="True" Font-Size="Large" 
            style="z-index: 1; left: 381px; top: 160px; position: absolute"></asp:Label><br />        
        <asp:Label ID="friendemail" runat="server" ForeColor="#003366" Font-Bold="True" Font-Size="Large" 
            style="z-index: 1; left: 381px; top: 191px; position: absolute"></asp:Label><br />
    </asp:Panel>
    <br />
    <hr />
    <br />
    <asp:Panel ID="friendphotos" runat="server">
    <center><b style="font-size: 24px; font-weight: bold; font-style: normal; color: #FFFFFF; background-color: #003366">
        SHARED PHOTOS
    </b></center>
    <center style="color: #008000; font-size: medium; font-weight: bold">
        <asp:Label ID="favouritestatus" runat="server"></asp:Label>
    </center>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="someaction"
        DataKeyNames="PhotoPath" GroupItemCount="3">
        <EditItemTemplate>
            <td runat="server" style="">
                PhotoName:
                <asp:TextBox ID="PhotoNameTextBox" runat="server" 
                    Text='<%# Bind("PhotoName") %>' />
                <br />PhotoPath:
                <asp:Label ID="PhotoPathLabel1" runat="server" 
                    Text='<%# Eval("PhotoPath") %>' />
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
                        <center><b>Your Friend don't have any photos to share with you..!!</b></center></td>
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
                <asp:Label ID="PhotoNameLabel" runat="server" Text='<%# Eval("PhotoName") %>' Font-Bold="True" ForeColor="#003366" Font-Size="Larger" />
                <br />
                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="imageclick">
                    <asp:Image ID="Image1" runat="server" Width="275" Height="250" ImageUrl='<%# Eval("PhotoPath") %>' />
                </asp:LinkButton><br /><br />
                <asp:LinkButton ID="favourite" runat="server" Text="FAVOURITE" CommandName="favourite" BackColor="#003366" ForeColor="White" Font-Bold="True"></asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="addtogallery" runat="server" Text="ADD TO GALLERY" CommandName="addtogallery" BackColor="#003366" ForeColor="White" Font-Bold="True"></asp:LinkButton>
                <asp:Label ID="PhotoPathLabel" runat="server" Visible="false" Text='<%# Eval("PhotoPath") %>' />
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
        
        SelectCommand="SELECT PhotoName, PhotoPath FROM Photos WHERE (UserName = @username) AND ((AccessRight = 'Share with Friends') OR (AccessRight = 'Public'))">
        <SelectParameters>
            <asp:SessionParameter Name="username" SessionField="friendname" />
        </SelectParameters>
    </asp:SqlDataSource>
 </asp:Panel>
</asp:Content>
