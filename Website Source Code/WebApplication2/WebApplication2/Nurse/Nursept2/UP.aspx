<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UP.aspx.cs" Inherits="WebApplication2.Nurse.Nursept2.UP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Patient Information</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        form {
            max-width: 500px;
            width: 100%;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        div {
            text-align: left;
            margin-bottom: 10px;
        }

        div label {
            display: block;
            font-size: 16px;
            margin-bottom: 5px;
            font-weight: bold;
        }

        div input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            margin-bottom: 15px;
        }

        #w {
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

        #w:hover {
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
            <label for="Id">Update For Patient With ID:</label>
            <asp:TextBox ID="Id" runat="server"></asp:TextBox>
            <br />
            <label for="name">Name:</label>
            <asp:TextBox ID="name" runat="server"></asp:TextBox>
            <br />
            <label for="age">Age:</label>
            <asp:TextBox ID="age" runat="server"></asp:TextBox>
            <br />
            <label for="Diet">Diet:</label>
            <asp:TextBox ID="Diet" runat="server"></asp:TextBox>
            <br />
            <label for="Excercise">Exercise:</label>
            <asp:TextBox ID="Excercise" runat="server"></asp:TextBox>
            <br />
            <label for="E_Name">Emergency Name:</label>
            <asp:TextBox ID="E_Name" runat="server"></asp:TextBox>
            <br />
            <label for="E_num">Emergency Number:</label>
            <asp:TextBox ID="E_num" runat="server"></asp:TextBox>
            <br />
            <label for="password">Password:</label>
            <asp:TextBox ID="password" runat="server"></asp:TextBox>
            <br />
        </div>
        <asp:Button ID="w" runat="server" Text="Update" OnClick="w_Click" />
        <br />
        <asp:Literal ID="l1" runat="server"></asp:Literal>
    </form>
</body>
</html>
