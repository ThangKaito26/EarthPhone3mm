<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Home.ascx.cs" Inherits="WebsiteEarthPhone_Nhom4.Home" %>
<!-- Thân trang -->
<div class="container">
    <!-- Banner Tin tức -->
    <div class="row mt-2">
        <!-- Tin tức cuộn -->
        <div class="col-lg-9">
            <div id="carouselExample" class="carousel slide">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="img/banners/BANNER1.jpg" class="d-inline w-100" alt="..." />
                    </div>
                    <div class="carousel-item">
                        <img src="img/banners/BANNER2.jpg" class="d-inline w-100" alt="..." />
                    </div>
                    <div class="carousel-item">
                        <img src="img/banners/BANNER3.jpg" class="d-inline w-100" alt="..." />
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample"
                    data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden"><i class="fa-solid fa-angle-left"></i></span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExample"
                    data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden"><i class="fa-solid fa-angle-right"></i></span>
                </button>
            </div>
        </div>
        <!-- Tin tức Tĩnh -->
        <div class="col-lg-3">
            <div class="box">
                <h2>EARTH PHONE</h2>
                <marquee direction="left" behavior="scroll" height="50px" width="100%" scrollamount="10"
                    scrolldelay="100">
                        Chào mừng bạn đến với Earth Phone
                    </marquee>
            </div>
            <div class="news">
                <img alt="Digiphone Now Delivery" src="img/news/news2.jpg" width="430" height="100" />
            </div>
            <div class="news">
                <img alt="Samsung Galaxy S22 Ultra" src="img/news/news5.jpg" width="430" height="100" />
            </div>
            <div class="news">
                <img alt="Google Pixel 6 | 6 Pro" src="img/news/news3.jpg" width="430" height="100" />
            </div>
        </div>
        <!-- Tin tức gif -->
        <img src="img/banners/blackFriday.gif" alt="" style="margin-top: 15px; width: 100%;" />
    </div>
    <!-- Khuyến mãi hot -->
    <section class="promotion-section bg-red-600">
        <h2>KHUYẾN MÃI HOT</h2>
        <div class="product-grid">
            <% for (int i = 0; i < listSPHot.Count; i++)
               { %>
            <div class="product-item">
                <a href='<%="products.aspx?IdSanPham="+ listSPHot[i].ID_SANPHAM.ToString() %>'>
                    <img alt="<%= listSPHot[i].TEN_SANPHAM %>" src="<%= listSPHot[i].ANH %>" width="200" height="300" />
                </a>
                <h3><%= listSPHot[i].TEN_SANPHAM %></h3>
                <p class="price"><%= listSPHot[i].GIA %></p>
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
                    <img alt="<%= listSPM[i].TEN_SANPHAM %>" src="<%= listSPM[i].ANH %>"
                        width="200" height="300" />
                </a>
                <h3><%= listSPM[i].TEN_SANPHAM %></h3>
                <p class="price"><%= listSPM[i].GIA %></p>
            </div>
            <% } %>
        </div>
    </section>
    <!-- Sản phẩm bán chạy -->
    <section id="IPHONE" class="promotion-section bg-purple-200">
        <h2>iPhone</h2>
        <div class="product-grid">
            <% for (int i = 1; i < listIPHONE.Count; i++)
               { %>
            <div class="product-item">
                <a href='<%="products.aspx?IdSanPham="+ listIPHONE[i].ID_SANPHAM.ToString() %>'>
                    <img alt="<%= listIPHONE[i].TEN_SANPHAM %>" src="<%= listIPHONE[i].ANH %>"
                        width="200" height="300" />
                </a>
                <h3><%= listIPHONE[i].TEN_SANPHAM %></h3>
                <p class="price"><%= listIPHONE[i].GIA %></p>
            </div>
            <% } %>
        </div>
    </section>

    <section id="OPPO" class="promotion-section bg-purple-200">
        <h2>Oppo</h2>
        <div class="product-grid">
            <% for (int i = 1; i < listOPPO.Count; i++)
               { %>
            <div class="product-item">
                <a href='<%="products.aspx?IdSanPham="+ listOPPO[i].ID_SANPHAM.ToString() %>'>
                    <img alt="<%= listOPPO[i].TEN_SANPHAM %>" src="<%= listOPPO[i].ANH %>"
                        width="200" height="300" />
                </a>
                <h3><%= listOPPO[i].TEN_SANPHAM %></h3>
                <p class="price"><%= listOPPO[i].GIA %></p>
            </div>
            <% } %>
        </div>
    </section>

    <section id="SAMSUNG" class="promotion-section bg-purple-200">
        <h2>Samsung</h2>
        <div class="product-grid">
            <% for (int i = 1; i < listSS.Count; i++)
               { %>
            <div class="product-item">
                <a href='<%="products.aspx?IdSanPham="+ listSS[i].ID_SANPHAM.ToString() %>'>
                    <img alt="<%= listSS[i].TEN_SANPHAM %>" src="<%= listSS[i].ANH %>"
                        width="200" height="300" />
                </a>
                <h3><%= listSS[i].TEN_SANPHAM %></h3>
                <p class="price"><%= listSS[i].GIA %></p>
            </div>
            <% } %>
        </div>
    </section>

    <section id="REALMI" class="promotion-section bg-purple-200">
        <h2>Realmi</h2>
        <div class="product-grid">
            <% for (int i = 1; i < listRM.Count; i++)
               { %>
            <div class="product-item">
                <a href='<%="products.aspx?IdSanPham="+ listRM[i].ID_SANPHAM.ToString() %>'>
                    <img alt="<%= listRM[i].TEN_SANPHAM %>" src="<%= listRM[i].ANH %>"
                        width="200" height="300" />
                </a>
                <h3><%= listRM[i].TEN_SANPHAM %></h3>
                <p class="price"><%= listRM[i].GIA %></p>
            </div>
            <% } %>
        </div>
    </section>

    <section id="VIVO" class="promotion-section bg-purple-200">
        <h2>Vivo</h2>
        <div class="product-grid">
            <% for (int i = 1; i < listVV.Count; i++)
               { %>
            <div class="product-item">
                <a href='<%="products.aspx?IdSanPham="+ listVV[i].ID_SANPHAM.ToString() %>'>
                    <img alt="<%= listVV[i].TEN_SANPHAM %>" src="<%= listVV[i].ANH %>"
                        width="200" height="300" />
                </a>
                <h3><%= listVV[i].TEN_SANPHAM %></h3>
                <p class="price"><%= listVV[i].GIA %></p>
            </div>
            <% } %>
        </div>
    </section>

    <section id="XIAOMI" class="promotion-section bg-purple-200">
        <h2>Xiaomi</h2>
        <div class="product-grid">
            <% for (int i = 1; i < listXM.Count; i++)
               { %>
            <div class="product-item">
                <a href='<%="products.aspx?IdSanPham="+ listXM[i].ID_SANPHAM.ToString() %>'>
                    <img alt="<%= listXM[i].TEN_SANPHAM %>" src="<%= listXM[i].ANH %>"
                        width="200" height="300" />
                </a>
                <h3><%= listXM[i].TEN_SANPHAM %></h3>
                <p class="price"><%= listXM[i].GIA %></p>
            </div>
            <% } %>
        </div>
    </section>

    <section id="KHÁC" class="promotion-section bg-blue-200">
        <h2>CÁC SẢN PHẨM KHÁC</h2>
        <div class="product-grid">
            <% for (int i = 1; i < listSPKH.Count; i++)
               { %>
            <div class="product-item">
                <a href='<%="products.aspx?IdSanPham="+ listSPKH[i].ID_SANPHAM.ToString() %>'>
                    <img alt="<%= listSPKH[i].TEN_SANPHAM %>" src="<%= listSPKH[i].ANH %>"
                        width="200" height="300" />
                </a>
                <h3><%= listSPKH[i].TEN_SANPHAM %></h3>
                <p class="price"><%= listSPKH[i].GIA %></p>
            </div>
            <% } %>
        </div>
    </section>
