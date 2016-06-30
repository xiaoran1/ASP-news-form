<%@ Page Language="C#" AutoEventWireup="true" CodeFile="userprofile.aspx.cs" Inherits="formpage_userprofile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:Button ID="Button1" runat="server" Text="Button" />
        <br />
        <asp:TextBox ID="title" runat="server"></asp:TextBox>
        <br />
        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
        <br />
        <asp:ListBox ID="candidatelist" runat="server" SelectionMode="Multiple" Width="151px">
            <asp:ListItem>P1</asp:ListItem>
            <asp:ListItem>P2</asp:ListItem>
            <asp:ListItem>P3</asp:ListItem>
        </asp:ListBox>
        <br />
        <asp:Button ID="Button2" runat="server" Text="Button" PostBackUrl="~/formpage/usertopicrecord.aspx" />
    </div>
    </form>
</body>
</html>
