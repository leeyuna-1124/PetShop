 <%@ Page Title="" Language="C#" MasterPageFile="~/PetShop.Master" AutoEventWireup="true" CodeBehind="dog.aspx.cs" Inherits="PetShop.dog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            font-size: large;
        }
        .auto-style4 {
            font-size: x-large;
        }
    .auto-style5 {
        font-size: large;
        height: -12px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h3 class="auto-style1"><span class="auto-style4">강</span><strong><span class="auto-style4">아지 용품</span></strong></h3>

        <div class="auto-style1">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="pID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" Width="1499px">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="pID" HeaderText="pID" SortExpression="pID" ReadOnly="True" />
                    <asp:BoundField DataField="pName" HeaderText="pName" SortExpression="pName" />
                    <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:master %>" ProviderName="<%$ ConnectionStrings:master.ProviderName %>" SelectCommand="SELECT * FROM [Dog]">
        </asp:SqlDataSource>
        <br />
        <hr />
        <div class="auto-style1">
            <strong><span class="auto-style3">
            <br />
            </span><span class="auto-style5">
            --선택된 상품--</span><span class="auto-style3"><br />
            <br />
            </span></strong><br />
        
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="pID" DataSourceID="SqlDataSource2" GridLines="Horizontal" Height="50px" Width="1499px" >
            <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <EmptyDataTemplate>
                선택된 상품이 없습니다.
            </EmptyDataTemplate>
            <Fields>
                <asp:BoundField DataField="pID" HeaderText="pID" ReadOnly="True" SortExpression="pID" />
                <asp:BoundField DataField="pName" HeaderText="pName" SortExpression="pName" />
                <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            </Fields>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <FooterTemplate>
                <asp:Button ID="Button11" runat="server" Text="장바구니에 담기" OnClick="Button11_Click" />
            </FooterTemplate>
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#333333" />
        </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:masterConnectionString %>" SelectCommand="SELECT * FROM [Dog] WHERE ([pID] = @pID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="pID" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />

    </div>
</asp:Content>
