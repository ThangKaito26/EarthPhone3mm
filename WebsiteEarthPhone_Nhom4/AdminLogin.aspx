<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="WebsiteEarthPhone_Nhom4.AdminLogin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Earth Phone Store - Member Login</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #001F3F;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
        }

        .logo {
            text-align: center;
            margin-top: 20px;
        }

        .logo img {
            width: 400px;
        }

        .container {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: 800px;
            max-width: 100%;
        }

        .left {
            background-color: #f5f5f5;
            padding: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex: 1;
            position: relative;
        }

        .left img {
            width: 200px;
            height: 200px;
        }

        .right {
            padding: 50px;
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .right h2 {
            margin: 0 0 20px;
            font-size: 24px;
            color: #333;
        }

        .input-group {
            margin-bottom: 20px;
            position: relative;
        }

        .input-group input {
            width: 100%;
            padding: 15px 15px 15px 45px;
            border: none;
            border-radius: 30px;
            background-color: #f0f0f0;
            font-size: 16px;
            color: #333;
        }

        .input-group i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #999;
        }

        .input-group input::placeholder {
            color: #999;
        }

        .login-btn {
            padding: 15px;
            border: none;
            border-radius: 30px;
            background-color: #00c853;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .login-btn:hover {
            background-color: #00b44a;
        }

        .background-decor {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            z-index: -1;
        }

        .background-decor .circle {
            position: absolute;
            width: 10px;
            height: 10px;
            background-color: #00c853;
            border-radius: 50%;
        }

        .background-decor .circle:nth-child(1) {
            top: 20%;
            left: 10%;
        }

        .background-decor .circle:nth-child(2) {
            top: 50%;
            left: 20%;
        }

        .background-decor .circle:nth-child(3) {
            top: 80%;
            left: 30%;
        }

        .background-decor .circle:nth-child(4) {
            top: 30%;
            left: 70%;
        }

        .background-decor .circle:nth-child(5) {
            top: 60%;
            left: 80%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server"> 
    <div class="logo">
        <img alt="Earth Phone Store Logo" src="img/logo/STORE.png" />
    </div>
    <div class="container">
        <div class="left">
            <img alt="Illustration of a computer screen with a user icon" height="200"
                src="https://storage.googleapis.com/a1aa/image/lAfEQJk9z7zZXqp1T22jXr8g6i3HEmhKDF5kGjOF56cwmfqTA.jpg"
                width="200" />
            <div class="background-decor">
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
            </div>
        </div>
        <div class="right">
            <h2>Admin Login</h2>
            <asp:Label ID="lblThongBaoDN" runat="server"></asp:Label><br />
            <div class="input-group">
                <i class="fas fa-user"></i>
                <asp:TextBox ID="txtUser" runat="server" placeholder="User name"></asp:TextBox>
            </div>
            <div class="input-group">
                <i class="fas fa-lock"></i>
                <asp:TextBox ID="txtMK" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
            </div>
            <asp:Button ID="btnDangNhap" runat="server" Text="LOGIN" CssClass="login-btn" OnClick="btnDangNhap_Click" />
        </div>
    </div>
    </form>
</body>
</html>
