﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="formbody.aspx.cs" Inherits="formpage_formbody" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="passinfo" runat="server"></asp:TextBox>
        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="userprofile.aspx">LinkButton</asp:LinkButton>
    </div>
    </form>
</body>
</html>
