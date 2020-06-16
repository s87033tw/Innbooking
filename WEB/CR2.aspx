<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CR2.aspx.cs" Inherits="WebF.CR2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:Label ID="Label6" runat="server" Text="入住日期"></asp:Label>
            <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:Label ID="Label7" runat="server" Text="退房日期"></asp:Label>
            <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:Label ID="Label10" runat="server" Text="預定房型"></asp:Label>
            <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:Label ID="Label1" runat="server" Text="餐點數量"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem Value="0" Text="0">0</asp:ListItem>
                <asp:ListItem Value="1" Text="1">1</asp:ListItem>
                <asp:ListItem Value="2" Text="2">2</asp:ListItem>
                <asp:ListItem Value="3" Text="3">3</asp:ListItem>
                <asp:ListItem Value="4" Text="4">4</asp:ListItem>
                <asp:ListItem Value="5" Text="5">5</asp:ListItem>
                <asp:ListItem Value="6" Text="6">6</asp:ListItem>
                <asp:ListItem Value="7" Text="7">7</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label2" runat="server" Text="加床數量"></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                <asp:ListItem Value="0" Text="0">0</asp:ListItem>
                <asp:ListItem Value="1" Text="1">1</asp:ListItem>
                <asp:ListItem Value="2" Text="2">2</asp:ListItem>
                <asp:ListItem Value="3" Text="3">3</asp:ListItem>
                <asp:ListItem Value="4" Text="4">4</asp:ListItem>
                <asp:ListItem Value="5" Text="5">5</asp:ListItem>
                <asp:ListItem Value="6" Text="6">6</asp:ListItem>
                <asp:ListItem Value="7" Text="7">7</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label3" runat="server" Text="信用卡卡號"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="信用卡到期日"></asp:Label>
            <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
            <asp:Label ID="Label5" runat="server" Text="安全碼"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
            <br />
            持卡人姓名<asp:TextBox ID="TextBox3" runat="server" OnTextChanged="TextBox3_TextChanged"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="送出訂單" />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="訂單狀態" HeaderText="訂單狀態" ReadOnly="True" SortExpression="訂單狀態" />
                </Columns>
            </asp:GridView>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="返回主頁" />
            <br />
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ReservationConnectionString %>" SelectCommand="Check_Ins_Order" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="Start_Date" SessionField="Start_Date" Type="DateTime" />
                    <asp:SessionParameter Name="End_Date" SessionField="End_Date" Type="DateTime" />
                    <asp:SessionParameter Name="Customer_ID" SessionField="ID" Type="String" />
                    <asp:SessionParameter Name="Room_Type" SessionField="Room_Type" Type="String" />
                    <asp:SessionParameter Name="Enter" SessionField="Enter" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
