<%@ Page Title="" Language="C#" MasterPageFile="~/PetShop.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="PetShop.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        text-align: center;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="auto-style1">어서오세요! 애견용품을 파는 펫숍입니다!</h2>
<p class="auto-style1">
    <asp:Image ID="Image1" runat="server" ImageUrl="~/Draw/배경.png" Height="400px" Width="1498px" />
    </p>
<p class="auto-style1">
    &nbsp;</p>
<p class="auto-style1">
    &nbsp;</p>
</asp:Content>
