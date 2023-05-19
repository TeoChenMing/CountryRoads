<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="UserQuestions.aspx.cs" Inherits="CountryRoads.User.UserQuestions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mt-2" style="margin: 0 10%">

        <section id="banner">

            <div class="mt-5">
                <h1>Questions</h1>
            </div>

        </section>

        <section id="daily-question">

            <div class="row justify-content-center">
                <div class="col">
                    <h2>Quick Quiz!</h2>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col">
                    <h4>Have you tested yourself with what you have learned?</h4>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col">
                    <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">Attempt Quiz</a>
                </div>
            </div>

        </section>

        <!-- Quiz Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">
            <div class="modal-dialog modal-dialog-centered modal-lg ">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">What is the answer to this quiz?</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <%   if (dt != null)
                            {
                                foreach (DataRow row in dt.Rows)
                                {
                                    string[] optionsArr = $"{row["options"]}".Split(new string[] { "||" }, StringSplitOptions.None);
                                    Random rnd=new Random();
                                    string[] optionsArrRand = optionsArr.OrderBy(x => rnd.Next()).ToArray();
                        %>

                        <div>
                            <img src="<% =row["countryFlag"] %>" alt="Country Flag" style="object-fit: contain;">
                        </div>

                        <div id="question">
                            <% =row["title"] %>
                        </div>

                        <div class="row">

                            <div class="row">
                                <div class="col">
                                    <div class="option-box">
                                        <input class="form-check-input" type="radio" name="option1" id="option1-radio" value="" />
                                        <label class="form-check-label" for="option1-radio" id="option1-label">
                                            <% =optionsArrRand[0] %>
                                        </label>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="option-box">
                                        <input class="form-check-input" type="radio" name="option2" id="option2-radio" value="" />
                                        <label class="form-check-label" for="option2-radio" id="option2-label">
                                            <% =optionsArrRand[1] %>
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="row" id="moreOptions">
                                <div class="col">
                                    <div class="option-box">
                                        <input class="form-check-input" type="radio" name="option3" id="option3-radio" value="" />
                                        <label class="form-check-label" for="option3-radio" id="option3-label">
                                            <% =optionsArrRand[2] %>
                                        </label>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="option-box">
                                        <input class="form-check-input" type="radio" name="option4" id="option4-radio" value="" />
                                        <label class="form-check-label" for="option4-radio" id="option4-label">
                                            <% =optionsArrRand[3] %>
                                        </label>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <%
                                }
                            }
                        %>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button id="submit" type="button" class="btn btn-success" onclick="Submit_Click">Submit</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
</asp:Content>
