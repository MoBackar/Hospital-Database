<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sc.aspx.cs" Inherits="WebApplication2.Nurse.Nursept2.sc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Companies with Hospital Insurance</title>
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
            max-width: 400px;
            width: 100%;
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
            font-weight: bold;
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
            <p>Companies with Hospital Insurance</p>
            <asp:Literal ID="l1" runat="server"></asp:Literal>
        </div>
    </form>
</body>
</html>
