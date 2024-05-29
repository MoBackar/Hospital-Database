<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Doctor_View_My_Profile.aspx.cs" Inherits="WebApplication2.Doctor_View_My_Profile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Doctor's Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 0;
            background-color: #f8f9fa; /* Set a light background color */
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff; /* Set a white background for the form */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        div {
            margin-bottom: 15px;
            text-align: center;
        }

        #viewProfilelist {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            margin-top: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #f8f9fa; /* Set a light background color */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>DOCTOR'S PROFILE</h2>
            <asp:Literal ID="viewProfilelist" runat="server"></asp:Literal>
        </div>
    </form>
</body>
</html>
