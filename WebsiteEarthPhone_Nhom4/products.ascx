<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="products.ascx.cs" Inherits="WebsiteEarthPhone_Nhom4.products" %>
<div class="bg-gray-100">
    <!-- Thân trang -->
    <div class="container-content">
        <!-- Tên sản phẩm -->
        <h1 class="product-title">
            <%=ifDienThoai.TEN_SANPHAM %> | Mới Fullbox
        </h1>
        <!-- Nội dung sản phẩm -->
        <div class="product-content">
            <!-- Ảnh và màu sản phẩm -->
            <div class="product-images">
                <div class="main-image">
                    <img src='<%="./img/products/" + ifDienThoai.ANH %>' class="thumbnail-active" id="main-product-image" />
                </div>
            </div>
            <!-- Lựa chọn thanh toán -->
            <div class="product-details">
                <div class="price"><a><%= ifDienThoai.GIA.ToString()%></a></div>
                <div class="prepayment">Liên hệ tư vấn: 0365668204</div>
                <div class="options">
                    <div class="option-label">Dung lượng</div>
                    <div class="capacity-options">
                        <button onclick="changeCapacity('8GB | 128GB')">8GB | 128GB</button>
                        <button onclick="changeCapacity('12GB | 256GB')">12GB | 256GB</button>
                        <button onclick="changeCapacity('12GB | 512GB')">12GB | 512GB</button>
                    </div>
                </div>
                <div class="options">
                    <div class="option-label">Màu sắc</div>
                    <p style="display: inline">Màu cơ bản| </p>
                    <% for (int i = 0; i < Colors.Count; i++)
                       { %>
                    <%= Colors[i].TenMau %>   |  
                    <% } %>
                    <div class="product-thumbnails">
                        <button class="thumbnail-button" onclick="changeImage('<%= ifDienThoai.ANH %>')">
                            <img src='<%= ifDienThoai.ANH %>' alt="Hình sản phẩm chính"
                                data-image-src='<%= ifDienThoai.ANH %>'>
                        </button>
                        <% for (int i = 0; i < Colors.Count; i++)
                           { %>
                        <button class="thumbnail-button" onclick="changeImage('<%= Colors[i].DUONGDANANH %>')">
                            <img src='<%= Colors[i].DUONGDANANH %>' alt='<%= Colors[i].TenMau %>'
                                data-image-src='<%= Colors[i].DUONGDANANH %>'>
                        </button>
                        <% } %>
                    </div>
                </div>
                <div class="purchase-buttons">
                    <button>
                        <a style="text-decoration: none" href='<%="pay.aspx?IdSanPham=" + ifDienThoai.ID_SANPHAM.ToString() %>'>Mua Ngay
                        </a>
                    </button>

                </div>

                <div class="hotline">
                    Hotline đặt mua: <span>0905.988.900</span> ( 8:30 - 21:00 )
               
                </div>
            </div>
        </div>
        <!-- Thông tin sản phẩm -->
        <div class="product-infor">
            <!-- Đánh giá sản phẩm -->
            <div class="product-review">
                <h2>Đánh giá chi tiết <%=ifDienThoai.TEN_SANPHAM %></h2>
                <%=HttpUtility.HtmlDecode(ifDienThoai.ChiTietSanPham) %> <!--DECODE LAY TU CSDL LEN -->
           
            </div>
            <!-- Thông số -->
            <div class="product-specs">
                <h2>Thông số kỹ thuật <%=ifDienThoai.TEN_SANPHAM %></h2>
                <%=HttpUtility.HtmlDecode(ifDienThoai.CAUHINH) %>
            </div>
        </div>
    </div>
    <!-- Javascript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

    <script>
        function changeImage(imageSrc) {
            const mainImage = document.querySelector('.thumbnail-active');
            mainImage.src = imageSrc;
            mainImage.setAttribute('data-image-src', imageSrc);
        }
    </script>
</div>
