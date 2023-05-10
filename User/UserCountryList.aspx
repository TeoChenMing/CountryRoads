<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="UserCountryList.aspx.cs" Inherits="CountryRoads.User.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #countryList {
            width: 50%;
            height: 800px;
            box-sizing: content-box;
        }

            #countryList li {
                margin: 1rem;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">

            <div class="col-2 ps-0">

                <div class="d-flex flex-column flex-shrink-0 p-3 bg-body-tertiary sidebar vh-100">

                    <ul class="nav nav-pills flex-column mb-auto mt-5">

                        <li class="nav-item">
                            <asp:button ID="">
                        </li>
                        <li>
                            <a href="AdminManageUsers" class="nav-link link-body-emphasis">
                                <i class="bi bi-people"></i>
                                Users
                            </a>
                        </li>
                        <li>
                            <a href="AdminManageContent" class="nav-link link-body-emphasis">
                                <i class="bi bi-clipboard"></i>
                                Content
                            </a>
                        </li>
                        <li>
                            <a href="#" class="nav-link link-body-emphasis">
                                <i class="bi bi-question-square"></i>
                                Question
                            </a>
                        </li>
                        <li>
                            <a href="AdminEnquiry" class="nav-link link-body-emphasis">
                                <i class="bi bi-megaphone"></i>
                                Enquiries
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

            <section id="content" class="col-10 z-3" style="margin-top: 80px;">

                <div class="content">

                    <div class="col-md-12 flex-wrap flex-row flex-wrap justify-start items-start">
                        <ul id="countryList" class="d-flex flex-wrap list-unstyled flex-column">
                            <li>Test 0</li>
                            <li>Test 1</li>
                            <li>Test 2</li>
                            <li>Test 3</li>
                            <li>Test 4</li>
                            <li>Test 5</li>
                            <li>Test 6</li>
                            <li>Test 7</li>
                            <li>Test 8</li>
                            <li>Test 9</li>
                        </ul>
                    </div>

                </div>

            </section>

            <div class="p-3 z-n1 fixed-top bg-body-tertiary">
                <div class="container-fluid">
                    <div class=""></div>
                    <div class="float-end pe-4 fs-4">
                        <i class="bi bi-person-circle"></i><% =Session["userName"] %>
                    </div>
                </div>
            </div>

        </div>

    </div>
    <div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
</asp:Content>
