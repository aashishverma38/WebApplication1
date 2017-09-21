<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InBox.aspx.cs" Inherits="WebApplication1.Mail.InBox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 80%;
            margin-left: 71px;
            height: 361px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="CMailLabel" runat="server" Font-Bold="True" Font-Size="Large" 
        Text="Flickr Mail"></asp:Label>
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
    <br />
&nbsp;
    <asp:Label ID="CMLabel" runat="server" Font-Bold="True" Font-Size="Medium" 
        Text="InBox"></asp:Label>
    <br />
    
  
   
    <table class="style1">
        <tr>
            <td>
           
                <center><asp:ListView ID="ListView1" runat="server" OnItemCommand="someaction" DataKeyNames="MailID" 
                    DataSourceID="SqlDataSource1" 
                    onselectedindexchanged="ListView1_SelectedIndexChanged1">
                   
                    <EmptyDataTemplate>
                        <table runat="server" style="">
                            <tr>
                                <td>
                                    Inbox is Empty.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
               
                    <ItemTemplate>
                        <tr style="">
                            <td>
                                <asp:HiddenField ID="EmailID"  runat="server" Value='<%# Eval("MailID") %>'/>
                         
                            
                            </td>
                           
                            <td>
                              <asp:LinkButton ID="SenderIDLink" CommandName="Show" runat="server" Text='<%# Eval("SenderID") %>' Font-Size="Medium" ForeColor="Black"></asp:LinkButton>
                                
                            </td>
                             <td>
                                
                            </td>
                            <td>
                                <asp:Label ID="SubjectLabel" runat="server" Text='<%# Eval("Subject") %>' Font-Size="Medium" />
                            </td>
                            <td>
                                
                            </td>
                            <td>
                                <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' Font-Size="Medium" />
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
                                                </th>
                                          
                                            <th runat="server">
                                                <asp:Label ID="Label1" runat="server" Text="SenderID" Font-Bold="True" Font-Size="Medium"></asp:Label>
                                                </th>
                                                 <th id="Th1" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                </th>
                                            <th runat="server">
                                                <asp:Label ID="Label2" runat="server" Text="Subject" Font-Bold="True" Font-Size="Medium"></asp:Label>
                                             </th>  
                                            <th runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </th>
                                            <th runat="server">
                                                <asp:Label ID="Label3" runat="server" Text="Date" Font-Bold="True" Font-Size="Medium"></asp:Label>
                                                </th>
                                            <th runat="server">
                                                </th>
                                            <th runat="server">
                                                </th>
                                            <th runat="server">
                                                </th>
                                                  <th id="Th2" runat="server">
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
              
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:FlickrConnectionString %>" 
                    DeleteCommand="DELETE FROM [Email] WHERE [MailID] = @original_MailID" 
                    InsertCommand="INSERT INTO [Email] ([ReceiverID], [SenderID], [Subject], [Body], [Date], [ReadBit], [SenderBit], [ReceiverBit]) VALUES (@ReceiverID, @SenderID, @Subject, @Body, @Date, @ReadBit, @SenderBit, @ReceiverBit)" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="SELECT * FROM [Email] WHERE (([ReceiverID] = @ReceiverID) AND ([ReceiverBit] = @ReceiverBit)) ORDER BY [Date] DESC" 
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
                        <asp:SessionParameter Name="ReceiverID" SessionField="currUser" Type="String" />
                        <asp:Parameter DefaultValue="0" Name="ReceiverBit" Type="Int32" />
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
    <br />
    <br />
    <br />
</asp:Content>
