<%@ Page Title="" Language="C#" MasterPageFile="~/motherpageex/Amother1.master" AutoEventWireup="true" CodeFile="readallfile.aspx.cs" Inherits="motherpageex_readallfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content_main" Runat="Server">
    <asp:TextBox ID="textcontent" runat="server" Width="400px" TextMode="MultiLine" Rows="19"></asp:TextBox>
    <br />
    <asp:Button ID="buttonsave" runat="server" Text="Button" OnClick="buttonsave_Click" />
</asp:Content>

