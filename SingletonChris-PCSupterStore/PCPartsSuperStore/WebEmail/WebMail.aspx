<%@ Page Title="Email Customer" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="WebMail.aspx.cs" Inherits="PCPartsSuperStore.WebEmail.WebMail1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpd_Main" runat="server">
    <form id="formWebMail" class="formWebMail" method="post" runat="server" defaultfocus="prodName" >
        <fieldset class="WebMailHeader">
            <legend class="legendWM">Please check your email:</legend>
            <!-- Wrap the labels together -->
            <div class="flexLabelsWrapper">
                <div id="lbl_Email"> 
                    <asp:Label ID="lbl_WMText" CSSclass="lbl_WMText" runat="server" >Email Address:</asp:Label>
                </div>
                <div id="EmailAddress" class="EmailAddress" runat="server">
                    <asp:Label ID="lbl_WMAddress" CSSclass="WMAddress" runat="server" ></asp:Label>
                </div>
            </div>
        </fieldset>
        <!-- Display objects for input/output -->
        <fieldset class="fieldsetWebMail">
            <legend id="legendWM" class="legendWM">Your reciept has been sent.</legend>
                <!-- Show the Thank You Message in the div. -->
                <div id="div_purchase" runat="server">
                </div>
        </fieldset>
    </form>
</asp:Content>
