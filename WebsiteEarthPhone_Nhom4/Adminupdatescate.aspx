﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adminupdatescate.aspx.cs" Inherits="WebsiteEarthPhone_Nhom4.Adminupdatescate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">  
    <title>Earth Phone Store - Update Product</title>  
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />  
    <style>  
        /* Styles for the layout - Customize as needed */  
        body {  
            font-family: Arial, sans-serif;  
            margin: 0;  
            padding: 0;  
            background-color: #f5f5f5;  
        }  

        .container {  
            display: flex;  
        }  

        .sidebar {  
            width: 250px;  
            background-color: #ffffff;  
            padding: 20px;  
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);  
        }  

        .sidebar h2 {  
            font-size: 18px;  
            margin-bottom: 20px;  
        }  

        .sidebar ul {  
            list-style: none;  
            padding: 0;  
        }  

        .sidebar ul li {  
            margin-bottom: 10px;  
        }  

        .sidebar ul li a {  
            text-decoration: none;  
            color: #333;  
        }  

        .main-content {  
            flex-grow: 1;  
            padding: 20px;  
        }  

        .header {  
            text-align: center;  
            background-color: #001F3F;  
        }  

        .header img {  
            width: 300px;  
            vertical-align: middle;  
        }  

        .form-container {  
            background-color: #ffffff;  
            padding: 20px;  
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);  
        }  

        .form-container label {  
            display: block;  
            margin-bottom: 10px;  
            font-weight: bold;  
        }  

        .form-container input[type="text"],  
        .form-container input[type="number"],  
        .form-container select,  
        .form-container textarea {  
            width: 100%;  
            padding: 10px;  
            margin-bottom: 20px;  
            border: 1px solid #ccc;  
            border-radius: 5px;  
        }  

        .form-container input[type="file"] {  
            margin-bottom: 20px;  
        }  

        .form-container .buttons {  
            display: flex;  
            justify-content: flex-end;  
        }  

        .form-container .buttons button {  
            padding: 10px 20px;  
            border: none;  
            border-radius: 5px;  
            cursor: pointer;  
            margin-left: 10px;  
        }  

        .form-container .buttons .save-btn {  
            background-color: #1a237e;  
            color: #ffffff;  
        }  

        .form-container .buttons .cancel-btn {  
            background-color: #ff6f00;  
            color: #ffffff;  
        }  
    </style>  
</head>  
<body>
    <form id="form1" runat="server">  
        <div class="header">  
           <a href="AdminProduct.aspx"> <img alt="Earth Phone Store Logo" src="img/logo/STORE.png" width="200" /> </a>
        </div>  
        <div class="container">  
            <div class="sidebar">
                <a style="text-decoration: none" href="AdminProduct.aspx">
                    <h2>LIST OF PRODUCTS
                    </h2>
                </a>
                <a style="text-decoration: none" href="AdminCatetory.aspx">
                    <h2>LIST CATEGORY
                    </h2>
                </a>
            </div>  
            <div class="main-content">  
                <div class="form-container">  
                    <asp:Label ID="lblThongBaoDM" runat="server" ></asp:Label>  
                    <br />
                    <label for="name">Ten Danh Muc:</label>  
                    <asp:TextBox ID="txtTenDM" runat="server" TextMode="SingleLine"></asp:TextBox>  
                    <br />  
                    <label for="price">Hien Thi:</label>  
                    <asp:TextBox ID="txtHienThi" runat="server" TextMode="SingleLine"></asp:TextBox>  
                    <br /> 
                       
                    <div class="buttons">  
                        <asp:Button ID="btnCapNhap" runat="server" Text="Cập Nhập" OnClick="btnCapNhap_Click" CssClass="save-btn" />  
                        <asp:Button ID="btnCancel" runat="server" Text="Hủy" OnClick="btnCancel_Click" CssClass="cancel-btn" />  
                    </div>  
                </div>  
            </div>  
        </div>  
    </form>
</body>
</html>