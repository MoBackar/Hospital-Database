<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VFP.aspx.cs" Inherits="WebApplication2.Nurse.Nurse_pt1.VFP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Patient Information</title>
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
            font-size: 18px;
        }

        #PID {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            margin-bottom: 15px;
        }

        #S {
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

        #S:hover {
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
            View Info For Patient:
        </div>
        <asp:TextBox ID="PID" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="S" runat="server" Text="Search" OnClick="S_Click" />
        <br />
        <asp:Literal ID="l1" runat="server"></asp:Literal>
    </form>
</body>
</html>
