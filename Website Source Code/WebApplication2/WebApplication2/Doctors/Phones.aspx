
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Phones.aspx.cs" Inherits="WebApplication2.Doctors.Phones" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
            margin-bottom: 10px;
        }

        #PhoneNum {
            width: 100%;
            padding: 5px;
            box-sizing: border-box;
        }

        #ADD {
            padding: 8px 15px;
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
        }

        #lbl1 {
            width: 100%;
            padding: 5px;
            box-sizing: border-box;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <label for="PhoneNum">Add Phone Number</label>
            <br />
            <asp:TextBox ID="PhoneNum" runat="server"></asp:TextBox>
        </div>
        <asp:Button ID="ADD" runat="server" Text="ADD" OnClick="ADD_Click" />
        <br />
        <asp:TextBox ID="lbl1" runat="server"></asp:TextBox>
    </form>
</body>
</html>


