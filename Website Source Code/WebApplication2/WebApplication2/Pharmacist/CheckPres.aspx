<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckPres.aspx.cs" Inherits="WebApplication2.Pharmacist.CheckPres" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Check Prescription</title>
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

        #form1 div {
            margin-bottom: 15px;
        }

        #form1 input {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            box-sizing: border-box;
        }

        #Button1 {
            display: block;
            width: 100%;
            padding: 10px;
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

        #Button1:hover {
            background-color: #45a049;
        }

        #viewProfilelist {
            margin-top: 20px;
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <label for="PID">Check Prescription At:</label>
            <asp:TextBox ID="PID" runat="server"></asp:TextBox>

            <label for="DID">Written By:</label>
            <asp:TextBox ID="DID" runat="server"></asp:TextBox>

            <label for="ID">For:</label>
            <asp:TextBox ID="ID" runat="server"></asp:TextBox>

            <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />

            <asp:Literal ID="viewProfilelist" runat="server"></asp:Literal>
        </div>
    </form>
</body>
</html>
