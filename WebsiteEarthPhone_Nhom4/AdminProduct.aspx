<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminProduct.aspx.cs" Inherits="WebsiteEarthPhone_Nhom4.AdminProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Earth Phone Store - Admin</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
    <style>
        /* Styles for the layout - Customize as needed */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .header {
            text-align: center;
            background-color: #001F3F; /* Header Background Color */
            color: white; /* Header Text Color */
            padding: 20px 0;
        }

            .header img {
                width: 300px;
                vertical-align: middle;
            }

        .sidebar {
            width: 180px;
            background-color: #F0F0F0;
            padding: 20px;
            float: left;
            height: 100%;
            border-radius: 5px;
        }

            .sidebar h2 {
                font-size: 18px;
                margin: 0 0 20px 0;
            }

            .sidebar ul {
                list-style-type: none;
                padding: 0;
            }

                .sidebar ul li {
                    margin: 10px 0;
                }

                    .sidebar ul li a {
                        text-decoration: none;
                        color: #333;
                        font-size: 16px;
                    }

        .content {
            margin-left: 220px;
            padding: 20px;
            background-color: #F8F8F8;
            margin-top: 10px;
            border-radius: 5px;
        }

            .content h2 {
                font-size: 24px;
                margin-bottom: 20px;
            }

        .table-container {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table,
        th,
        td {
            border: 1px solid #ddd;
        }

        th,
        td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #F0F0F0;
        }

        .action-links a {
            text-decoration: none;
            color: #007BFF;
            margin-right: 10px;
        }

        /* Styles for the DataGrid */
        .aspNetDisabled {
            background-color: #ddd; /* Disabled row color */
        }

        .aspNetHover {
            background-color: #e0e0e0; /* Hover row color */
        }

        .aspNetSelected {
            background-color: #ccc; /* Selected row color */
        }

        .sty {
            background-color: #4CAF50; /* Button color */
            color: white; /* Button text color */
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

            .sty:hover {
                background-color: #45a049; /* Button hover color */
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <img alt="Earth Phone Store Logo" src="img/logo/STORE.png" width="200" />
        </div>
        <div class="sidebar" style="background-color: white;">
            <h2>LIST OF PRODUCTS</h2>
            <h2>LIST CATEGORY</h2>
        </div>
        <div class="content" style="background-color: #F8F8F8; margin-left: 230px;">
            <h2>ALL PRODUCTS</h2>
            <div class="table-container">
                <asp:DataGrid ID="girdSanPham" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="5"
                    PagerStyle-Mode="NumericPages" DataKeyField="ID_SANPHAM" OnItemCommand="girdSanPham_ItemCommand" OnPageIndexChanged="girdSanPham_PageIndexChanged">
                    <Columns>
                        <asp:TemplateColumn HeaderText="ID">
                            <ItemTemplate>
                                <h3><%#Eval("ID_SANPHAM") %></h3>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Name">
                            <ItemTemplate>
                                <h3><%#Eval("TEN_SANPHAM") %></h3>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Photo">
                            <ItemTemplate>
                                <img src='<%#Eval("ANH") %>' width="100" height="100" alt="hinhanh" />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="linkDelete" CssClass="sty" runat="server" Text="Xoá" Width="100"
                                    CommandName="GetDelete"
                                    OnClientClick="return confirm('Bạn Muốn Xóa Sản Phẩm Này Đúng Không ?')"></asp:LinkButton>
                                <asp:LinkButton ID="linkUpdata" runat="server" Text="Cập Nhật" Width="100"
                                    CommandName="GetUpdate"
                                    >
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid>
            </div>
        </div>
    </form>
</body>
</html>
