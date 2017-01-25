<%@ Page Title="Create Products" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="newProduct.aspx.cs" Inherits="PCPartsSuperStore.productManagement.newProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpd_Main" runat="server">
        <asp:HyperLink ID="UpdateUserInfo" Cssclass="UpdateUserInfoNP" runat="server" Target="_blank" NavigateUrl="~/userManagement/UpdateUserLogIn.aspx" >Update Log-In</asp:HyperLink> 
        <form id="formNP" class="form" method="post" runat="server" defaultfocus="txb_prodName" >
        <!-- Display objects for input/output -->
        <fieldset id="fieldset1NP" class="fieldset1NP">
            <legend id="legendNP" class="legendNP">Create New Product</legend>
                <!-- flexbox both the textbox and labels together side by side -->
                <div class="flexTBoxesWrapper">
                    <div class="flexText">
                        <asp:Label ID="lbl1_prodName" Cssclass="LabelStyleNP" runat="server" >Product Name:</asp:Label><br />
                        <asp:Label ID="lbl1_prodDesc" Cssclass="LabelStyleNP" runat="server" >Product Description:</asp:Label><br />
                        <asp:Label ID="lbl1_prodPrice" Cssclass="LabelStyleNP" runat="server" >Product Price:</asp:Label><br />
                        <asp:Label ID="lbl1_prodAmount" Cssclass="LabelStyleNP" runat="server" >Product Amount:</asp:Label>
                    </div>
                    <!-- Allow user input into the textboxes and validate as needed. -->
                    <div class="flexTextBoxes">
                        <div id="pName">
                            <asp:TextBox ID="txb_prodName" Cssclass="BoxStyleNP" placeholder="Product Name" runat ="server" required ="required" ></asp:TextBox><br />
                        </div>
                        <div id="pDesc">
                            <asp:TextBox ID="txb_prodDesc" Cssclass="BoxStyleNP" placeholder="Product Description" runat ="server" required ="required" ></asp:TextBox><br />
                        </div>

                        <div id="pPrice">
                            <asp:TextBox ID="txb_prodPrice" Cssclass="BoxStyleNP" placeholder="Product Price" runat ="server" required ="required" ></asp:TextBox>
                            <asp:RegularExpressionValidator runat="server"
                                    ControlToValidate="txb_prodPrice"
                                    ErrorMessage="*Not a valid price!"
                                    ValidationExpression="[+]?([.]\d+|\d+([.]\d+)?)$"
                            ></asp:RegularExpressionValidator>
                        <br />
                        </div>
                        <div id="pAmount">
                            <asp:TextBox ID="txb_prodAmount" Cssclass="BoxStyleNP" placeholder="Product Amount" runat ="server" required ="true" ></asp:TextBox>
                            <asp:RegularExpressionValidator runat="server"
                                    ControlToValidate="txb_prodAmount"
                                    ErrorMessage="*Only positive numbers!"
                                    ValidationExpression="^[1-9]\d*$"
                            ></asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div><br />
                <asp:Label ID="lbl_Identity" Cssclass="ResultTextStyleNP" runat="server" ></asp:Label><br />
            <!-- User submits the input to the next page -->
            <asp:Button ID="submitButton" Cssclass="submitButton" runat="server" Text ="Submit" OnClick="submitButton_Click" PostBackUrl="~/productManagement/newProduct.aspx"/>
        </fieldset>
    </form>
</asp:Content>
