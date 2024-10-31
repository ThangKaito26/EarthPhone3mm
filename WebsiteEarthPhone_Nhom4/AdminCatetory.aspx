<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminCatetory.aspx.cs" Inherits="WebsiteEarthPhone_Nhom4.AdminCatetory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Catetory Earth Phone
    </title>
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

        .sidebar {<a href="AdminProduct.aspx">AdminProduct.aspx</a>
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
            padding: 10px ;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration:none;
        }

        .sty:hover {
            background-color: #45a049; /* Button hover color */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <a href="Home.aspx"><img alt="Earth Phone Store Logo" src="img/logo/STORE.png" width="200" /></a>
        </div>
        <div class="sidebar" style="background-color: white;">
            <a style="text-decoration:none" href="AdminProduct.aspx"><h2>LIST OF PRODUCTS
            </h2></a>
            <a style="text-decoration:none" href="AdminCatetory.aspx"><h2>LIST CATEGORY
            </h2></a>
        </div>
        <div class="content">
            <asp:DataGrid ID="girdDanhMuc" runat="server" AutoGenerateColumns="false" PageSize="5" DataKeyField="ID_DANHMUC" OnItemCommand="girdDanhMuc_ItemCommand" OnPageIndexChanged="girdDanhMuc_PageIndexChanged"  >
                <Columns>
                    <asp:TemplateColumn HeaderText="ID Danh Muc">
                        <ItemTemplate>
                            <h3><%#Eval("ID_DANHMUC") %></h3>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                            
                    <asp:TemplateColumn HeaderText="Ten Danh Muc">
                        <ItemTemplate>
                            <h3><%#Eval("TEN_DANHMUC") %></h3>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                             
                    <asp:TemplateColumn HeaderText="Hien Thi">
                        <ItemTemplate>
                            <h3><%#Eval("HIENTHI") %></h3>
                        </ItemTemplate>
                    </asp:TemplateColumn>

                    <asp:TemplateColumn HeaderText="Hanh Dong">
                        <ItemTemplate>
                            <asp:LinkButton ID="linkDeleteDM" CssClass="sty" runat="server" Text="Xoá" Width="50"
                                    CommandName="GetDeleteDM"
                                    OnClientClick="return confirm('Bạn Muốn Xóa Danh Muc Này Đúng Không ?')"></asp:LinkButton>
                                <asp:LinkButton ID="linkUpdataDM" CssClass="sty" runat="server" Text="Cập Nhật" Width="70"
                                    CommandName="GetUpdateDM"
                                    OnClientClick="return confirm('Bạn Muốn Cập Nhật Danh Muc Này Đúng Không ?')">
                                </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                </Columns>
            </asp:DataGrid>
        </div>
    </form>
</body>
</html>
