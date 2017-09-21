<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FlickrPhotos.aspx.cs" Inherits="WebApplication1.FlickrPhotos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="False" 
        Font-Size="Large" Text="Flickr Photos"></asp:Label>
    <br />
    <br />
    <br />
    <br />
    <center>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="someaction"
            DataKeyNames="PhotoPath" GroupItemCount="3">
        
      
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>
                       Flickr Photos are not in the website</td>
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
       
        <ItemTemplate>
            <td runat="server" style="">
                <asp:Image ID="Image1" runat="server"  />
                <asp:ImageButton ID="ImageButton1" runat="server" CommandName="seeImage" ImageUrl='<%# Eval("PhotoPath") %>' Height="150" Width="150"/>
                <br />By UserName:
                <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("UserName") %>'></asp:LinkButton>
              
                <br />
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
                <br />UserName:
                <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                <br />
            </td>
        </SelectedItemTemplate>
    </asp:ListView>
  </center>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FlickrConnectionString %>" 
        SelectCommand="SELECT [PhotoPath], [UserName] FROM [Photos] WHERE (([AccessRight] = @AccessRight) AND ([ShareWithExplorer] = @ShareWithExplorer))">
        <SelectParameters>
            <asp:Parameter DefaultValue="Public" Name="AccessRight" Type="String" />
            <asp:Parameter DefaultValue="1" Name="ShareWithExplorer" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <br />
</asp:Content>
