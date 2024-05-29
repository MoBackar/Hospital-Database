<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="WebApplication2.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Signup Selection</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #3498db;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
        }

        a {
            color: #2980b9;
            text-decoration: none;
        }

        a:hover {
            color: #1c6ca7;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Are you a "></asp:Label>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="docSignup.aspx">doctor</asp:HyperLink>
            <asp:Label ID="Label2" runat="server" Text="?"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Are you a "></asp:Label>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="patientSignup.aspx">patient</asp:HyperLink>
            <asp:Label ID="Label4" runat="server" Text="?"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Are you a "></asp:Label>
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="PharSignup.aspx">pharmacist</asp:HyperLink>
            <asp:Label ID="Label6" runat="server" Text="?"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label7" runat="server" Text="Are you a "></asp:Label>
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="nurseSignup.aspx">nurse</asp:HyperLink>
            <asp:Label ID="Label8" runat="server" Text="?"></asp:Label>
        </div>
    </form>
</body>
</html>


