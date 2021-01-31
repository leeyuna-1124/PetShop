<%@ Page Title="" Language="C#" MasterPageFile="~/PetShop.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="PetShop.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        text-align: center;
    }
        .auto-style2 {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="auto-style1">
 <h2 class="auto-style1">회원 가입</h2>
 <table border="1" style="border-collapse: collapse" align="center" >
 <tr>
 <td style="padding: 3px">사용할 아이디</td>
 <td style="padding: 3px">
 <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>&nbsp; <asp:Button ID="Button8" runat="server" Text="중복확인" CausesValidation="False" OnClick="Button8_Click" />
 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="[아이디] 필수입력"
ControlToValidate="TextBox2" Display="None"></asp:RequiredFieldValidator>
 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="None"
ErrorMessage="[아이디] 영문, 숫자 4~10자로 입력해주세요" ControlToValidate="TextBox2"
ValidationExpression="[0-9a-zA-Z]{4,10}"></asp:RegularExpressionValidator>
 </td>
 </tr>
 <tr>
 <td style="padding: 3px">비밀번호</td>
 <td style="padding: 3px" class="auto-style2">
 <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3"
Display="None" ErrorMessage="[비밀번호] 필수입력"></asp:RequiredFieldValidator>
 </td>
 </tr>
 <tr>
 <td style="padding: 3px">비밀번호 확인</td>
 <td style="padding: 3px" class="auto-style2">
 <asp:TextBox ID="TextBox4" runat="server" TextMode="Password"></asp:TextBox>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox4"
Display="None" ErrorMessage="[비밀번호 확인] 필수입력"></asp:RequiredFieldValidator>
 <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox3"
ControlToValidate="TextBox4" Display="None" ErrorMessage="비밀번호가 일치하지 않습니다"> </asp:CompareValidator></td>
 </tr>
 <tr>
 <td style="padding: 3px">이름</td>
 <td style="padding: 3px" class="auto-style2">
 <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox5"
Display="None" ErrorMessage="[이름] 필수입력"></asp:RequiredFieldValidator>
 </td>
 </tr>
 <tr>
 <td style="padding: 3px">전화번호</td>
 <td style="padding: 3px" class="auto-style2">
 <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
 </td>
 </tr>
 </table><br />
 <asp:Button ID="Button9" runat="server" Text="등록합니다" OnClick="Button9_Click" />&nbsp; <asp:Button ID="Button10" runat="server" CausesValidation="False" Text="Home 으로" OnClick="Button10_Click" style="height: 27px" /><br />
 <asp:Label ID="Label2" runat="server" style="font-weight: 700; color: #CC0066"></asp:Label><br />
 <asp:ValidationSummary ID="ValidationSummary1" runat="server"
DisplayMode="List" ShowMessageBox="True"
ShowSummary="False" />
 <br />
</div>
</asp:Content>
