<%@ Page Title="" Language="C#" MasterPageFile="~/PetShop.Master" AutoEventWireup="true" CodeBehind="관리자.aspx.cs" Inherits="PetShop.관리자" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style9 {
            margin-left: 0px;
            height: 27px;
        }
    .auto-style10 {
        text-align: center;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="auto-style10">
        <h2 class="auto-style10">상품 관리하기</h2><strong>고양이 상품 선택</strong> :
        <asp:DropDownList ID="DropDownList1" runat="server" 
            OnDataBound="DropDownList1_DataBound" 
            OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
        </asp:DropDownList>
&nbsp;<asp:Button ID="Button1" runat="server" Text="상품 수정" OnClick="Button1_Click" />
&nbsp;<asp:Button ID="Button2" runat="server" Text="상품 삭제" 
    OnClick="Button2_Click" OnClientClick="return confirm('정말로 삭제하시겠습니까?');" />
&nbsp;<asp:Button ID="Button3" runat="server" Text="화면 초기화" OnClick="Button3_Click" />
&nbsp;<asp:Button ID="Button4" runat="server" Text="신상품 등록" OnClick="Button4_Click" />
        <hr />
        <br />
        <table class="auto-style4" align="center">
            <tr>
                <td>상품ID</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>상품명</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">종류</td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox3" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>단가</td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />
        <strong>
        <asp:Label ID="Label2" runat="server" CssClass="auto-style5"></asp:Label>
        </strong>
        <br />
        <br />
        <br/>

        <br />
        <br />
        <br />
        <br />

        <strong>강아지 상품 선택</strong> :
        <asp:DropDownList ID="DropDownList2" runat="server" 
            OnDataBound="DropDownList2_DataBound" 
            OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True">
        </asp:DropDownList>
&nbsp;<asp:Button ID="Button5" runat="server" Text="상품 수정" OnClick="Button5_Click" />
&nbsp;<asp:Button ID="Button6" runat="server" Text="상품 삭제" 
    OnClick="Button6_Click" OnClientClick="return confirm('정말로 삭제하시겠습니까?');" />
&nbsp;<asp:Button ID="Button7" runat="server" Text="화면 초기화" OnClick="Button7_Click" />
&nbsp;<asp:Button ID="Button8" runat="server" Text="신상품 등록" OnClick="Button8_Click" />
        <hr />
        <br />
        <table class="auto-style4" align="center">
            <tr>
                <td>상품ID</td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>상품명</td>
                <td>
                    <asp:TextBox ID="TextBox6" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style9">종류</td>
                <td class="auto-style9">
                    <asp:TextBox ID="TextBox7" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>단가</td>
                <td>
                    <asp:TextBox ID="TextBox8" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />
        <strong>
        <asp:Label ID="Label1" runat="server" CssClass="auto-style5"></asp:Label>
        </strong>
        <br />
        <br />
        <br/></div>
</asp:Content>
