<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SentBox.aspx.cs" Inherits="WebApplication1.Mail.SentBox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 86%;
            margin-left: 80px;
            margin-top: 0px;
        }
        .style2
        {
            width: 93%;
        }
        .style3
        {
            width: 832px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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
        Text="SentBox"></asp:Label>
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <table class="style2">
        <tr>
            <td class="style3">
            <center>
                <asp:ListView ID="ListView1" runat="server" DataKeyNames="MailID" OnItemCommand="someaction" 
                    DataSourceID="SqlDataSource1">
                  
                  
                    <EmptyDataTemplate>
                        <table runat="server" style="">
                            <tr>
                                <td>
                                    No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                  
                    <ItemTemplate>
                        <tr style="">
                            <td>
                           
                                 <asp:LinkButton ID="ReceiverIDLink" CommandName="Show" runat="server" Text='<%# Eval("ReceiverID") %>' Font-Size="Medium" ForeColor="Black"></asp:LinkButton>
                                               
                            </td>
                            <td>
                                
                                <asp:HiddenField ID="EmailID" runat="server" Value='<%# Eval("MailID") %>' />
                            </td>
                            
                            <td>
                                <asp:Label ID="SubjectLabel" runat="server" Text='<%# Eval("Subject") %>'  Font-Size="Medium"/>
                            </td>
                            <td>
                                <asp:HiddenField ID="HiddenField2" runat="server" />
                            </td>
                            <td>
                                <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' Font-Size="Medium"/>
                            </td>
                            <td>
                                
                            </td>
                            <td>
                            
                            </td>
                            <td>
                                
                            </td>
                            <td>
                                
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table ID="itemPlaceholderContainer" runat="server" border="0" style="">
                                        <tr runat="server" style="">
                                            <th runat="server">
                                               
                                                  <asp:Label ID="Label1" runat="server" Text=" ReceiverID" Font-Bold="True" Font-Size="Medium"></asp:Label>
                                                </th>
                                            <th runat="server">
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                </th>
                                            <th runat="server">
                                               <asp:Label ID="Label2" runat="server" Text=" Subject" Font-Bold="True" Font-Size="Medium"></asp:Label>   </th>
                                            <th runat="server">
                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                            <th runat="server">
                                                 <asp:Label ID="Label3" runat="server" Text=" Date" Font-Bold="True" Font-Size="Medium"></asp:Label>  </th>
                                            <th runat="server">
                                               &nbsp;&nbsp;&nbsp;&nbsp;</th>
                                            <th runat="server">
                                                </th>
                                            <th runat="server">
                                                </th>
                                            <th runat="server">
                                                </th>
                                        </tr>
                                        <tr ID="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="">
                                    <asp:DataPager ID="DataPager1" runat="server">
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
                        <tr style="">
                            <td>
                                <asp:Label ID="MailIDLabel" runat="server" Text='<%# Eval("MailID") %>' />
                            </td>
                            <td>
                                <asp:Label ID="ReceiverIDLabel" runat="server" 
                                    Text='<%# Eval("ReceiverID") %>' />
                            </td>
                            <td>
                                <asp:Label ID="SenderIDLabel" runat="server" Text='<%# Eval("SenderID") %>' />
                            </td>
                            <td>
                                <asp:Label ID="SubjectLabel" runat="server" Text='<%# Eval("Subject") %>' />
                            </td>
                            <td>
                                <asp:Label ID="BodyLabel" runat="server" Text='<%# Eval("Body") %>' />
                            </td>
                            <td>
                                <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                            </td>
                            <td>
                                <asp:Label ID="ReadBitLabel" runat="server" Text='<%# Eval("ReadBit") %>' />
                            </td>
                            <td>
                                <asp:Label ID="SenderBitLabel" runat="server" Text='<%# Eval("SenderBit") %>' />
                            </td>
                            <td>
                                <asp:Label ID="ReceiverBitLabel" runat="server" 
                                    Text='<%# Eval("ReceiverBit") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
                </center>
            </td>
        </tr>
    </table>
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <table class="style1">
        <tr>
            <td>
                 
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:FlickrConnectionString %>" 
                    DeleteCommand="DELETE FROM [Email] WHERE [MailID] = @original_MailID" 
                    InsertCommand="INSERT INTO [Email] ([ReceiverID], [SenderID], [Subject], [Body], [Date], [ReadBit], [SenderBit], [ReceiverBit]) VALUES (@ReceiverID, @SenderID, @Subject, @Body, @Date, @ReadBit, @SenderBit, @ReceiverBit)" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="SELECT * FROM [Email] WHERE (([SenderID] = @SenderID) AND ([SenderBit] = @SenderBit)) ORDER BY [Date] DESC" 
                    UpdateCommand="UPDATE [Email] SET [ReceiverID] = @ReceiverID, [SenderID] = @SenderID, [Subject] = @Subject, [Body] = @Body, [Date] = @Date, [ReadBit] = @ReadBit, [SenderBit] = @SenderBit, [ReceiverBit] = @ReceiverBit WHERE [MailID] = @original_MailID">
                    <DeleteParameters>
                        <asp:Parameter Name="original_MailID" Type="Int64" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ReceiverID" Type="String" />
                        <asp:Parameter Name="SenderID" Type="String" />
                        <asp:Parameter Name="Subject" Type="String" />
                        <asp:Parameter Name="Body" Type="String" />
                        <asp:Parameter Name="Date" Type="String" />
                        <asp:Parameter Name="ReadBit" Type="Int32" />
                        <asp:Parameter Name="SenderBit" Type="Int32" />
                        <asp:Parameter Name="ReceiverBit" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="SenderID" SessionField="currUser" Type="String" />
                        <asp:Parameter DefaultValue="0" Name="SenderBit" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ReceiverID" Type="String" />
                        <asp:Parameter Name="SenderID" Type="String" />
                        <asp:Parameter Name="Subject" Type="String" />
                        <asp:Parameter Name="Body" Type="String" />
                        <asp:Parameter Name="Date" Type="String" />
                        <asp:Parameter Name="ReadBit" Type="Int32" />
                        <asp:Parameter Name="SenderBit" Type="Int32" />
                        <asp:Parameter Name="ReceiverBit" Type="Int32" />
                        <asp:Parameter Name="original_MailID" Type="Int64" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
&nbsp;<br />
    <br />
</asp:Content>
