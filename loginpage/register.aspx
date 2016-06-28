<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="loginpage_register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .formclass1 {
            position: fixed;
            top: 10%;
            bottom:10%;
            right:20%;
            left: 20%;
            border:solid;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="formclass1">
        <div style="text-align: center; font-weight: bold;">
            <h1><asp:Label ID="Label1" runat="server" Text="Welcome to register page!"></asp:Label></h1>
            <hr />
            <table align="center">
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Username:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="Rusername" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Password:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="Rpassword" runat="server" TextMode="Password"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Repeat your password:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="repeatpassword" runat="server" TextMode="Password"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Email Address:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="Remail" runat="server"></asp:TextBox></td>
                </tr>
            </table>
            <hr />
            <asp:Button ID="Rregisterbtn" runat="server" Text="Register" OnClick="Rregisterbtn_Click" />
            &nbsp;
            <asp:Button ID="Rresetbtn" runat="server" Text="Reset" OnClick="Rresetbtn_Click" />
            <br /><br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="login.aspx">Back to login page</asp:HyperLink>
            <br /><br />
            <asp:Label ID="failedinfo" runat="server" Text="Register failed!"></asp:Label>
            <br /><br />
        </div>
    </form>
</body>
</html>
