<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="UserQuestions.aspx.cs" Inherits="CountryRoads.User.UserQuestions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .options-div div{
            padding: 5px auto;
        }
        .option-box {
            padding: 15px;
            border: 0.5px solid #D3D3D3;
            transition: all 300ms ease;
        }

        .option-box:hover {
            transform: scale(1.01);
            box-shadow: 1px 1px 30px 0.5px #D3D3D3;
        }

        .form-check-input {
            border: 1px solid black;
        }
    </style>
</asp:Content>

<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mt-2" style="margin: 0 10%">

        <section id="banner">

            <div class="mt-5">
                <h1>Questions</h1>
            </div>

        </section>

        <section id="questions_accessed">
            <div class="card mt-4 mb-4 p-4">
                <div class="row d-flex justify-content-center">
                    <div class="col text-center">
                        <h2>Total Attempts made:</h2>
                    </div>
                </div>
                <div class="row d-flex justify-content-center">
                    <div class="col text-center">
                        <% if (userDt != null)
                            {
                                foreach (DataRow row in userDt.Rows)
                                {

                        %>
                        <h1><% =row["quizAccessed"] %></h1>
                        <% }
                            }  %>
                    </div>
                </div>
            </div>
        </section>

        <section id="random_question">
            <div class="card mt-4 mb-4 p-4">
                <div class="row d-flex justify-content-center">
                    <div class="col text-center">
                        <h2>Quick Quiz!</h2>
                    </div>
                </div>

                <div class="row d-flex justify-content-center">
                    <div class="col text-center">
                        <p>Test yourself with a quiz from a random selected country!</p>
                    </div>
                </div>

                <div class="row d-flex justify-content-center">
                    <div class="col text-center">
                        <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">Attempt Quiz</a>
                    </div>
                </div>
            </div>

        </section>

        <section id="formatted_question">
            <div class="card mt-4 mb-4 p-4">
            <div class="row d-flex justify-content-center">
                <div class="col text-center">
                    <h2>Test your knowledge!</h2>
                </div>
            </div>

            <div class="row d-flex justify-content-center">
                <div class="col text-center">
                    <p>We'll pick 5 random Questions from the countries you have browsed, and you would have to answer them!</p>
                </div>
            </div>

            <div class="row d-flex justify-content-center">
                <div class="col text-center">
                    <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#QuestionsSetModal">Attempt Quiz</a>
                </div>
            </div>
                </div>
        </section>

        <!-- Random Quiz Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div id="myCarousel" class="carousel slide" data-interval="false">
                        <div class="carousel-inner">
                            <div class="carousel-item active" id="question_page">
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
                                                Random rnd = new Random();
                                                string[] optionsArrRand = optionsArr.OrderBy(x => rnd.Next()).ToArray();
                                    %>

                                    <div class="row justify-content-center" style="background-color: #F5F5F5;">
                                        <div class="col-md-auto">
                                            <img src="<% =row["countryFlag"] %>" alt="Country Flag" style="max-width: 600px;">
                                        </div>
                                    </div>

                                    <div id="question">
                                        <h4><% =row["title"] %></h4>
                                    </div>

                                    <div class="row options-div">

                                        <div class="row">
                                            <div class="col">
                                                <div class="option-box">
                                                    <input class="form-check-input" type="radio" name="option" id="option1-radio" value="<% =optionsArrRand[0] %>" />
                                                    <label class="form-check-label" for="option1-radio" id="option1-label">
                                                        <% =optionsArrRand[0] %>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="option-box">
                                                    <input class="form-check-input" type="radio" name="option" id="option2-radio" value="<% =optionsArrRand[1] %>" />
                                                    <label class="form-check-label" for="option2-radio" id="option2-label">
                                                        <% =optionsArrRand[1] %>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row" id="moreOptions">
                                            <div class="col">
                                                <div class="option-box">
                                                    <input class="form-check-input" type="radio" name="option" id="option3-radio" value="<% =optionsArrRand[2] %>" />
                                                    <label class="form-check-label" for="option3-radio" id="option3-label">
                                                        <% =optionsArrRand[2] %>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="option-box">
                                                    <input class="form-check-input" type="radio" name="option" id="option4-radio" value="<% =optionsArrRand[3] %>" />
                                                    <label class="form-check-label" for="option4-radio" id="option4-label">
                                                        <% =optionsArrRand[3] %>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <input type="hidden" id="questionAns" value="<% =row["answer"] %>" />

                                    </div>

                                    <%
                                            }
                                        }
                                    %>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button id="submit" type="button" class="btn btn-success" onclick="checkAnswer()">Submit</button>
                                </div>
                            </div>

                            <!-- Question Complete Modal -->
                            <div class="carousel-item" id="question_status">

                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel2">Results</h1>
                                </div>

                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col text-center">
                                            <h2 id="questionStatus">Status</h2>
                                        </div>
                                    </div>

                                    <div id="correctAns" class="row" style="display: none">
                                        <% 
                                            foreach (DataRow row in dt.Rows)
                                            {
                                        %>

                                        <div class="col text-center">
                                            Correct answer is: <br /> <% =row["answer"] %>
                                        </div>

                                        <%
                                            }
                                        %>
                                    </div>

                                    <div class="row">
                                        <div class="col text-center">
                                            You have completed the quiz!
                                        </div>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="increaseQuiz()">Done</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Question Set modal -->
        <div class="modal fade" id="QuestionsSetModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div id="QuestionsSetCarousel" class="carousel slide" data-interval="false">
                        <div class="carousel-inner">
                            
                            <%  if (questionsDt != null)
                                {
                                    int counter = 0;
                            %>
                            
                            <%
                                foreach (DataRow row in questionsDt.Rows)
                                {
                                    string[] optionsArr = $"{row["options"]}".Split(new string[] { "||" }, StringSplitOptions.None);
                                    Random rnd = new Random();
                                    string[] optionsArrRand = optionsArr.OrderBy(x => rnd.Next()).ToArray();

                            %>
                            
                            <% if (counter == 0) { %>
                            <div class="carousel-item active">
                            <% } else { %>
                            <div class="carousel-item">
                            <%  }%>

                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="modalLabel1">Test your knowledge</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>

                                <div class="modal-body">
                                    
                                    <div class="row justify-content-center" style="background-color: #F5F5F5;">
                                        <div class="col-md-auto">
                                            <img src="<% =row["countryFlag"] %>" alt="Country Flag" style="max-width: 600px;">
                                        </div>
                                    </div>

                                    <div id="question_title">
                                        <h4><% =row["title"] %></h4>
                                    </div>

                                    <div class="row options-div">

                                        <div class="row">
                                            <div class="col">
                                                <div class="option-box">
                                                    <input class="form-check-input" type="radio" name="option<% =row["questionId"] %>" id="set-option1-radio" value="<% =optionsArrRand[0] %>" />
                                                    <label class="form-check-label" for="option1-radio">
                                                        <% =optionsArrRand[0] %>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="option-box">
                                                    <input class="form-check-input" type="radio" name="option<% =row["questionId"] %>" id="set-option2-radio" value="<% =optionsArrRand[1] %>" />
                                                    <label class="form-check-label" for="option2-radio">
                                                        <% =optionsArrRand[1] %>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row" id="set_moreOptions">
                                            <div class="col">
                                                <div class="option-box">
                                                    <input class="form-check-input" type="radio" name="option<% =row["questionId"] %>" id="set-option3-radio" value="<% =optionsArrRand[2] %>" />
                                                    <label class="form-check-label" for="option3-radio">
                                                        <% =optionsArrRand[2] %>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="option-box">
                                                    <input class="form-check-input" type="radio" name="option<% =row["questionId"] %>" id="set-option4-radio" value="<% =optionsArrRand[3] %>" />
                                                    <label class="form-check-label" for="option4-radio">
                                                        <% =optionsArrRand[3] %>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                    </div>


                                </div>

                                <div class="modal-footer">
                                    <!-- show prev -->
                                    <%  if (counter > 0)
                                        { %>
                                    <button type="button" class="btn btn-secondary" data-bs-target="#QuestionsSetCarousel" data-bs-slide="prev">Previous</button>
                                    <% } %>
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                                    <!-- show submit -->
                                    <%  if (counter == 4)
                                        { %>
                                    <button id="check" type="button" class="btn btn-success" onclick="checkSetAnswer(<% =row["questionId"] %>, '<% =row["answer"] %>')" data-bs-target="#QuestionsSetCarousel" data-bs-slide="next">Submit</button>
                                    <% }
                                        else
                                        { %>
                                    <button id="next" type="button" class="btn btn-primary" data-bs-target="#QuestionsSetCarousel" onclick="calculateResults(<% =row["questionId"] %>, '<% =row["answer"] %>')" data-bs-slide="next">Next</button>
                                    <% } %>
                                </div>

                            <% if (counter == 0) { %>
                            </div>
                            <% } else { %>
                            </div>
                            <%  }%>
                            <%
                                        counter += 1;
                                    }
                                }
                            %>

                            <!-- Question Complete Modal -->
                            <div class="carousel-item">

                                <div class="modal-header">
                                    <h1 class="modal-title fs-5">Results</h1>
                                </div>

                                <div class="modal-body">

                                    <div class="row">
                                        <div id="score" class="col text-center" style="font-size: 21px">
                                            You just got <b id="quizScore"></b> out of 5!
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col text-center">
                                            <h2 id="setQuestionStatus">Status</h2>
                                        </div>
                                    </div>

                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="increaseQuiz()">Done</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <asp:Button ID="Update" type="button" runat="server" OnClick="Update_Click" hidden="true" />
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
    <script>
        function checkAnswer() {
            var questionAns = document.getElementById("questionAns").value;
            // console.log("Question to Ans: " + questionAns);
            var getSelectedValue = document.querySelector('input[name="option"]:checked').value;
            // console.log("Selected Value: " + getSelectedValue);

            if (questionAns == getSelectedValue) {
                const customMsg = [
                    "Congratulations on getting a perfect score!",
                    "Well done! You aced it!",
                    "Fantastic job! You got all the questions right!",
                    "Impressive! You're a master of this topic!",
                    "Bravo! Flawless performance!",
                    "Amazing work! You didn't miss a single question!",
                    "Incredible! You're a true expert!",
                    "Outstanding! Your knowledge is impeccable!",
                    "Superb! You couldn't have done any better!",
                    "Excellent job! You're at the top of your game!"
                ];

                const random = Math.floor(Math.random() * customMsg.length);
                document.getElementById("questionStatus").innerHTML = customMsg[random];
            } else {
                const customMsg = [
                    "Better luck next time!",
                    "Don't worry, practice makes perfect!",
                    "Keep trying, you'll get there!",
                    "Nice effort, but not quite there yet.",
                    "Almost had it! Keep going!",
                    "You're on the right track, just a little more!",
                    "Not quite what we're looking for. Try again!",
                    "Keep pushing yourself, you'll succeed!",
                    "Don't give up, you're improving!",
                    "Keep practicing, you're getting closer!"
                ];

                const random = Math.floor(Math.random() * customMsg.length);
                document.getElementById("questionStatus").innerHTML = customMsg[random];
                document.getElementById("correctAns").style.display = "block";
            }

            $("#myCarousel").carousel(1);
        }

        function increaseQuiz() {
            $("#myCarousel").carousel(0);

            var clickButton = document.getElementById("<% =Update.ClientID %>");
            clickButton.click();
        }

        var points = 0

        function calculateResults(questionId, answer) {
            console.log("Question ID: ", questionId);
            console.log("Question to Ans: " + answer);
            var query = 'input[name="option' + questionId + '"]:checked';
            var getSelectedValue = document.querySelector(query).value;
            console.log("Selected Value: " + getSelectedValue);

            if (answer == getSelectedValue) {
                points += 1;
            }
        }

        function checkSetAnswer(questionId, answer) {
            calculateResults(questionId, answer);
            document.getElementById("quizScore").innerHTML = points;

            // custom message
            if (points != 5) {
                const customMsg = [
                    "Better luck next time!",
                    "Don't worry, practice makes perfect!",
                    "Keep trying, you'll get there!",
                    "Nice effort, but not quite there yet.",
                    "Almost had it! Keep going!",
                    "You're on the right track, just a little more!",
                    "Not quite what we're looking for. Try again!",
                    "Keep pushing yourself, you'll succeed!",
                    "Don't give up, you're improving!",
                    "Keep practicing, you're getting closer!"
                ];

                const random = Math.floor(Math.random() * customMsg.length);
                document.getElementById("setQuestionStatus").innerHTML = customMsg[random];
            } else {
                const customMsg = [
                    "Congratulations on getting a perfect score!",
                    "Well done! You aced it!",
                    "Fantastic job! You got all the questions right!",
                    "Impressive! You're a master of this topic!",
                    "Bravo! Flawless performance!",
                    "Amazing work! You didn't miss a single question!",
                    "Incredible! You're a true expert!",
                    "Outstanding! Your knowledge is impeccable!",
                    "Superb! You couldn't have done any better!",
                    "Excellent job! You're at the top of your game!"
                ];

                const random = Math.floor(Math.random() * customMsg.length);
                document.getElementById("setQuestionStatus").innerHTML = customMsg[random];
            }
            
        }

    </script>
</asp:Content>
