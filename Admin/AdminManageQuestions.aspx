<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminPage.Master" AutoEventWireup="true" CodeBehind="AdminManageQuestions.aspx.cs" Inherits="CountryRoads.Admin.AdminManageQuestions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    Manage Questions
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<%@ Import Namespace="System.Data" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Manage Questions</h2>

    <div class="container-fluid">
        <asp:HiddenField ID="questionId" runat="server" Value=""/> 
        <asp:HiddenField ID="countryId" runat="server" Value=""/>  
        <asp:HiddenField ID="quizType" runat="server" Value=""/>
        <asp:HiddenField ID="title" runat="server" Value=""/>
        <asp:HiddenField ID="options" runat="server" Value=""/>
        <asp:HiddenField ID="answer" runat="server" Value=""/>
            
        <table
            id="myTable"
            class="mw-90"
            data-toggle="table"
            data-search="true"
            data-pagination="true"
            >
            <thead>
                <tr>
                    <th data-field="questionId">Question ID</th>
                    <th data-field="countryId">Country ID</th>
                    <th data-field="quizType">Quiz Type</th>
                    <th data-field="title">Title</th>
                    <th data-field="options">Options</th>
                    <th data-field="answer">Answer</th>
                    <th data-align="center" data-halign="left" data-field="action">Action</th>
                    
                </tr>
                                    
            </thead>
            <tbody>
                <%   if (dt != null) { 
                        foreach (DataRow row in dt.Rows)  
                        {
                %>
   
                    <tr>
                        <td><% =row["userId"] %></td>
                        <td class="text-nowrap text-truncate"><% =row["username"] %> </td>
                        <td hidden><% = row["password"] %></td>
                        <td class="text-nowrap text-truncate"><% =row["email"] %></td>
                        <td class="text-nowrap text-truncate"><% =row["fullName"] %></td>
                        <td class="text-nowrap text-truncate"><% =row["gender"] %></td>
                        <td class="text-nowrap text-truncate"><% =row["quizAccessed"] %></td>
                        <td><% =row["status"] %></td>       
                        <td><a class="editBtn" href="#" data-bs-toggle="modal" data-bs-target="#myModal"><i class="bi bi-pencil-square"></i></a></td>
                    </tr>
                
                <% 
                        } 
                    }
                %>

              
            </tbody>
        </table>
                  
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ModalContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="jsscript" runat="server">
</asp:Content>
