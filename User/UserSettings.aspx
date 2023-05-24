<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="UserSettings.aspx.cs" Inherits="CountryRoads.User.WebForm8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #countryList {
            width: 100%;
            height: 250px;
            overflow: auto;
            overflow-anchor: none;
            box-sizing: content-box;
        }

            #countryList li {
                margin: 1rem;
                padding: 0 1rem;
                width: 150px;
                border-radius: 8px;
                transition: all 300ms ease;
            }

                #countryList li:hover {
                    transform: scale(1.05);
                    background-color: rgba(0,0,0,0.1)
                }

        #countryListBody .nav-link.active {
            background-color: grey
        }

        .bg-body-tertiary {
            background-color: rgb(32, 64, 104) !important;
            height: max-content;
        }

        #profile .nav-item {
            padding: 0 1rem;
            border-radius: 8px;
        }

            #profile .nav-item a {
                color: white !important;
                transition: all 300ms ease;
            }

            #profile .nav-item .active {
                background-color: royalblue !important;
            }

            #profile .nav-item a:hover:not(.active) {
                transform: scale(1.05);
                background-color: rgba(65,105,225, 0.5);
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="profileBody" class="container-fluid">
        <div class="row">

            <div class="col-2 ps-0">

                <div class="d-flex flex-column bg-body-tertiary sidebar vh-100">
                    <div class="mt-3 mb-2">
                        <h1 class="mt-2 mb-0 ps-4 text-white">Profile</h1>
                        <hr />
                    </div>
                    <ul id="profile" class="nav nav-pills flex-column mb-auto">

                        <li class="nav-item my-2 px-4 text-white">
                            <a href="UserProfile.aspx" class="nav-link link-body-emphasis profileList">Dashboard</a>
                        </li>
                        <li class="nav-item my-2 px-4 text-white">
                            <a href="UserSettings.aspx" class="nav-link link-body-emphasis profileList">Settings</a>
                        </li>
                    </ul>
                </div>
            </div>

            <section id="Dashboard" class="col-10 z-3 mt-4">
                <div class="row mt-3">
                    <div class="card">
                        <div class="card-body">
                            <h2 class="d-inline-block">Settings</h2>
                            <div class="float-end">
                                <i class="bi bi-gear"></i>
                            </div>
                            <div class ="pt-4 pb-4">
                                <label for="currentPass" class="fs-6 form-label text-start">Current Password:</label>
                                <asp:TextBox type="password" class="form-control fst-italic" ID="currentPass" placeholder="Enter your current password here" runat="server"></asp:TextBox>
                                <asp:Label ID="curPassErrorMsg" class="text text-danger" runat="server" Text=""></asp:Label>
                            </div>
                            <div class ="pt-4 pb-4">
                                <label for="newPass" class="fs-6 form-label text-start">New Password:</label>
                                <asp:TextBox type="password" class="form-control fst-italic" ID="newPass" placeholder="Enter your new password here" runat="server"></asp:TextBox>
                            </div>
                            <div class ="pt-4 pb-4">
                                <label for="confirmPass" class="fs-6 form-label text-start">Confirm Password:</label>
                                <asp:TextBox type="password" class="form-control fst-italic" ID="confirmNewPass" placeholder="Enter your confirm password here" runat="server"></asp:TextBox>
                            </div>

                            <div style="color: red;">
                                <asp:Label ID="errorMessage" class="text text-danger" runat="server" Text=""></asp:Label>
                                <br />
                                <div class="alert alert-danger" role="alert">
                                  * WARNING: Updating password will require you to login again.
                                </div>
                            </div>

                            <div class="pt-4 pb-4 text-center">
                                <asp:Button ID="updateBtn" type="submit" class="btn btn-primary" runat="server" Text="Update" OnClick="Update_Click"/>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
    <script>
    </script>
</asp:Content>
