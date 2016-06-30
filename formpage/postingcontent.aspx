<%@ Page Language="C#" AutoEventWireup="true" CodeFile="postingcontent.aspx.cs" Inherits="formpage_postingcontent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        :root {
            --listbody-color:#e9e2e2;
        }

        body, div, p, img, h1, h2, h3, h4, h5 {
            padding: 0px;
            margin: 0px;
        }

        body {
            width: 800px;
            position: center;
            margin: 0 15%;
            height: 1000px;
        }

        .clear {
            clear: both;
        }

        #commentlist {
            width: 800px;
        }

        #main_div {
            text-align: center;
            background-color: var(--listbody-color);
            border: inset 1px;
            width: inherit;
        }

        .item_template {
            background-color: var(--listbody-color);
            text-align: center;
            height: 300px;
            padding: 15px;
            border-bottom: 1px solid black;
        }

            .item_template:hover {
                background-color: #dedede;
            }

            .item_template p {
                color: black;
                white-space: initial;
                max-width: 100%;
                font-family: 'Microsoft JhengHei';
            }

            .item_template .itemleft {
                float: left;
                width: 20%;
                height: 100%;
                background-color: #dedede;
            }

                .item_template .itemleft img {
                    width: 40%;
                    overflow: auto;
                }

            .item_template .itemright {
                float: right;
                width: 80%;
                height: 100%;
            }

            .item_template a {
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                max-width: 100%;
                text-decoration: none;
                font-weight: bold;
                font-family: 'Microsoft JhengHei';
                color: #141368;
            }

                .item_template a:hover {
                    color: red;
                }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="main_div">
            <table id="commentlist">
                <asp:Repeater ID="Commentsrepeater" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td class="item_template">
                                <div class="itemleft" style="position: relative;">
                                    <div>
                                        <img alt="" src='<%#Eval("iconsrc","../image/{0}") %>' />
                                        <br />
                                    </div>
                                    <div>
                                        <a style="text-align: center; top: 0px">
                                            <%#Eval("username") %>
                                        </a>
                                    </div>

                                </div>
                                <div class="itemright" style="position: relative;">
                                    <p style="text-align: left"><%#Eval("content") %></p>
                                    <br />
                                    <p style="position: absolute; bottom: 0; right: 10%; color: #808080">
                                        <%#Eval("postdate") %>
                                    </p>
                                    <a style="position: absolute; bottom: 0; right: 1px;">reply
                                    </a>
                                </div>
                            </td>
                            <div class="clear"></div>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
    </form>
</body>
</html>
