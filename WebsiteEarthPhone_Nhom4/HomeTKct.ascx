<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HomeTKct.ascx.cs" Inherits="WebsiteEarthPhone_Nhom4.HomeTKct" %>
<div class="container">
    <section class="promotion-section bg-red-600">
        <h2>
            <asp:Label ID="lblTenDanhMuc" runat="server"></asp:Label></h2>
        <div class="product-grid">
            <% for (int i = 0; i < listTK.Count; i++)
               { %>
            <div class="product-item">
                <a href='<%="products.aspx?IdSanPham="+ listTK[i].ID_SANPHAM.ToString() %>'>
                    <img alt="<%= listTK[i].TEN_SANPHAM %>" src="<%="./img/products/" + listTK[i].ANH %>" width="200" height="300" />
                </a>
                <h3><%= listTK[i].TEN_SANPHAM %></h3>
                <p class="price"><%= listTK[i].GIA %></p>
            </div>
            <% } %>
        </div>
    </section>
    <!-- Sản phẩm mới -->
    <section class="promotion-section bg-blue-200">
        <h2>SẢN PHẨM MỚI</h2>
        <div class="product-grid">
            <% for (int i = 0; i < listSPM.Count; i++)
               { %>
            <div class="product-item">
                <a href='<%="products.aspx?IdSanPham="+ listSPM[i].ID_SANPHAM.ToString() %>'>
                    <img alt="<%= listSPM[i].TEN_SANPHAM %>" src="<%="./img/products/" + listSPM[i].ANH %>"
                        width="200" height="300" />
                </a>
                <h3><%= listSPM[i].TEN_SANPHAM %></h3>
                <p class="price"><%= listSPM[i].GIA %></p>
            </div>
            <% } %>
        </div>
    </section>
</div>