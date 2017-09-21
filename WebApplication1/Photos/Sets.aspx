<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sets.aspx.cs" Inherits="Flickr.Photos.Sets" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2>
    Your Sets
</h2>
<center>
<br />    
    <asp:Label ID="setcreatestatus" runat="server" ForeColor="#003399" Font-Size="Medium"></asp:Label><br />
    <asp:Label ID="numberofsets" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium"></asp:Label>
    <asp:Table ID="setstable" Visible="false" runat="server" BorderWidth="2" >
    </asp:Table>&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" Visible="false" Text="CREATE A NEW SET" onclick="Button1_Click" /><br />
    <asp:LinkButton ID="LinkButton2" runat="server" Text="CREATE A NEW SET" PostBackUrl="CreateNewSet.aspx" ForeColor="#003399" Font-Size="Larger" Font-Bold="True"></asp:LinkButton><br />
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="someaction"
        GroupItemCount="3" DataKeyNames="SetID">
        <EditItemTemplate>
            <td runat="server" style="">
            <center>
                <asp:Image ID="Image1" runat="server" Width="80" Height="80" ImageUrl='<%# Eval("CoverPhoto") %>' />
                <br />
                <asp:TextBox ID="SetNameTextBox" runat="server" Text='<%# Bind("SetName") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" Text="CHANGE NAME" BackColor="#003366" ForeColor="White" Font-Bold="True"></asp:LinkButton>
                &nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" Text="CANCEL" BackColor="#003366" ForeColor="White" Font-Bold="True"></asp:LinkButton>
                <br />
                <asp:Label ID="Label2" runat="server" visible="false" Text='<%# Bind("SetID") %>' />
                <asp:TextBox ID="CoverPhotoTextBox" runat="server" visible="false" Text='<%# Bind("CoverPhoto") %>' />
             </center>
            </td>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>
                        <br /><br />
                        <b>YOU HAVE NO SETS</b>
                    </td>
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
                SetName:
                <asp:TextBox ID="SetNameTextBox" runat="server" Text='<%# Bind("SetName") %>' />
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
                <br />
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("SetName") %>' Font-Bold="True" Font-Size="Medium" ForeColor="#000099" Font-Underline="True" />
                <br />
                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="coverphotoclick">
                    <asp:Image ID="Image1" runat="server" Width="275" Height="250" ImageUrl='<%# Eval("CoverPhoto") %>' />
                    </asp:LinkButton>
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" Text="CHANGE SET NAME" BackColor="#003366" Font-Bold="True" ForeColor="White"></asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="LinkButton3" runat="server" CommandName="deleteset" Text="DELETE SET" BackColor="#003366" ForeColor="White" Font-Bold="True"></asp:LinkButton></center>
                <asp:Label ID="CoverPhotoLabel" runat="server" visible="false" Text='<%# Eval("CoverPhoto") %>' />
                     <asp:Label ID="Label2" runat="server" visible="false" Text='<%# Eval("SetID") %>' />
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
                SetName:
                <asp:Label ID="SetNameLabel" runat="server" Text='<%# Eval("SetName") %>' />
                <br />CoverPhoto:
                <asp:Label ID="CoverPhotoLabel" runat="server" 
                    Text='<%# Eval("CoverPhoto") %>' />
                <br />
                SetID:
                <asp:Label ID="SetIDLabel" runat="server" Text='<%# Eval("SetID") %>' />
                <br />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                <br />
            </td>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FlickrConnectionString %>" 
        
        SelectCommand="SELECT [SetName], [CoverPhoto], [SetID] FROM [UserSets] WHERE ([UserName] = @UserName)" 
        ConflictDetection="CompareAllValues" 
        DeleteCommand="DELETE FROM [UserSets] WHERE [SetID] = @original_SetID AND [SetName] = @original_SetName AND [CoverPhoto] = @original_CoverPhoto" 
        InsertCommand="INSERT INTO [UserSets] ([SetName], [CoverPhoto]) VALUES (@SetName, @CoverPhoto)" 
        OldValuesParameterFormatString="original_{0}" 
        UpdateCommand="UPDATE UserSets SET SetName = @setname WHERE (SetID = @setid) AND (UserName = @username) AND (@setname NOT IN (SELECT SetName FROM UserSets AS u2))">
        <DeleteParameters>
            <asp:Parameter Name="original_SetID" Type="Int64" />
            <asp:Parameter Name="original_SetName" Type="String" />
            <asp:Parameter Name="original_CoverPhoto" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SetName" Type="String" />
            <asp:Parameter Name="CoverPhoto" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="UserName" SessionField="currUser" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="SetName" Type="String" />
            <asp:Parameter Name="CoverPhoto" Type="String" />
            <asp:Parameter Name="original_SetID" Type="Int64" />
            <asp:Parameter Name="original_SetName" Type="String" />
            <asp:Parameter Name="original_CoverPhoto" Type="String" />
            <asp:SessionParameter Name="UserName" SessionField="currUser" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />    
    <br />
    <hr />
    <br />
    <br />    
    <asp:Table ID="createsettable" runat="server">
        <asp:TableRow ID="TableRow1" runat="server">
            <asp:TableCell ID="TableCell1" runat="server"><b>Enter your set name</b></asp:TableCell>
            <asp:TableCell ID="TableCell2" runat="server">
                <asp:TextBox ID="setname" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator
                    ID="RequiredFieldValidator1" runat="server" ErrorMessage="Set name is Required" ControlToValidate="setname" Text="*"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="TableRow2" runat="server">
            <asp:TableCell ID="TableCell3" runat="server"><b>Select cover Photo for Set</b></asp:TableCell>
            <asp:TableCell ID="TableCell4" runat="server">
                <asp:DropDownList ID="photonamesDropDown" AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" runat="server">
                    <asp:ListItem Selected="True">Select a Photo name</asp:ListItem>
                </asp:DropDownList>&nbsp;&nbsp;&nbsp;
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Cover Photo is Required" ControlToValidate="photonamesDropDown" ValueToCompare="Select a Photo name" Operator="NotEqual" Text="*"></asp:CompareValidator>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <asp:Button ID="saveset" runat="server" Text="SAVE" onclick="saveset_Click" />&nbsp;&nbsp;&nbsp;
    <br />
    <asp:Label ID="photopreview" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium"></asp:Label><br />
    <asp:Image ID="coverphoto" Width="100" Height="100" runat="server" /> <br />  
    
    </center>
</asp:Content>
