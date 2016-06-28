<%@ Page Language="C#" AutoEventWireup="true" CodeFile="formlistview.aspx.cs" Inherits="formpage_formlistview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
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

        h1 {
            text-align: center;
            font-family:'Lucida Sans Unicode'; 
            border-bottom: 1px solid #dedede;
        }

        .fll {
            float: left;
        }

        .flr {
            float: right;
        }

        .clr {
            clear: both;
            background-color: red;
        }

        #main_div {
            text-align: center;
            background-color: #e9e2e2;
            border: inset 1px;
            width: inherit;
        }

        #div_head {
            width: inherit;
            height: 50px;
            background-color: #ccc;
        }

        #div_classmenu {
            width: inherit;
            background-color: red;
        }

        #div_listview {
            width: 800px;
            height: 900px;
        }

        .item_template {
            background-color: #e9e2e2;
            text-align: center;
            height: 20%;
            padding: 5px;
        }

            .item_template:hover {
                background-color: #dedede;
            }

            .item_template img {
                margin-bottom: 100px;
                float: left;
                width: 20%;
                overflow: auto;
            }

            .item_template p {
                color: #808080;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                max-width: 100%;
                font-family: 'Microsoft JhengHei';
            }

            .item_template .itemleft {
                width: 70%;
                height: 100%;
            }

            .item_template .itemright {
                width: 30%;
                height: 100%;
            }

            .item_template a {
                float: left;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                max-width: 100%;
                text-decoration: none;
                font-size: large;
                font-weight: bold;
                font-family: 'Microsoft JhengHei';
                color: #141368;
            }

                .item_template a:hover {
                    color: red;
                }

        .newsclass {
            background-color: #ccc;
        }

            .newsclass li {
                display: inline-block;
                padding: 15px 30px;
            }

                .newsclass li:hover {
                    background-color: #3e4186;
                }

            .newsclass a {
                color: white;
                font-family:'Lucida Sans Unicode'; 
                font-weight:bold;
                text-decoration: none;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="main_div">
            <div id="div_head">
                <h1>News List</h1>
            </div>
            <div class="clr"></div>
            <div id="div_classmenu">
                <asp:BulletedList ID="NewsClassList" CssClass="newsclass" runat="server" DisplayMode="LinkButton" OnClick="NewsClassList_Click"></asp:BulletedList>
            </div>
            <div class="clr"></div>
            <div id="div_listview" class="fll">
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" ItemPlaceholderID="div_itemholder">
                    <LayoutTemplate>
                        <div runat="server" id="div_itemholder"></div>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <div class="item_template">
                            <div class="fll itemleft">
                                <div class="fll" style="width: 10%">
                                    <p><%#Eval("responsecount")%></p>
                                </div>
                                <div class="flr" style="width: 90%">
                                    <div style="width: 100%; height: 40%;">
                                        <asp:LinkButton ID="LinkButton1" runat="server"><%#Eval("title") %>
                                        </asp:LinkButton>
                                        <br />
                                        <br />
                                        <p class="fll" style="color: black"><%#Eval("content")%></p>
                                    </div>
                                    <br />
                                    <br />
                                    <div style="width: 100%; height: 60%; overflow: hidden">
                                        <img alt="" src='<%#Eval("Imagepath","../image/{0}") %>' />
                                    </div>
                                </div>
                            </div>
                            <div class="flr itemright">
                                <p><%#Eval("postdate")%></p>
                                <br />
                                <p><%#Eval("username","author:{0}") %></p>

                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="
            <%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT Posting.postingId, Posting.title, Posting.[content], Posting_Class.classname, 
            User_Info.username, Posting.postdate, Posting.responsecount, Posting.viewcount, Posting_Images.Imagepath FROM Posting 
            INNER JOIN Posting_Class ON Posting.postingclass = Posting_Class.classId INNER JOIN User_Info ON
             Posting.authorid = User_Info.Id INNER JOIN Posting_Images ON Posting.images = Posting_Images.imageId
                    WHERE ([postingclass] = @postingclass)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="1" Name="postingclass" SessionField="newsclass" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            <div class="clr"></div>
        </div>
    </form>
</body>
</html>
