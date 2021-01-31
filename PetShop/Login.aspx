<%@ Page Title="" Language="C#" MasterPageFile="~/PetShop.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PetShop.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
    <style type="text/css">
    .auto-style9 {
        font-size: x-large;
    }
    .auto-style10 {
        text-align: center;
    }
</style>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="auto-style10">
    <strong><span class="auto-style9">로그인 </span></strong>
</p>
<table class="auto-style10" align="center">
    <tr>
        <td class="auto-style11">아이디</td>
        <td class="auto-style14">
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </td>
        <td class="auto-style13" rowspan="2">
            <asp:Button ID="Button8" runat="server" Height="46px" OnClick="Button8_Click" Text="로그인" Width="122px" />
        </td>
    </tr>
    <tr>
        <td class="auto-style11">패스워드</td>
        <td class="auto-style14">
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style11">&nbsp;</td>
        <td class="auto-style14">
            <asp:CheckBox ID="CheckBox1" runat="server" Text="로그인 상태 유지" />
        </td>
        <td class="auto-style13">
            &nbsp;</td>
    </tr>
</table>
    <br />
    <p class="auto-style10">
        <strong>
        <asp:Label ID="Label2" runat="server" CssClass="auto-style16"></asp:Label>
        </strong></p>
</asp:Content>
