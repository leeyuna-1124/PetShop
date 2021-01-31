<%@ Page Title="" Language="C#" MasterPageFile="~/PetShop.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="PetShop.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style2 {
        text-align: center;
        font-size: x-large;
    }
        .auto-style3 {
            font-size: medium;
        }
    .auto-style4 {
        font-size: x-large;
    }
        .auto-style5 {
            font-size: medium;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h3 class="auto-style2">
            ❤<asp:Label ID="Label2" runat="server"></asp:Label>
            님의 장바구니❤</h3>
        <div class="auto-style2">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" Width="1498px" DataKeyNames="Mine">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Mine" HeaderText="Mine" SortExpression="Mine" />
                </Columns>
                <EmptyDataTemplate>
                    <span class="auto-style3">장바구니에 담긴 상품이 없습니다.</span>
                </EmptyDataTemplate>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:masterConnectionString %>" SelectCommand="SELECT [Mine] FROM [cart] WHERE ([UserID] = @UserID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Label2" Name="UserID" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            --선택된 상품--</div>
        <p class="auto-style5">
            <asp:DetailsView ID="DetailsView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource2" Height="50px" Width="1498px" AutoGenerateRows="False" DataKeyNames="Mine" ForeColor="Black" GridLines="Horizontal">
                <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <EmptyDataTemplate>
                    선택된 상품이 없습니다.
                </EmptyDataTemplate>
                <Fields>
                    <asp:BoundField DataField="Mine" HeaderText="Mine" SortExpression="Mine" />
                </Fields>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <FooterTemplate>
                     <asp:Button ID="Button10" runat="server" Text="장바구니에서 삭제" OnClick="Button10_Click" PostBackUrl="~/cart.aspx" OnClientClick="return confirm('정말 삭제하시겠습니까?');" />
                </FooterTemplate>
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:master %>" ProviderName="<%$ ConnectionStrings:master.ProviderName %>" SelectCommand="SELECT [Mine] FROM [cart] WHERE ([Mine] = @Mine)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="Mine" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p class="auto-style2">&nbsp;</p>
    </div>
</asp:Content>
