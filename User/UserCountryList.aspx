<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="UserCountryList.aspx.cs" Inherits="CountryRoads.User.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #countryList {
            width: 50%;
            height: 600px;
            box-sizing: content-box;
        }

            #countryList li {
                margin: 1rem;
                width: 150px;
            }

        #countryListBody {
            max-height: 100vh;
        }

            #countryListBody .nav-link.active {
                background-color: grey
            }
    </style>
    <%@ Import Namespace="System.Data" %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="countryListBody" class="container-fluid">
        <div class="row">

            <div class="col-2 ps-0">

                <div class="d-flex flex-column bg-body-tertiary sidebar vh-100">

                    <ul class="nav nav-pills flex-column mb-auto">
                        <li class="mt-3 mb-2">
                            <h1 class="mt-2 mb-0 ps-3">Continents</h1>
                            <hr />
                        </li>
                        <li class="nav-item my-2 px-4">
                            <a href="#" class="nav-link link-body-emphasis continentList">Africa</a>
                        </li>
                        <li class="nav-item my-2 px-4">
                            <a href="#" class="nav-link link-body-emphasis continentList">Antarctica</a>
                        </li>
                        <li class="nav-item my-2 px-4">
                            <a href="#" class="nav-link link-body-emphasis continentList">Asia</a>
                        </li>
                        <li class="nav-item my-2 px-4">
                            <a href="#" class="nav-link link-body-emphasis continentList">Europe</a>
                        </li>
                        <li class="nav-item my-2 px-4">
                            <a href="#" class="nav-link link-body-emphasis continentList">North America</a>
                        </li>
                        <li class="nav-item my-2 px-4">
                            <a href="#" class="nav-link link-body-emphasis continentList">Oceania</a>
                        </li>
                        <li class="nav-item my-2 px-4">
                            <a href="#" class="nav-link link-body-emphasis continentList">South America</a>
                        </li>
                    </ul>
                </div>
            </div>

            <section id="content" class="col-10 z-3 mt-4">

                <div class="content">
                    <h1>Countries in <%=SelectedContinent.Value%></h1>
                    <hr />
                    <div class="col-md-12 flex-wrap flex-row flex-wrap justify-start items-start">
                        <ul id="countryList" class="d-flex flex-wrap list-unstyled flex-column">
                            <% if (dt != null)
                                {
                                    foreach (DataRow row in dt.Rows)
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
            </section>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

            <%--Hidden elements goes here--%>
            <div hidden>
                <asp:HiddenField ID="SelectedContinent" runat="server" Value="Africa" />
                <asp:HiddenField ID="SelectedCountry" runat="server" Value="" />
                <asp:Button ID="FilterCountries" runat="server" />
                <asp:Button ID="CountryDetailsButton" runat="server" OnClick="CountryDetailsButton_Click" />
            </div>
            <%--Hidden elements goes here--%>
        
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
    <script>
        document.querySelectorAll(".continentList").forEach(e => {
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
            e.addEventListener("click", function () {

                document.getElementById("<%=SelectedCountry.ClientID%>").value = e.id;

                var clickButton = document.getElementById("<%= CountryDetailsButton.ClientID %>");
                clickButton.click();
            })
        })


    </script>
</asp:Content>
