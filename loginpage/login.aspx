<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="loginpage_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align:center;">
        <asp:Label ID="Label1" runat="server" Text="Please login first"></asp:Label>
        <hr /><br />
        <asp:Label ID="usernamelb" runat="server" Text="username:" BorderStyle="None"></asp:Label>
        <asp:TextBox ID="usernametbox" runat="server"></asp:TextBox>
        <br /><br />
        <asp:Label ID="passwordlb" runat="server" Text="password:"></asp:Label>
        <asp:TextBox ID="passwordtbox" runat="server"></asp:TextBox>
        <br /><br />
        <asp:Button ID="loginbtn" runat="server" Text="login" OnClick="Loginbtn_Click" />
        &nbsp;
        <asp:Button ID="resetbtn" runat="server" Text="reset" OnClick="resetbtn_Click" />
        <br /><br />
        <asp:Label ID="logfaillb" runat="server" Text="login failed!"></asp:Label><br />
        <asp:Label ID="registerlb" runat="server" Text="No account? Register one"></asp:Label>
        <br />
        <asp:Button ID="registerbtn" runat="server" Text="Register" OnClick="registerbtn_Click" />
    </div>
    </form>
</body>
</html>
