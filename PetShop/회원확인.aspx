<%@ Page Title="" Language="C#" MasterPageFile="~/PetShop.Master" AutoEventWireup="true" CodeBehind="회원확인.aspx.cs" Inherits="PetShop.회원확인" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h3 class="auto-style1"><strong>회원 정보 확인</strong></h3>
        <div class="auto-style1"><span class="auto-style10">회원 확인</span>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="UserID" DataValueField="UserID"  >
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:master %>" ProviderName="<%$ ConnectionStrings:master.ProviderName %>" SelectCommand="SELECT [UserID] FROM [Customer]">
            </asp:SqlDataSource>
            <hr />
            <div>
            <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource2" Height="190px" Width="1499px"  CellPadding="4" ForeColor="#333333">
                <EditItemTemplate>
                    UserID:
                    <asp:TextBox ID="UserIDTextBox" runat="server" Text='<%# Bind("UserID") %>' />
                    <br />
                    Password:
                    <asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>' />
                    <br />
                    Name:
                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                    <br />
                    Phone:
                    <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="업데이트" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="취소" />
                </EditItemTemplate>
                <EditRowStyle BackColor="#999999" />
                <EmptyDataTemplate>
                    아이디를 선택하세요.
                </EmptyDataTemplate>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <InsertItemTemplate>
                    UserID:
                    <asp:TextBox ID="UserIDTextBox0" runat="server" Text='<%# Bind("UserID") %>' />
                    <br />
                    Password:
                    <asp:TextBox ID="PasswordTextBox0" runat="server" Text='<%# Bind("Password") %>' />
                    <br />
                    Name:
                    <asp:TextBox ID="NameTextBox0" runat="server" Text='<%# Bind("Name") %>' />
                    <br />
                    Phone:
                    <asp:TextBox ID="PhoneTextBox0" runat="server" Text='<%# Bind("Phone") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="삽입" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="취소" />
                </InsertItemTemplate>
                <ItemTemplate>
                    UserID:
                    <asp:Label ID="UserIDLabel" runat="server" Text='<%# Bind("UserID") %>' />
                    <br />
                    Password:
                    <asp:Label ID="PasswordLabel" runat="server" Text='<%# Bind("Password") %>' />
                    <br />
                    Name:
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                    <br />
                    Phone:
                    <asp:Label ID="PhoneLabel" runat="server" Text='<%# Bind("Phone") %>' />
                    <br />

                </ItemTemplate>
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            </asp:FormView>
           </div>
        &nbsp;<p class="auto-style8">
           
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:masterConnectionString %>" SelectCommand="SELECT [UserID], [Password], [Name], [Phone] FROM [Customer] WHERE ([UserID] = @UserID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="UserID" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
    </div>
    </div>
</asp:Content>