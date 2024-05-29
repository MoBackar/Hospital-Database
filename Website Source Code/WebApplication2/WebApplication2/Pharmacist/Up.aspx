<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Up.aspx.cs" Inherits="WebApplication2.Pharmacist.Up" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Info</title>
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

        #Updated {
            background-color: #007bff;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        #l1 {
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Update Info</h2>
            Started At:<br />
            <asp:TextBox ID="Date" runat="server"></asp:TextBox>
            <br />
            Name:<br />
            <asp:TextBox ID="name" runat="server"></asp:TextBox>
            <br />
            Pharmacy Name:<br />
            <asp:TextBox ID="Pname" runat="server"></asp:TextBox>
            <br />
            Password:<br />
            <asp:TextBox ID="password" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Updated" runat="server" Text="Update" OnClick="Updated_Click" />
            <br />
            <asp:Literal ID="l1" runat="server"></asp:Literal>
        </div>
    </form>
</body>
</html>

