<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PharSignup.aspx.cs" Inherits="WebApplication2.SignUp.PharSignup" %>

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
                <asp:Label ID="NID" runat="server" Text="ID:"></asp:Label>  
<asp:TextBox ID="ND" runat="server"></asp:TextBox>

<asp:Label ID="Label1" runat="server" Text="Started At:"></asp:Label>
<asp:TextBox ID="Date" runat="server"></asp:TextBox>

<asp:Label ID="Label2" runat="server" Text="Name::"></asp:Label>
<asp:TextBox ID="name" runat="server"></asp:TextBox>

<asp:Label ID="Label3" runat="server" Text="Pharmacy Name:"></asp:Label>
<asp:TextBox ID="pname" runat="server"></asp:TextBox>

<asp:Label ID="Label4" runat="server" Text="Password:"></asp:Label>
<asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>

<asp:Button ID="Sub" runat="server" Text="Submit" OnClick="Sub_Click" />
<asp:Literal ID="l1" runat="server"></asp:Literal>
    </form>

</body>
</html>
