<%@ Page Language="C#" AutoEventWireup="true" CodeFile="chessboard.aspx.cs" Inherits="chessgame_chessboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        table {
            border: 5px solid black;
            border-collapse: collapse;
            margin: 0% auto;
        }

        td {
            width: 40px;
            height: 40px;
            border: 1px solid black;
        }

        .black_td {
            background-color: black;
        }

        .white_td {
            background-color: white;
        }

        td.queen {
            background-image: url(../image/queen.png);
            background-repeat: no-repeat;
            background-position: center;
            background-size: contain;
            border: 5px solid green;
        }

        #div_body {
            border: 5px solid #000000;
            width: 900px;
            margin: 0px auto;
        }

        #div_head {
            background-color: #c2bdbd;
            border-bottom: 1px solid #000000;
            padding: 10px;
            text-align: center;
        }

        #div_foot {
            background-color: #c2bdbd;
            border-bottom: 1px solid #000000;
            height: 10px;
            text-align: center;
        }

        #div_main {
            border: 1px solid #000000;
            width: 100%;
            height: 550px;
            text-align: center;
        }

        #div_left {
            background-color: #b2ccfa;
            width: 30%;
            height: 100%;
            float: left;
        }

        #div_right {
            background-color: gray;
            width: 70%;
            height: 100%;
            float: right;
        }

        .clr {
            clear: both;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="div_body">
            <div id="div_head">
                <h1>Eight Queen</h1>
            </div>
            <div id="div_main">
                <div id="div_left">
                    <div>
                        <div style="float: left">
                            <asp:Button ID="boradmaker" runat="server" Text="chessboard" OnClick="boradmaker_Click" />
                        </div>
                        <div style="float: right">
                            <asp:Button ID="generatelist" runat="server" Text="boardlist" OnClick="generatelist_Click" />
                        </div>
                    </div>
                    <div class="clr"></div>
                    <asp:ListBox ID="resultlist" runat="server" Height="80%" Width="80%"></asp:ListBox>
                </div>
                <div id="div_right">
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                </div>
            </div>
            <div class="clr"></div>
            <div id="div_foot"></div>
        </div>
    </form>
</body>
</html>
