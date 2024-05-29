<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Patients_Records.aspx.cs" Inherits="WebApplication2.Patients_Records" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Patients Records</title>
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

        #Search {
            padding: 10px 15px;
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
        }

        #viewProfilelist {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            margin-top: 10px;
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <label for="PID">Patient ID</label>
            <asp:TextBox ID="PID" runat="server"></asp:TextBox>

            <asp:Button ID="Search" runat="server" OnClick="Button1_Click" Text="Search For Patient" />

            <asp:Literal ID="viewProfilelist" runat="server"></asp:Literal>
        </div>
    </form>
</body>
</html>
