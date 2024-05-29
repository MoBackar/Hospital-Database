<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TC.aspx.cs" Inherits="WebApplication2.Nurse.Nurse_pt1.TC" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Treatment Coverage</title>
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

        div {
            text-align: center;
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-size: 16px;
            margin-bottom: 5px;
        }

        #ID {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            margin-bottom: 15px;
        }

        #Search {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #3498db;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        #Search:hover {
            background-color: #2980b9;
        }

        #l1 {
            font-size: 16px;
            color: #333;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <label for="ID">Treatment ID:</label>
            <asp:TextBox ID="ID" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Search" runat="server" Text="Covered" OnClick="Search_Click" />
            <br />
            <asp:Literal ID="l1" runat="server"></asp:Literal>
        </div>
    </form>
</body>
</html>
