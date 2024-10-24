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
                    <img src='<%= ifDienThoai.ANH %>' alt="Samsung Galaxy" class="thumbnail-active" id="main-product-image" />
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
                <p>
                    Thiết kế Galaxy S22 Ultra được thừa hưởng từ dòng 'Galaxy Note'
                    Có thể nói Galaxy S22 Series là một trong những dòng sản phẩm bị lộ nhiều nhất của Samsung vì gần
                    như
                    chúng ta đã thấy được toàn bộ thông số phần cứng như thiết kế của máy trước khi máy được ra mắt tại
                    sự
                    kiện Unpacked 2022. Thế nhưng sức nóng của bộ 3 sản phẩm mới của thương hiệu kim chi vẫn chưa hết
                    hot,
                    hãy như sự chú ý của những người yêu thích điện thoại Samsung trong thời gian qua đều đổ dồn về
                    Galaxy
                    S22 Ultra khi đây là một sản phẩm có thiết kế hoàn toàn khác so với Galaxy S20 Ultra và Galaxy S21
                    Ultra
                    trước đây.
               
                </p>
                <img src="https://storage.googleapis.com/a1aa/image/KoOYQBFdSdbLOp9B6e4Y1OX4qNZIxWVWQKrEeT7mscWDVxjTA.jpg"
                    alt="Three Samsung Galaxy S22 phones in different colors" />
                <p>
                    Mặt khác, trong cái lạ cũng có cái quen khi Galaxy S22 Ultra giờ đây có lẽ chính là sự
                    hợp thể của dòng Galaxy S và Galaxy Note mà mọi người vẫn luôn mong đợi từ bấy lâu nay. Nhắc đến
                    dòng
                    Galaxy Note của Samsung thì đặc điểm giúp mọi người nhận diện chính là thiết kế vuông vức cùng bút
                    S Pen được đặt trong thân máy, và cả hai đặc điểm này đều hiện diện trên Galaxy S22 Ultra mới nhất
                    của chúng t
           
            </div>
            <!-- Thông số -->
            <div class="product-specs">
                <h2>Thông số kỹ thuật <%=ifDienThoai.TEN_SANPHAM %></h2>
                <table>
                    <tr>
                        <td>Thân Máy</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Kích Thước</td>
                        <td>163.3 x 77.9 x 8.9 mm</td>
                    </tr>
                    <tr>
                        <td>Khối Lượng</td>
                        <td>228 g / 229 g (mmWave)</td>
                    </tr>
                    <tr>
                        <td>SIM</td>
                        <td>Dual SIM (Nano-SIM)</td>
                    </tr>
                    <tr>
                        <td>Màn hình</td>
                        <td>Dynamic AMOLED 2X</td>
                    </tr>
                    <tr>
                        <td>Hệ điều hành</td>
                        <td>Android 12, One UI 4.1</td>
                    </tr>
                </table>
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
