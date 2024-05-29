<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="patient.aspx.cs" Inherits="WebApplication2.Patients.patient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Profile</title>
    <style>
        .horizontal-menu {
            display: flex;
            justify-content: space-around;
            background-color: #f0f8ff; /* AliceBlue */
            padding: 10px;
        }

        .horizontal-menu button {
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            background-color: #0066cc; /* RoyalBlue */
            color: #fff; /* White */
            transition: background-color 0.3s;
        }

        .horizontal-menu button:hover {
            background-color: #0052a3; /* Darker shade of RoyalBlue */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="horizontal-menu">
            <asp:Button ID="Button1" runat="server" OnClick="viewprofile" Text="View My Profile" CssClass="menu-button" />
            <asp:Button ID="Button4" runat="server" OnClick="chkhospitals" Text="Check Hospitals" CssClass="menu-button" />
            <asp:Button ID="Button5" runat="server" OnClick="chkdoctors" Text="Check Doctors" CssClass="menu-button" />
            <asp:Button ID="Button6" runat="server" OnClick="makeappt" Text="Make an Appointment" CssClass="menu-button" />

        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="True">
        </asp:GridView>
        <asp:Button ID="Button2" runat="server" OnClick="editprofile" Text="Click here to edit your profile" />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" Visible="false">
            <asp:ListItem Value="1">name</asp:ListItem>
            <asp:ListItem Value="2">age</asp:ListItem>
            <asp:ListItem Value="3">diet</asp:ListItem>
            <asp:ListItem Value="4">exercise</asp:ListItem>
            <asp:ListItem Value="5">emergency contact name</asp:ListItem>
            <asp:ListItem Value="6">emergency contact number</asp:ListItem>
            <asp:ListItem Value="7">password</asp:ListItem>
        </asp:RadioButtonList>
        <asp:TextBox ID="TextBox1" runat="server" Visible="false"></asp:TextBox>
        <asp:Button ID="Button3" runat="server" Text="edit" OnClick="submitedit" Visible="false" />
    </form>
</body>
</html>
