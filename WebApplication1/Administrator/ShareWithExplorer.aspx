<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShareWithExplorer.aspx.cs" Inherits="WebApplication1.Administrator.ShareWithExplorer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" 
        Text="Select Flickr Photos"></asp:Label>
    
    <br/>
    <br />
    <center>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="PhotoPath"  OnItemCommand="someaction" 
        DataSourceID="SqlDataSource1" GroupItemCount="3">
        
        
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>
                        No Photos are uploaded of Public Acces</td>
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
                
                <asp:ImageButton ID="ImageButton1" runat="server" CommandName="seeImage" ImageUrl='<%# Eval("PhotoPath") %>' Width="150" Height="150" />
          
                <br />By UserName:
            
                <asp:LinkButton
                    ID="LinkButton1" Text='<%# Eval("UserName") %>' CommandName="seeUser" runat="server">LinkButton</asp:LinkButton>
                <br />
                <asp:Button ID="ShareWithExplorer" CommandName="shareExplorer"  runat="server" Text="Share" />
                 <asp:Button ID="UnShareWithExplorer" CommandName="unShareExplorer" runat="server" Text="UnShare" />
                  <br /> <br />  
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
            <asp:Parameter DefaultValue="0" Name="ShareWithExplorer" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />

</asp:Content>
