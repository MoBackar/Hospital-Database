<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="patientSignup.aspx.cs" Inherits="WebApplication2.SignUp.patientSignup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
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

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="password"] {
        width: 100%;
        padding: 8px;
        margin: 8px 0;
        box-sizing: border-box;
        border: 1px solid #0066cc;
        border-radius: 4px;
        }

        button {
            background-color: #2980b9;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #1c6ca7;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
       <div>
    ID:<br />
    <asp:TextBox ID="Id" runat="server"></asp:TextBox>
    <br />
    Name:</div>
<asp:TextBox ID="name" runat="server"></asp:TextBox>
<br />
Age:<br />
<asp:TextBox ID="age" runat="server"></asp:TextBox>
<br />
Diet:<br />
<asp:TextBox ID="Diet" runat="server"></asp:TextBox>
<br />
Excercise:<br />
<asp:TextBox ID="Excercise" runat="server"></asp:TextBox>
<br />
Emergency_name:<br />
<asp:TextBox ID="E_Name" runat="server"></asp:TextBox>
<br />
Emergency_num:<br />
<asp:TextBox ID="E_num" runat="server"></asp:TextBox>
<br />
password:<br />
<asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
<br />
<br />
<asp:Button ID="w" runat="server" Text="Submit" OnClick="w_Click" />
<br />
<asp:Literal ID="l1" runat="server"></asp:Literal>
    </form>

</body>
</html>