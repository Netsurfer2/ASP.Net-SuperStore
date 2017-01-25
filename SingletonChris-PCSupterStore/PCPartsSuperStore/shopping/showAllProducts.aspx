<%@ Page Title="Available Products" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="showAllProducts.aspx.cs" Inherits="PCPartsSuperStore.shopping.showAllProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpd_Main" runat="server">
    <asp:HyperLink ID="UpdateUserInfo" Cssclass="UpdateUserInfoAP" runat="server" Target="_blank" NavigateUrl="~/userManagement/UpdateUserLogIn.aspx" >Update Log-In</asp:HyperLink> 
        <form id="formSAP" class="formSAP" method="post" runat="server" defaultfocus="prodName" >
            <!-- Display objects for input/output -->
            <fieldset id="fieldsetSAP" class="fieldsetSAP">
                <legend id="legendSAP" class="legendSAP">Add Products to Shopping Cart</legend>
                    <!-- Show the table content -->
                    <div class="div_products" runat="server">
                        <asp:Label ID="div_products" Cssclass="ResultTextStyleSAP" runat="server" ></asp:Label><br />
                    </div>
                    <asp:Table runat="server" ID="tbl_Products">
                        <asp:TableRow>
                            <asp:TableCell CssClass="headCells">Product</asp:TableCell>
                            <asp:TableCell CssClass="headCellDesc">Description</asp:TableCell>
                            <asp:TableCell CssClass="headCells">Price</asp:TableCell>
                            <asp:TableCell CssClass="headCellBuyIt">Buy it</asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </fieldset>
        </form>
</asp:Content>
