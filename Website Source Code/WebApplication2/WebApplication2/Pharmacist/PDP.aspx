<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PDP.aspx.cs" Inherits="WebApplication2.Pharmacist.PDP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>All Prescriptions</title>
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
            margin-bottom: 20px;
        }

        #viewProfilelist {
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>All Prescriptions</h2>
            <asp:Literal ID="viewProfilelist" runat="server"></asp:Literal>
        </div>
    </form>
</body>
</html>

