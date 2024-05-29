<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pharmacist.aspx.cs" Inherits="WebApplication2.Pharmacist.Pharmacist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pharmacist Platform</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            margin: 50px;
        }

        #form1 {
            max-width: 400px;
            margin: auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        #Label1 {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .button {
            display: block;
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            font-size: 16px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
            background-color: #4caf50;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Pharmacist Platform"></asp:Label>

            <br />
            <asp:Button ID="VMP" runat="server" CssClass="button" Text="View My Profile" OnClick="VMP_Click" />
            <asp:Button ID="CP" runat="server" CssClass="button" Text="Check Prescription" OnClick="CP_Click" />
            <asp:Button ID="zew" runat="server" CssClass="button" Text="View All Prescriptions For Patients and Doctors" OnClick="zew_Click" />
            <asp:Button ID="VAP" runat="server" CssClass="button" Text="View All Pharmacists" OnClick="VAP_Click" />
            <asp:Button ID="Up" runat="server" CssClass="button" Text="Update Profile Info" OnClick="Up_Click" />
        </div>
    </form>
</body>
</html>
