<%@ Page Title="Updated Log-In Info" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="UserUpdatedShowInfo.aspx.cs" Inherits="PCPartsSuperStore.userManagement.UserUpdatedShowInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpd_Main" runat="server">
    <form id="formUUSI" class="form" runat="server">
        <fieldset id="fieldset1UUSI" class="fieldset1UUSI">
            <legend id="legend1UUSI" class="legendUUSI">Show Updated Log-In Information</legend>
                <!-- Labels to display the hard coded text using flexbox side by side again -->
                <div class="flexLabelsWrapper">
                    <div class="flexTextLabels">
                        <asp:Label ID="lbl2_FName" CSSclass="TextLabelsUUSI" runat="server" >First Name:</asp:Label><br />
                        <asp:Label ID="lbl2_LName" CSSclass="TextLabelsUUSI" runat="server" >Last Name:</asp:Label><br />
                        <asp:Label ID="lbl2_UserName" CSSclass="TextLabelsUUSI" runat="server" >User Name:</asp:Label><br />
                        <asp:Label ID="lbl2_Password" CSSclass="TextLabelsUUSI" runat="server" >Password:</asp:Label><br />
                        <asp:Label ID="lbl2_Address" CSSclass="TextLabelsUUSI" runat="server" >Address:</asp:Label><br />
                        <asp:Label ID="lbl2_Email" CSSclass="TextLabelsUUSI" runat="server" >Email:</asp:Label><br />
                        <asp:Label ID="lbl2_PhoneNumber" CSSclass="TextLabelsUUSI" runat="server" >Phone Number:</asp:Label>
                    </div>
                    <!-- Use label ID to display the information being passed, Display in the label -->
                    <div class="flexPassedText">
                        <asp:Label ID="lbl_fName" Cssclass="ResultTextStyleUUSI" runat="server" ></asp:Label><br />
                        <asp:Label ID="lbl_LName" Cssclass="ResultTextStyleUUSI" runat="server" ></asp:Label><br />
                        <asp:Label ID="lbl_UserName" Cssclass="ResultTextStyleUUSI" runat="server" ></asp:Label><br />
                        <asp:Label ID="lbl_Password" Cssclass="ResultTextStyleUUSI" runat="server" ></asp:Label><br />
                        <asp:Label ID="lbl_Address" Cssclass="ResultTextStyleUUSI" runat="server" ></asp:Label><br />
                        <asp:Label ID="lbl_Email" Cssclass="ResultTextStyleUUSI" runat="server" ></asp:Label><br />
                        <asp:Label ID="lbl_PhoneNumber" Cssclass="ResultTextStyleUUSI" runat="server" ></asp:Label><br />
                    </div>
                </div>
        </fieldset>
        <fieldset id="fieldset2UUSI" class="fieldset2UUSI">
            <legend id="legend2UUSI" class="legendUUSI">Capture Row ID</legend>
                <asp:Label ID="lbl_Identity" Cssclass="ResultTextStyleUUSI" runat="server" ></asp:Label><br />
        </fieldset>       
    </form>
</asp:Content>
