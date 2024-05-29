<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="makeappt.aspx.cs" Inherits="WebApplication2.Patients.makeappt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Select the doctor you wish to make an appointment with: "></asp:Label>
            <asp:DropDownList ID="doctors" runat="server" AutoPostBack="true" EnableViewState="true">
</asp:DropDownList>
            </br> 
            <asp:Button ID="Button1" runat="server" OnClick="confirm" Text="Confirm Appointment" />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Label" Visible="false"></asp:Label>
        </div>
    </form>
</body>
</html>
