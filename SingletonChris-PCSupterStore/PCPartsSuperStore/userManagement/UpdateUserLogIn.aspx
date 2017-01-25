<%@ Page Title="Update Log-In" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="UpdateUserLogIn.aspx.cs" Inherits="PCPartsSuperStore.userManagement.UpdateUserLogIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpd_Main" runat="server">
    <form id="formUULI" class="form" method="post" action="SecondPage.aspx" runat="server" defaultfocus="txbUpD_FName">
        <!-- Display objects for input/output -->
        <asp:Label ID="lbl_Directions" Cssclass="LabelStyleUULI" runat="server" >Please put in a new "User Name" and "Email":</asp:Label><br />
        <fieldset ID="fieldsetUULI">
            <legend id="legendUULI" class="legendUULI">Update Log-In Information</legend>
                <!-- flexbox both the textbox and labels together side by side -->
                <div class="flexTBoxesWrapper">
                    <div class="flexText">
                        <asp:Label ID="lbl1_FName" Cssclass="LabelStyleUULI" runat="server" >First Name:</asp:Label><br />
                        <asp:Label ID="lbl1_LName" Cssclass="LabelStyleUULI" runat="server" >Last Name:</asp:Label><br />
                        <asp:Label ID="lbl1_UserName" Cssclass="LabelStyleUULI" runat="server" >User Name:</asp:Label><br />
                        <asp:Label ID="lbl1_Password" Cssclass="LabelStyleUULI" runat="server" >Password:</asp:Label><br />
                        <asp:Label ID="lbl1_Address" Cssclass="LabelStyleUULI" runat="server" >Address:</asp:Label><br />
                        <asp:Label ID="lbl1_Email" Cssclass="LabelStyleUULI" runat="server" >Email:</asp:Label><br />
                        <asp:Label ID="lbl1_PhoneNumber" Cssclass="LabelStyleUULI" runat="server" >Phone Number:</asp:Label>
                    </div>
                    <!-- Allow user input into the textboxes -->
                    <div class="flexTextBoxes">
                        <div id="FName">
                            <asp:TextBox ID="txbUpD_FName" Cssclass="BoxStyleUULI" placeholder="First Name" runat ="server" required ="required" ></asp:TextBox><br />
                        </div>
                        <div id="LName">
                            <asp:TextBox ID="txbUpD_LName" Cssclass="BoxStyleUULI" placeholder="Last Name" runat ="server" required ="required" ></asp:TextBox><br />
                        </div>
                        <div id="UName">
                            <asp:TextBox ID="txbUpD_UserName" Cssclass="BoxStyleUULI" placeholder="User Name" runat ="server" required ="required" ></asp:TextBox><br />
                        </div>
                        <div id="Pword">
                            <asp:TextBox ID="txbUpD_Password" Cssclass="BoxStyleUULI" placeholder="Password" runat ="server" required ="true" ></asp:TextBox><br />
                        </div>
                        <div id="Address">
                            <asp:TextBox ID="txbUpD_Address" Cssclass="BoxStyleUULI" placeholder="Address" runat ="server" required ="required" ></asp:TextBox><br />
                        </div>
                        <div id="Email">
                            <asp:TextBox ID="txbUpD_Email" Csstype="email" Cssclass="BoxStyleUULI" placeholder="Email" runat ="server" required ="required" ></asp:TextBox><br />
                        </div>
                        <div id="PNumber">
                            <asp:TextBox ID="txbUpD_PhoneNumber" Cssclass="BoxStyleUULI" placeholder="Phone Number" runat ="server" required ="required" ></asp:TextBox>
                        </div>
                    </div>
                </div>
            <!-- User submits the input to the next page -->
            <asp:Button ID="submitButton" Cssclass="submitButton" runat="server" Text ="Submit" OnClientClick="form.target ='_blank';" PostBackUrl="~/userManagement/UserUpdatedShowInfo.aspx" />
        </fieldset>
    </form>
</asp:Content>
