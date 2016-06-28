<%@ Page Language="C#" AutoEventWireup="true" CodeFile="formmain.aspx.cs" Inherits="formpage_formmain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        #formgrid {
            margin: auto;
        }

            #formgrid tr td {
                padding: 10px;
                background-color: #b9afaf;
            }

            #formgrid th {
                padding: 10px;
                background-color: #d3ae75;
                height: 20%;
            }

            #formgrid .authorname {
                color: red;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center;">
            <asp:GridView ID="formgrid" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="postingId" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="postingId" HeaderText="postingId" InsertVisible="False" ReadOnly="True" SortExpression="postingId" />
                    <asp:BoundField DataField="title" HeaderText="title" SortExpression="title">
                        <HeaderStyle Font-Bold="True" ForeColor="#CCFFCC" />
                        <ItemStyle BackColor="#CCFFFF" Font-Bold="True" Font-Size="Large" Font-Overline="False" Font-Underline="False" ForeColor="#993300" />
                    </asp:BoundField>
                    <asp:BoundField DataField="content" HeaderText="content" SortExpression="content" />
                    <asp:BoundField DataField="username" HeaderText="username" SortExpression="username">
                        <ItemStyle CssClass="authorname" />
                    </asp:BoundField>
                    <asp:BoundField DataField="postdate" HeaderText="postdate" SortExpression="postdate" />
                    <asp:BoundField DataField="responsecount" HeaderText="responsecount" SortExpression="responsecount" />
                    <asp:BoundField DataField="viewcount" HeaderText="viewcount" SortExpression="viewcount" />
                    <asp:ImageField HeaderText="head icon" DataImageUrlField="iconsrc" DataImageUrlFormatString="../image/{0}">
                    </asp:ImageField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Posting.postingId, Posting.title, Posting.[content], User_Info.username, Posting.postdate, Posting.responsecount, Posting.viewcount, HeadIcons.iconsrc FROM User_Info INNER JOIN Posting ON User_Info.Id = Posting.authorid INNER JOIN HeadIcons ON User_Info.headiconid = HeadIcons.headiconId"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
