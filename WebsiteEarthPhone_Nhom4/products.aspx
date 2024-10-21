<%@ Page Title="" Language="C#" MasterPageFile="~/formheaderfooter.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="WebsiteEarthPhone_Nhom4.WebForm2" %>
<%@ Register src="products.ascx" tagname="products" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:products ID="products1" runat="server" />
</asp:Content>
