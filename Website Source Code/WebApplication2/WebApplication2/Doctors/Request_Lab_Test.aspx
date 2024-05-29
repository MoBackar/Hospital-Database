<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Request_Lab_Test.aspx.cs" Inherits="WebApplication2.Doctors.Request_Lab_Test" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Request Lab Test</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 0;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
        }

        div {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            margin-bottom: 10px;
        }

        #Button1 {
            padding: 10px 15px;
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
        }

        #lbl1 {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <label for="PID">Patient ID</label>
            <asp:TextBox ID="PID" runat="server"></asp:TextBox>

            <label for="LID">Lab ID</label>
            <asp:TextBox ID="LID" runat="server"></asp:TextBox>

            <asp:Button ID="Button1" runat="server" Text="Request" OnClick="Button1_Click" />
        </div>
        <asp:TextBox ID="lbl1" runat="server"></asp:TextBox>
    </form>
</body>
</html>
