<%@ Page Title="" Language="C#" MasterPageFile="~/motherpageex/Amother1.master" AutoEventWireup="true" CodeFile="readallline.aspx.cs" Inherits="motherpageex_readallline" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #txtholder{
            width: 400px;
            height:inherit;
            overflow-y: auto;
        }
        #txtholder input{
           display:block;
           width:inherit;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content_main" runat="Server" ClientIDMode="Static">
    <div id="txtholder" runat="server">
    </div>
    <asp:Button ID="savebtn" runat="server" Text="Button" OnClick="savebtn_Click" />
</asp:Content>

