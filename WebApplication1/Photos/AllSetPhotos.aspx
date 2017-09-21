<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AllSetPhotos.aspx.cs" Inherits="Flickr.Photos.AllSetPhotos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <%= Session["setname"].ToString()%> &nbsp;Set Photos

<center>
    <asp:Label ID="coverphotocheck" runat="server" ForeColor="Red" Font-Bold="True" Font-Size="Medium"></asp:Label>
    <asp:Panel ID="Panel1" runat="server" Width="100%">
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="someaction1" 
            GroupItemCount="3">
            <EditItemTemplate>
                <td runat="server" style="">
                    PhotoPath:
                    <asp:TextBox ID="PhotoPathTextBox" runat="server" Text='<%# Bind("PhotoPath") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
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
                    PhotoPath:
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
                    <asp:Label ID="PhotoPathLabel" Visible="false" runat="server" Text='<%# Eval("PhotoPath") %>' />
                    <br />
                    <asp:Image ID="Image1" runat="server" Width="150" Height="150" ImageUrl='<%# Eval("PhotoPath") %>' />
                    <br />
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="deletefromset" Text="DELETE FROM SET" BackColor="#003366" Font-Bold="True" ForeColor="White"></asp:LinkButton>
                    <br />
                    <asp:Label ID="Image3" runat="server" Visible="false" Text='<%# Eval("PhotoPath") %>' /></center>
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
                    PhotoPath:
                    <asp:Label ID="PhotoPathLabel" runat="server" Text='<%# Eval("PhotoPath") %>' />
                    <br />
                </td>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:FlickrConnectionString %>" 
            
            SelectCommand="SELECT SetPhotos.PhotoPath FROM SetPhotos WHERE SetID=@setId">
            <SelectParameters>
                <asp:SessionParameter Name="setId" SessionField="setID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
    <br />
    <hr />
    <br />
    <h2 style="color: #FFFFFF; font-weight: bold; text-decoration: underline; font-size: 25px; background-color: #003366;">  ::ADD TO SET::  </h2>
    <asp:Panel ID="Panel2" runat="server" Width="100%">
        <asp:ListView ID="ListView2" runat="server" DataKeyNames="PhotoPath" OnItemCommand="someaction2" 
            DataSourceID="SqlDataSource2" GroupItemCount="3">
            <EditItemTemplate>
                <td runat="server" style="">
                    PhotoPath:
                    <asp:Label ID="PhotoPathLabel1" runat="server" 
                        Text='<%# Eval("PhotoPath") %>' />
                    <br />
                    PhotoName:
                    <asp:TextBox ID="PhotoNameTextBox" runat="server" 
                        Text='<%# Bind("PhotoName") %>' />
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
                        <td><center>
                            All Photos are added to your set..</center></td>
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
                    PhotoPath:
                    <asp:TextBox ID="PhotoPathTextBox" runat="server" 
                        Text='<%# Bind("PhotoPath") %>' />
                    <br />
                    PhotoName:
                    <asp:TextBox ID="PhotoNameTextBox" runat="server" Text='<%# Bind("PhotoName") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    <br />
                </td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style=""><center>
                    <asp:Label ID="PhotoNameLabel" runat="server" Text='<%# Eval("PhotoName") %>' Font-Bold="True" Font-Size="Medium" Font-Underline="True" ForeColor="#336699" />
                    <br />
                    <asp:Image ID="Image2" runat="server" Width="150" Height="150" ImageUrl='<%# Eval("PhotoPath") %>' /><br />
                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="addtoset" Text="ADD TO SET" BackColor="#003366" Font-Bold="True" ForeColor="White"></asp:LinkButton>
                    <asp:Label ID="PhotoPathLabel" runat="server" Visible="false" Text='<%# Eval("PhotoPath") %>'  />
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
                    PhotoPath:
                    <asp:Label ID="PhotoPathLabel" runat="server" Text='<%# Eval("PhotoPath") %>' />
                    <br />
                    PhotoName:
                    <asp:Label ID="PhotoNameLabel" runat="server" Text='<%# Eval("PhotoName") %>' />
                    <br />
                </td>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:FlickrConnectionString %>" 
            SelectCommand="SELECT [Photos].[PhotoPath], [PhotoName] FROM [Photos] WHERE ([UserName] = @UserName) AND 
[Photos].[PhotoPath] NOT IN (SELECT PhotoPath FROM [SetPhotos] WHERE SetID=@setID)">
            <SelectParameters>
                <asp:SessionParameter Name="UserName" SessionField="currUser" Type="String" />
                <asp:SessionParameter Name="setID" SessionField="setId" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
</center>
</asp:Content>
