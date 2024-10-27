<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pay.aspx.cs" Inherits="WebsiteEarthPhone_Nhom4.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="img/logo/LoGoEarthPhoneTron.png" />
    <title>Thanh Toán</title>
    <link href="css/pay.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="flex justify-between">
                <!-- Bên trái -->
                <div class="left w-1-2 bg-white p-6 rounded shadow-md">
                    <h1 class="text-2xl font-bold mb-4">EARTH PHONE</h1>
                    <h2 class="text-lg mb-6">Thông tin thanh toán</h2>
                    <asp:Label ID="lblTenDT" runat="server" Text="" Visible="False"></asp:Label>
                    <div class="mb-4">
                        <asp:TextBox ID="txeHoTen" runat="server" CssClass="form-input" placeholder="Họ và tên"></asp:TextBox>
                    </div>
                    <div class="mb-4 flex space-x-4">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" placeholder="Email"></asp:TextBox>
                        <asp:TextBox ID="txtSDT" runat="server" CssClass="form-input" placeholder="Điện thoại"></asp:TextBox>
                    </div>
                    <div class="mb-4">
                        <asp:TextBox ID="txtDiaChi" runat="server" CssClass="form-input" placeholder="Địa chỉ chi tiết"></asp:TextBox>
                    </div>
                    <div class="mb-4">
                        <asp:TextBox ID="txtSoLuong" runat="server" CssClass="form-input" placeholder="Số lượng:"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnThanhToan" runat="server" Text="Thanh Toán" CssClass="btn-primary" OnClick="btnThanhToan_Click" />
                </div>
                <!-- Bên phải -->
                <div class="right w-1-3 bg-white p-6 rounded shadow-md">
                    <div class="flex items-center mb-4">
                        <img alt="Image of SAMSUNG Galaxy S22 Ultra 5G (8GB | 128GB) Mỹ Mới Fullbox"
                            class="w-12 h-12 rounded mr-4" height="50"
                            src='<%="./img/products/" + ifDienThoai.ANH%>'
                            width="60" />
                        <div>
                            <p class="text-sm">
                                <%=ifDienThoai.TEN_SANPHAM %> | Mới Fullbox
                            </p>
                            <p class="text-xs text-gray-500">
                                Đen
                            </p>
                        </div>
                        <p class="ml-auto text-lg font-bold">
                            <%=ifDienThoai.GIA%>
                        </p>
                    </div>
                    <div class="border-t border-gray-300 my-4">
                    </div>
                    <div class="flex justify-between mb-2">
                        <p class="text-sm">
                            Tạm tính
                        </p>
                        <p class="text-sm">
                            <%=ifDienThoai.GIA%>
                        </p>
                    </div>
                    <div class="flex justify-between mb-2">
                        <p class="text-sm">
                            Phí ship
                        </p>
                        <p class="text-sm">
                            -
                        </p>
                    </div>
                    <div class="border-t border-gray-300 my-4">
                    </div>
                    <div class="flex justify-between items-center">
                        <p class="text-lg font-bold">
                            Tổng tiền
                        </p>
                        <p class="text-2xl font-bold text-red-500">
                            <%=ifDienThoai.GIA%>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
    </form>
</body>
</html>
