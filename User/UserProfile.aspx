<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="CountryRoads.User.WebForm7" %>

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

    <%@ Import Namespace="System.Data" %>
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
                            <a href="#" class="nav-link link-body-emphasis profileList">Dashboard</a>
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
                            <h2 class="d-inline-block">Bookmarks</h2>
                            <div class="float-end">
                                <i class="bi bi-bookmarks"></i>
                            </div>
                        </div>
                        <div class="d-inline-block">
                            <ul id="countryList" class="d-flex flex-wrap list-unstyled flex-column">
                                <% if (dt != null)
                                    {
                                        foreach (DataRow row in dt.Rows)
                                        {
                                %>

                                <li>
                                    <a href="#" class="countryList" style="text-decoration: none; color: dimgrey" id="<% =row["countryId"] %>"><% =row["countryName"] %></a>
                                </li>

                                <%
                                        }
                                    }
                                %>
                            </ul>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <h2 class="d-inline-block">Country You had Viewed:</h2>


                            <div class="float-end">
                                <i class="bi bi-globe"></i>
                            </div>
                        </div>
                        <div class="d-inline-block">
                            <ul id="countryList" class="d-flex flex-wrap list-unstyled flex-column">
                                <% if (dtable != null)
                                    {
                                        foreach (DataRow row in dtable.Rows)
                                        {
                                %>

                                <li>
                                    <a href="#" class="countryList" style="text-decoration: none; color: dimgrey" id="<% =row["countryId"] %>"><% = row["countryName"] %></a>
                                </li>

                                <%
                                        }
                                    }
                                %>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
    <%--Hidden elements goes here--%>
    <div hidden>
        <asp:HiddenField ID="SelectedContinent" runat="server" Value="Africa" OnValueChanged="SelectedContinent_ValueChanged" />
        <asp:HiddenField ID="SelectedCountry" runat="server" Value="" OnValueChanged="SelectedCountry_ValueChanged" />
        <asp:Button ID="FilterCountries" runat="server" OnClick="FilterCountries_Click" />
        <asp:Button ID="CountryDetailsButton" runat="server" OnClick="CountryDetailsButton_Click" />
    </div>
    <%--Hidden elements goes here--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
    <script>
        document.querySelectorAll(".profileList").forEach(e => {
            var selectedContinent = document.getElementById("<%=SelectedContinent.ClientID%>").value

            if (e.textContent == selectedContinent) {
                e.classList.add("active");
            } else {
                e.classList.remove("active");
            }


            e.addEventListener("click", function () {

                document.getElementById("<%=SelectedContinent.ClientID%>").value = e.textContent;

                var clickButton = document.getElementById("<%= FilterCountries.ClientID %>");
                clickButton.click();
            })
        })

        document.querySelectorAll(".countryList").forEach(e => {
            e.parentElement.addEventListener("click", function () {
                document.getElementById("<% =SelectedCountry.ClientID %>").value = e.id;

                var clickButton = document.getElementById("<%= CountryDetailsButton.ClientID %>");
                clickButton.click();
            })
        })
    </script>
</asp:Content>
