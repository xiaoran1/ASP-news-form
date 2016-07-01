<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeFile="reply.aspx.cs" Inherits="formpage_reply" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript" src="../static/ckeditor/ckeditor.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tbody>
                    <tr>
                        <td>Reply to: </td>
                        <td>
                            <asp:Label ID="replyto" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Content: </td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            <%--<textarea name="Msg" cols="50" rows="5" id="Msg"></textarea>--%></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="postcomment" runat="server" Text="post" OnClick="postcomment_Click"/></td>
                    </tr>
                </tbody>
            </table>
            <script type="text/javascript">
                //var formcontent = document.getElementById("Msg");
                //CKEDITOR.replace(formcontent);
            </script>
        </div>
    </form>
</body>
</html>
