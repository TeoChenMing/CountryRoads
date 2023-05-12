<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="CountryRoads.User.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-color: rgba(41,59,81,255);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mt-2" style="margin: 0 10%">
        <div class="container-fluid">
            <div class="row justify-content-center my-5">
                <div class="col-6">
                    <div class="card px-5 m-3 text-center">
                        <h3 class="py-5">Glad to have you back!</h3>

                        <div class="pb-3 mt-5 text-start">
                            <label for="username" class="text-center fs-4 form-label">Username:</label>
                            <asp:TextBox type="text" class="form-control" ID="usernameInput" runat="server"></asp:TextBox>
                        </div>

                        <div class="pb-3 text-start">
                            <label for="password" class="text-center fs-4 form-label">Password:</label>
                            <asp:TextBox type="password" class="form-control" ID="passwordInput" runat="server"></asp:TextBox>
                        </div>

                        <div class="pb-3 text-start">
                            <asp:Label ID="ErrorMsg" class="text text-danger" runat="server" Text=""></asp:Label>
                        </div>

                        <div class="pb-5">
                            <asp:Button ID="loginBtn" type="submit" class="btn btn-primary mt-4" runat="server" Text="Login" OnClick="Login_Click" />
                        </div>

                        <div class="pb-5">
                            <a id="registration" href="UserRegister.aspx">Not a member yet? Register for a free account!</a>
                        </div>
                    </div>

                </div>
                <div class="col-6 d-flex">
                    <img style="width: 100%" class="my-auto imgFlags" src="../Assets/Images/loginGlobe.gif" alt="Flags" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
</asp:Content>
