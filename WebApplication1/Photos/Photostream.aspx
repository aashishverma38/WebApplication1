<%@ Page Title="My Photostream" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Photostream.aspx.cs" Inherits="Flickr.Photos.Photostream" %>
<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        My Photostream
    </h2>
        <br />
        <center>
    <asp:Panel ID="Panel1" runat="server" Width="100%">
       
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="PhotoPath" OnItemCommand="someAction"
        DataSourceID="SqlDataSource1" GroupItemCount="3" style="margin-right: 92px">
        <EditItemTemplate>
            <td id="Td1" runat="server" style="background-color: #FFCC66;color: #000080; border-width:0px"><center>
                <asp:Image ID="Image2" runat="server" Width="150" Height="150" ImageUrl='<%# Eval("PhotoPath") %>' />
                <br />AccessRight:
                <asp:TextBox ID="AccessRightTextBox" Enabled="false" runat="server" Text='<%# Bind("AccessRight") %>' />
                <br />
                Select:
                <asp:DropDownList ID="DropDownList1" runat="server" Text='<%# Bind("AccessRight") %>' >
                    <asp:ListItem>Share with Friends</asp:ListItem>
                    <asp:ListItem>Private</asp:ListItem>
                    <asp:ListItem>Public</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" Text="CHANGE" BackColor="#003366" ForeColor="White" Font-Bold="True"></asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" Text="CANCEL" BackColor="#003366" ForeColor="White" Font-Bold="True"></asp:LinkButton>
                <br /></center>
            </td>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table id="Table1" runat="server" 
                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:0px;">
                <tr>
                    <td>
                    <b>YOU HAVE NO UPLOADED PHOTOS</b>    
                    <asp:LinkButton ID="LinkButton2" runat="server" Text="UPLOAD YOUR PHOTOS" PostBackUrl="~/Upload.aspx" ForeColor="#003399" Font-Size="Larger" Font-Bold="True"></asp:LinkButton><br />
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
<td id="Td2" runat="server" style="border-width:0px;" />
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr ID="itemPlaceholderContainer" runat="server">
                <td ID="itemPlaceholder" style="border-width:0px;" runat="server">
                </td>
            </tr>
        </GroupTemplate>
        <InsertItemTemplate>
            <td id="Td3" runat="server" style=" border-width:0px">
                PhotoName:
                <asp:TextBox ID="PhotoNameTextBox" runat="server" 
                    Text='<%# Bind("PhotoName") %>' />
                <br />PhotoPath:
                <asp:TextBox ID="PhotoPathTextBox" runat="server" 
                    Text='<%# Bind("PhotoPath") %>' />
                <br />Description:
                <asp:TextBox ID="DescriptionTextBox" runat="server" 
                    Text='<%# Bind("Description") %>' />
                <br />UploadDate:
                <asp:TextBox ID="UploadDateTextBox" runat="server" 
                    Text='<%# Bind("UploadDate") %>' />
                <br />AccessRight:
                <asp:TextBox ID="AccessRightTextBox" runat="server" 
                    Text='<%# Bind("AccessRight") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                <br />
            </td>
        </InsertItemTemplate>
        <ItemTemplate>
            <td id="Td4" runat="server" style="background-color: #FFFBD6;color: #333333; border-width:0px" width="100px"><center>
                <asp:Label ID="PhotoNameLabel" runat="server" Text='<%# Eval("PhotoName") %>' ForeColor="#003366" Font-Underline="True" Font-Size="Medium" Font-Bold="True" />
                <br />
                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="imageclick" >
                <asp:Image ID="Image1" runat="server" Width="275" Height="250" ImageUrl='<%# Eval("PhotoPath") %>' /></asp:LinkButton>               
                <br />
                <asp:Label ID="AccessRightLabel" runat="server" Text='<%# Eval("AccessRight") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" Text="EDIT ACCESSIBILITY" BackColor="#003366" ForeColor="White" Font-Bold="True"></asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="Button2" runat="server" Text="DELETE" CommandName="DeletePhoto" BackColor="#003366" ForeColor="White" Font-Bold="True"></asp:LinkButton>
                <br />
                <asp:Label ID="DescriptionLabel" Visible="false" runat="server" Text='<%# Eval("Description") %>' />
                <asp:Label ID="PhotoPathLabel" Visible="false" runat="server" Text='<%# Eval("PhotoPath") %>' />
                <asp:Label ID="UploadDateLabel" runat="server" Text='<%# Eval("UploadDate") %>' Font-Size="Small" Font-Italic="True" />
                <br /></center>
            </td>
        </ItemTemplate>
        <LayoutTemplate>
            <table id="Table2" runat="server">
                <tr id="Tr1" runat="server">
                    <td id="Td5" runat="server">
                        <table ID="groupPlaceholderContainer" runat="server" border="1" 
                            style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:0px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr ID="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="Tr2" runat="server">
                    <td id="Td6" runat="server" 
                        style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
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
            <td id="Td7" runat="server" 
                style="background-color: #FFCC66;font-weight: bold;color: #000080; border-width:0px">
                PhotoName:
                <asp:Label ID="PhotoNameLabel" runat="server" Text='<%# Eval("PhotoName") %>' />
                <br />PhotoPath:
                <asp:Label ID="PhotoPathLabel" runat="server" Text='<%# Eval("PhotoPath") %>' />
                <br />Description:
                <asp:Label ID="DescriptionLabel" runat="server" 
                    Text='<%# Eval("Description") %>' />
                <br />UploadDate:
                <asp:Label ID="UploadDateLabel" runat="server" 
                    Text='<%# Eval("UploadDate") %>' />
                <br />AccessRight:
                <asp:Label ID="AccessRightLabel" runat="server" 
                    Text='<%# Eval("AccessRight") %>' />
                <br />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                <br />
            </td>
        </SelectedItemTemplate>
    </asp:ListView>
    </asp:Panel>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:FlickrConnectionString %>" 
        DeleteCommand="DELETE FROM [Photos] WHERE [PhotoPath] = @original_PhotoPath AND [PhotoName] = @original_PhotoName AND [Description] = @original_Description AND [UploadDate] = @original_UploadDate AND [AccessRight] = @original_AccessRight" 
        InsertCommand="INSERT INTO [Photos] ([PhotoName], [PhotoPath], [Description], [UploadDate], [AccessRight]) VALUES (@PhotoName, @PhotoPath, @Description, @UploadDate, @AccessRight)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT [PhotoName], [PhotoPath], [Description], [UploadDate], [AccessRight] FROM [Photos] WHERE ([UserName] = @UserName)" 
        UpdateCommand="UPDATE [Photos] SET [AccessRight] = @AccessRight WHERE [PhotoPath] = @original_PhotoPath">
        <DeleteParameters>
            <asp:Parameter Name="original_PhotoPath" Type="String" />
            <asp:Parameter Name="original_PhotoName" Type="String" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_UploadDate" Type="DateTime" />
            <asp:Parameter Name="original_AccessRight" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="PhotoName" Type="String" />
            <asp:Parameter Name="PhotoPath" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="UploadDate" Type="DateTime" />
            <asp:Parameter Name="AccessRight" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="UserName" SessionField="currUser" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="original_AccessRight" Type="String" />
            <asp:Parameter Name="original_PhotoPath" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    </center>
    </asp:Content>
