<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nurse.aspx.cs" Inherits="WebApplication2.Nurse.Nurse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Nurse Platform</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 0;
            background-color: #f8f8f8;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .button-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 10px;
            margin-bottom: 15px;
        }

        .button-container button {
            display: block;
            width: 100%;
            padding: 15px;
            background-color: #3498db;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .button-container button:hover {
            background-color: #2980b9;
        }

        h2 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Nurse Platform</h2>

        <div class="button-container">
            <asp:Button ID="View" runat="server" Text="View All Patients" OnClick="View_Click" />
            <asp:Button ID="PatView" runat="server" Text="View Patient" OnClick="PatView_Click" />
            <asp:Button ID="DHP" runat="server" OnClick="DHPCLick" Text="Doctors, Patients Per Hospital" />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="EM Provides CallCenters" />
            <asp:Button ID="TC" runat="server" Text="Treatment Covered By" OnClick="TC_Click" />
            <asp:Button ID="Button2" runat="server" Text="List Doctors" OnClick="Button2_Click" />
            <asp:Button ID="UP" runat="server" Text="Update Patient Info" OnClick="UP_Click" />
            <asp:Button ID="TT" runat="server" Text="Takes Medication" OnClick="TT_Click" />
            <asp:Button ID="PA" runat="server" Text="Provides Ambulances" OnClick="PA_Click" />
            <asp:Button ID="sc" runat="server" Text="Signed Contracts" OnClick="sc_Click" />
        </div>
    </form>
</body>
</html>