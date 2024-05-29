<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Doctor.aspx.cs" Inherits="WebApplication2.Doctor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Doctor's Info</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            margin: 20px;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        div {
            text-align: center;
            margin-bottom: 20px;
        }

        .button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 15px 30px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
            margin: 10px;
            width: 100%;
            box-sizing: border-box;
        }

        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Doctor's Portal</h2>
        <div>
            <asp:Button ID="INFO" CssClass="button" runat="server" Text="View My Profile" OnClick="INFO_Click" />
            <asp:Button ID="Patient" CssClass="button" runat="server" Text="View Patients History" OnClick="Patient_Click" />
            <asp:Button ID="Req" CssClass="button" runat="server" OnClick="Button1_Click" Text="Request Lab Test" />
            <asp:Button ID="Pres" CssClass="button" runat="server" Text="Write Prescription" OnClick="Pres_Click" />
            <asp:Button ID="Phone" CssClass="button" runat="server" Text="Add Phone Number" OnClick="Phone_Click" />
        </div>
    </form>
</body>
</html>
