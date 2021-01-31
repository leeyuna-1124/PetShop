<%@ Page Title="" Language="C#" MasterPageFile="~/PetShop.Master" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="PetShop.search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            text-align: right;
        }
    .auto-style3 {
        font-size: medium;
    }
    .auto-style4 {
        font-size: medium;
        color: #0000FF;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="auto-style1">
        <span class="auto-style2">고양이 상품 :</span>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button10" runat="server" OnClick="Button10_Click" Text="검색" />
</h3>
<h3 class="auto-style1"><span class="auto-style3">검색한 &quot;</span><asp:Label ID="Label2" runat="server" CssClass="auto-style4"></asp:Label>
    <span class="auto-style3">&quot; 키워드와 일치하는 상품입니다.</span></h3>
    <p class="auto-style1"><strong>[고양이 상품]</strong></p>
<p>
    <div class="auto-style1">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1"  Width="1499px" DataKeyNames="pID">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="pID" HeaderText="pID" SortExpression="pID" ReadOnly="True" />
            <asp:BoundField DataField="pName" HeaderText="pName" SortExpression="pName" />
            <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
        </Columns>
        <EmptyDataTemplate>
            입력하신 상품은 존재하지 않습니다.
        </EmptyDataTemplate>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle ForeColor="#330099" BackColor="White" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
    </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:master %>" ProviderName="<%$ ConnectionStrings:master.ProviderName %>" SelectCommand="SELECT pID, pName, category, price FROM Cat WHERE (pName LIKE '%' + @pName + '%')">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="pName" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="pID" DataSourceID="SqlDataSource3" ForeColor="Black" GridLines="None" Height="50px" Width="1499px">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <EmptyDataTemplate>
            선택한 상품이 없습니다.
        </EmptyDataTemplate>
        <Fields>
            <asp:BoundField DataField="pID" HeaderText="pID" ReadOnly="True" SortExpression="pID" />
        </Fields>
        <FooterStyle BackColor="Tan" />
        <FooterTemplate>
            <asp:Button ID="Button12" runat="server" OnClick="Button12_Click" Text="장바구니에 담기" />
        </FooterTemplate>
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:master %>" ProviderName="<%$ ConnectionStrings:master.ProviderName %>" SelectCommand="SELECT [pID] FROM [Cat] WHERE ([pID] = @pID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="pID" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <hr />
</p>
    <p class="auto-style1">
        <strong><span class="auto-style2">강아지 상품 :</span> </strong>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button11" runat="server" OnClick="Button11_Click" Text="검색" />
</p>
<p class="auto-style1">
        <strong><span class="auto-style3">검색한 &quot;</span><asp:Label ID="Label3" runat="server" CssClass="auto-style4"></asp:Label>
        <span class="auto-style3">&quot; 키워드와 일치하는 상품입니다.</span></strong></p>
<p class="auto-style1">
        <strong>[강아지 상품]</strong></p>
<div class="auto-style1">
    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource2" Height="23px" Width="1499px" DataKeyNames="pID">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="pID" HeaderText="pID" SortExpression="pID" ReadOnly="True" />
            <asp:BoundField DataField="pName" HeaderText="pName" SortExpression="pName" />
            <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
        </Columns>
        <EmptyDataTemplate>
            입력하신 상품은 존재하지 않습니다.
        </EmptyDataTemplate>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
    </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:master %>" ProviderName="<%$ ConnectionStrings:master.ProviderName %>" SelectCommand="SELECT pID, pName, category, price FROM Dog WHERE (pName LIKE '%' + @pName + '%')">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox2" Name="pName" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    <br />
    <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="pID" DataSourceID="SqlDataSource4" ForeColor="Black" GridLines="None" Height="50px" Width="1499px">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <EmptyDataTemplate>
            선택한 상품이 없습니다.
        </EmptyDataTemplate>
        <Fields>
            <asp:BoundField DataField="pID" HeaderText="pID" ReadOnly="True" SortExpression="pID" />
        </Fields>
        <FooterStyle BackColor="Tan" />
        <FooterTemplate>
            <asp:Button ID="Button13" runat="server" OnClick="Button13_Click" Text="장바구니에 담기" />
        </FooterTemplate>
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:master %>" ProviderName="<%$ ConnectionStrings:master.ProviderName %>" SelectCommand="SELECT [pID] FROM [Dog] WHERE ([pID] = @pID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView2" Name="pID" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    
</asp:Content>
