<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="UserCountryDetails.aspx.cs" Inherits="CountryRoads.User.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        label {
            font-size: larger;
            font-weight: bold;
        }

        span {
            font-size: larger;
        }

        .flag {
            width: 100%;
            margin: auto;
            border: solid 2px black;
            padding: 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mt-2" style="margin: 0 10%">
        <div>
            <div class="mt-5 d-flex">
                <h1 runat="server" class="col-6" id="CountryName"></h1>
                <asp:Label class="col-6 my-auto text-end" ID="CountryTime" runat="server" Text=""></asp:Label>
            </div>
            <hr />
            <div class="row my-5">
                <div class="col-6">
                    <asp:Image class="flag" ID="CountryFlag" runat="server" />
                </div>
                <div class="col-6 px-5">
                    <h2 class="text-center mb-5">Did you know?</h2>
                    <ul class="list-group">
                        <li class="list-group-item">
                            <asp:Label ID="factCapital" runat="server" Text="Label"></asp:Label>
                        </li>
                        <li class="list-group-item">
                            <asp:Label ID="factSize" runat="server" Text="Label"></asp:Label>
                        </li>
                        <li class="list-group-item">
                            <asp:Label ID="factPopulation" runat="server" Text="Label"></asp:Label>
                        </li>
                        <li class="list-group-item">
                            <asp:Label ID="factLanguage" runat="server" Text="Label"></asp:Label>
                        </li>
                    </ul>
                </div>
            </div>

            <h2 class="mt-5">Country Details</h2>
            <div class="row my-5">
                <div class="col-6">
                    <%--Capital--%>
                    <div class="row" style="margin: 2% 0">
                        <div class="col-4">
                            <label>Capital: </label>
                        </div>
                        <div class="col-8">
                            <asp:Label class="form-control" ID="CountryCapital" runat="server" Text=""></asp:Label>
                        </div>
                    </div>

                    <%--Area--%>
                    <div class="row" style="margin: 2% 0">
                        <div class="col-4">
                            <label>Area Size: </label>
                        </div>
                        <div class="col-8">
                            <asp:Label class="form-control" ID="CountryArea" runat="server" Text=""></asp:Label>
                        </div>
                    </div>

                    <%--Population--%>
                    <div class="row" style="margin: 2% 0">
                        <div class="col-4">
                            <label>Population: </label>
                        </div>
                        <div class="col-8">
                            <asp:Label class="form-control" ID="CountryPopulation" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <%--Languages--%>
                    <div class="row" style="margin: 2% 0">
                        <div class="col-4">
                            <label>Languages used: </label>
                        </div>
                        <div class="col-8">
                            <asp:Label class="form-control" ID="CountryLanguages" runat="server" Text=""></asp:Label>
                        </div>
                    </div>

                    <%--Currency--%>
                    <div class="row" style="margin: 2% 0">
                        <div class="col-4">
                            <label>Currency Used: </label>
                        </div>
                        <div class="col-8">
                            <asp:Label class="form-control" ID="CountryCurrency" runat="server" Text=""></asp:Label>
                        </div>
                    </div>

                    <%--TimeZone--%>
                    <div class="row" style="margin: 2% 0">
                        <div class="col-4">
                            <label>Time Zone: </label>
                        </div>
                        <div class="col-8">
                            <asp:Label class="form-control" ID="CountryTimeZone" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
</asp:Content>
