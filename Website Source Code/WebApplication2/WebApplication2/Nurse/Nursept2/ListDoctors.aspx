<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListDoctors.aspx.cs" Inherits="WebApplication2.Nurse.Nursept2.ListDoctors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>List of All Doctors</title>
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
            margin-bottom: 20px;
        }

        div p {
            font-size: 18px;
            margin-bottom: 10px;
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
            <p>List of All Doctors</p>
            <asp:Literal ID="l1" runat="server"></asp:Literal>
        </div>
    </form>
</body>
</html>
