<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminPage.Master" AutoEventWireup="true" CodeBehind="AdminManageContent.aspx.cs" Inherits="CountryRoads.Admin.AdminManageContent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    Manage Content
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <h2>Manage Content</h2>

    <div class="container-fluid">
                            
        <table
            class="mw-90"
            data-toggle="table"
            data-search="true"
            
            data-pagination="true"
            
            data-page-list="[10, 25, 50, 100, all]"
            data-side-pagination="client"
                                
            >
            <thead>
                <tr>
                    <th data-field="code">Code</th>
                    <th data-field="name">Name</th>
                    <th data-field="capital">Capital</th>
                    <th data-align="center" data-halign="left" data-field="flag">Flag</th>
                    <th data-field="area">Area</th>
                    <th data-field="population">Population</th>
                    <th data-field="lang">Language</th>
                    <th data-field="currency">Currency</th>
                    <th data-field="timezone">Timezone</th>
                    <th data-field="continent">Continent</th>
                    <th data-align="center" data-halign="left" data-field="action">Action</th>


                    
                </tr>
                                    
            </thead>
            <tbody>
                <%   if (dt != null) { foreach (DataRow row in dt.Rows)  { %>
                    
                    <tr>
                        <td><% =row["countryId"] %></td>
                        <td class="text-nowrap text-truncate" style="max-width: 100px;"><% =row["countryName"] %> </td>
                        <td class="text-nowrap text-truncate" style="max-width: 200px;">
                            <% =row["countryCapital"] %>
             
                        </td>
                        <td><img style="width: 50px; height: 30px;" src="<% =row["countryFlag"] %>" alt="Image"></td>
                        <td><% =row["countryArea"] %></td>
                        <td class="text-nowrap text-truncate" style="max-width:stretch"" 100px;"><% =row["countryPopulation"] %></td>
                        <td class="text-nowrap text-truncate" style="max-width: 200px;"><% =row["countryLanguage"] %></td>
                        <td><% =row["countryCurrency"] %></td>
                        <td class="text-nowrap text-truncate" style="max-width: 150px;"><% =row["countryTimezone"] %></td>
                        <td><% =row["continentCode"] %></td>         
                        <td><a class="editBtn" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal" ><i class="bi bi-pencil-square"></i></a></td>
                    </tr>
                
                <% 
                    } }%>

              <%--  <td style="width: 5%;"><% =row["countryId"] %></td>
                        <td style="width: 10%;"><% =row["countryName"] %></td>
                        <td style="width: 10%;"><% =row["countryCapital"] %></td>
                        <td style="width: 10%;"><img style="width: 50px; height: 30px;" src="<% =row["countryFlag"] %>" alt="Image"></td>
                        <td style="width: 10%;"><% =row["countryArea"] %></td>
                        <td style="width: 10%;"><% =row["countryPopulation"] %></td>
                        <td style="width: 15%;"><% =row["countryLanguage"] %></td>
                        <td style="width: 10%;"><% =row["countryCurrency"] %></td>
                        <td style="width: 10%;"><% =row["countryTimezone"] %></td>
                        <td style="width: 5%;"><% =row["continentCode"] %></td>--%>
            </tbody>
        </table>
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">LinkButton</asp:LinkButton> <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>              
    </div>


    
                   
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jsscript" runat="server">

</asp:Content>
