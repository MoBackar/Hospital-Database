<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication2.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
        body {
            background-color: #f0f8ff;
            color: #333;
            font-family: Arial, sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0; 
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: left;
        }

        h2 {
            color: #0066cc;
        }

        label {
            color: #0066cc;
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            margin: 8px 0;
            box-sizing: border-box;
            border: 1px solid #0066cc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #0066cc;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0052a3;
        }

        .signup-link {
            color: #0066cc;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Please Login using your credentials</h2>
        <label for="username">Username:</label>
        <asp:TextBox ID="username" runat="server"></asp:TextBox>

        <label for="password1">Password:</label>
        <asp:TextBox ID="password1" runat="server" TextMode="Password"></asp:TextBox>

        <br />
        <asp:Button ID="SignIn" runat="server" OnClick="login" Text="Log In" />
        <br />

        If you don't have an account, click <asp:HyperLink ID="signup" runat="server" NavigateUrl="SignUp/signup.aspx" CssClass="signup-link">here</asp:HyperLink>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Please Check Your Credentials!" Visible ="false"></asp:Label>
    </form>
</body>
</html>
