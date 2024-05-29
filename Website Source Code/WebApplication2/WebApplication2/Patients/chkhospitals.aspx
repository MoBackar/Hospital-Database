<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chkhospitals.aspx.cs" Inherits="WebApplication2.Patients.chkhospitals" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Check Hospitals</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="hospitals" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns = "false">
                  <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                  <Columns>
                     <asp:BoundField DataField="h_name" HeaderText="Hospital" SortExpression="h_name" />
                     <asp:BoundField DataField="d_name" HeaderText="Doctor" SortExpression="d_name" />
                  </Columns>
                  <EditRowStyle BackColor="#999999" />
                  <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                  <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                  <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                  <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                  <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                  <SortedAscendingCellStyle BackColor="#E9E7E2" />
                  <SortedAscendingHeaderStyle BackColor="#506C8C" />
                  <SortedDescendingCellStyle BackColor="#FFFDF8" />
                  <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>    
        </div>
    </form>
</body>
</html>
