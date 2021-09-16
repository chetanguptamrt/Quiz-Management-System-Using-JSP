<%-- 
    Document   : doQuiz
    Created on : 28-May-2021, 5:05:42 PM
    Author     : chetan
--%>
<%@page import="com.detail.QuizDetail"%>
<%@page import="com.dao.ParticipantDAO"%>
<%  
    int id = 0;
    try{
        id = Integer.parseInt(request.getParameter("quizId"));
    } catch(Exception e){
        response.sendRedirect("./getStarted.jsp");
    }
    ParticipantDAO dao = new ParticipantDAO();
    QuizDetail qd = dao.getQuizQuestion(id);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
        <link rel="icon" href="./img/icon.png" />
        <title>Test | Quiz Maker</title>
        <style>
            .top{
                border-radius: 20px 0px 20px 0px; 
            }
            .mid{
                border: 1px solid black;
                border-radius: 20px;
            }
            body{
                background-color: #dfffff;
            }
        </style>
    </head>
    <body>
        <div class="container-md">
            <%
                if(qd==null){
            %>
            <div class="row p-4">
                <div class="col-12 p-5 border border-danger text-center rounded">
                    <h4 class="text-danger mt-4">This quiz is over</h4>
                    <a href="./getStarted.jsp">Create own quiz...</a>
                </div>
            </div>
            
            <%
                } else {
            %>

            <div class="row mt-3 mb-3">
                <div class="top col-12 border border-dark p-3">
                    <h1><%= qd.getTitle() %></h1>
                    <pre><%= qd.getDescription() %></pre>
                    <b>Total Question: </b> <label><%= qd.getQds().size() %></label>
                </div>
            </div>
            <form id="getAns">
            <div class="row mt-3 mb-3">
                <div class="mid col-12 border border-dark p-3">
                    <div id="detail">
                        <h3 class="text-center mb-3 mt-1">Participants Details</h3>
                        <div style="max-width:600px; min-width: 300px;margin: auto;width: 50%;">
                            <%
                                if(qd.isS1()) {
                            %>
                                <h5 class="text-left mt-2">Name <span style="color:red;">*</span></h5>
                                <input type="text" id="name" name="name" required="required" maxlength="30" class="form-control" placeholder="John Smith" />
                            <%
                                } else{
                            %>
                                <input type="text" name="name" hidden/>
                            <%
                                }
                                if(qd.isS2()) {
                            %>
                            <h5 class="text-left mt-2">Roll No. <span style="color:red;">*</span></h5>
                            <input type="text" name="roll" id="roll" required="required" maxlength="20" class="form-control" placeholder="Roll No." />
                            <%
                                } else{
                            %>
                                <input type="text" name="roll" hidden/>
                            <%
                                }
                                if(qd.isS3()) {
                            %>
                            <h5 class="text-left mt-2">Email Address <span style="color:red;">*</span></h5>
                            <input type="text" id="email" name="email" required="required" maxlength="50" class="form-control" placeholder="john@example.com" />
                            <%
                                } else{
                            %>
                                <input type="text" name="email" hidden />
                            <%
                                }
                                if(qd.isS4()) {
                            %>
                            <h5 class="text-left mt-2">Phone no. <span style="color:red;">*</span></h5>
                            <input type="text" name="phone" id="phone" required="required" maxlength="20" class="form-control" placeholder="+91 9874563214" />
                            <%
                                } else{
                            %>
                                <input type="text" name="phone" hidden/>
                            <%
                                }
                                if(qd.isS5()) {
                            %>
                            <h5 class="text-left mt-2">Course <span style="color:red;">*</span></h5>
                            <input type="text" name="course" id="course" required="required" maxlength="20" class="form-control" placeholder="Ex: BCA, MCA etc" />
                            <%
                                } else{
                            %>
                                <input type="text" name="course" hidden/>
                            <%
                                }
                                if(qd.isS6()) {
                            %>
                            <h5 class="text-left mt-2">College Name <span style="color:red;">*</span></h5>
                            <input type="text" name="college" id="college" required="required" maxlength="50" class="form-control" placeholder="Beacon Institute of Technology" />
                            <%
                                } else{
                            %>
                                <input type="text" name="college" hidden/>
                            <%
                                }
                            %>
                            <div class="text-right mt-3">
                                <a class="btn btn-primary" onclick="nextButton()">Next ></a>
                            </div>
                        </div>
                    </div>
               
                    <div id="question" class="p-3 mt-1 mb-1" style="display: none;">
                        <div style="display: flex">
                            <h5 id="qNo"></h5> <p id="qQues"></p>
                        </div>
                        <input class="ml-4" type="radio" id="qa1" name="qes1" value="1" /> <label for="qa1" id="qOptA"></label> <br/>
                        <input class="ml-4" type="radio" id="qb1" name="qes1" value="2" /> <label for="qb1" id="qOptB"></label> <br/>
                        <input class="ml-4" type="radio" id="qc1" name="qes1" value="3" /> <label for="qc1" id="qOptC"></label> <br/>
                        <input class="ml-4" type="radio" id="qd1" name="qes1" value="4" /> <label for="qd1" id="qOptD"></label> <br/>
                        <div class="mt-3 d-flex justify-content-around">
                            <a class="btn btn-primary" onclick="previousQuestion()">< Previous</a>
                            <button class="btn btn-success" type="submit">Submit</button>
                            <a class="btn btn-primary" onclick="nextQuestion()">Next ></a>
                        </div>
                    </div>
                    <div id="marks" class="text-center p-3 mt-1 mb-1" style="display: none;">
                        <h3 id="totalMarks" class="text-success"></h3>
                        <a href="./getStarted.jsp">Create own quiz...</a>
                    </div>
                </div>
            </div>
            </form>
        </div>
            
        <script>
            var questions = {total:"<%=qd.getQds().size()%>",question:[]};
            var answer = [];
            <%
                for(int i=0; i<qd.getQds().size(); i++){
            %>
                    questions.question.push(["<%= qd.getQds().get(i).getQuestion() %>","<%= qd.getQds().get(i).getQa() %>","<%= qd.getQds().get(i).getQb() %>","<%= qd.getQds().get(i).getQc() %>","<%= qd.getQds().get(i).getQd() %>"]);
                    answer.push("0");
            <%
                }
            %>
            console.log(questions);
            console.log(answer);
            var no = 0;
            
            function nextQuestion(){
                if(no < questions.total){
                    for(var j=0;j<4;j++){
                        if($('#question input[type="radio"]')[j].checked){
                            answer[no-1] = $('#question input[name="qes1"]')[j].value;
                        }
                    }
                    $('input[type="radio"]').prop("checked", false);
                    no+=1;
                    $("#qNo").html("Q"+no+".");
                    $("#qQues").html(questions.question[no-1][0]);
                    $("#qOptA").html(questions.question[no-1][1]);
                    $("#qOptB").html(questions.question[no-1][2]);
                    $("#qOptC").html(questions.question[no-1][3]);
                    $("#qOptD").html(questions.question[no-1][4]);
                    $('#question input[value="'+answer[no-1]+'"]').prop("checked", true);
                }
                console.log(no);
                console.log(answer);
            }
            function previousQuestion(){
                if(no === 1){
                    $("#question").hide();
                    $("#detail").show();
                    no=0;
                } else if (no > 1 && no <6) {
                    for(var j=0;j<4;j++){
                        if($('#question input[type="radio"]')[j].checked){
                            answer[no-1] = $('#question input[name="qes1"]')[j].value;
                        }
                    }
                    $('input[type="radio"]').prop("checked", false);                    
                    no-=1;
                    $("#qNo").html("Q"+no+".");
                    $("#qQues").html(questions.question[no-1][0]);
                    $("#qOptA").html(questions.question[no-1][1]);
                    $("#qOptB").html(questions.question[no-1][2]);
                    $("#qOptC").html(questions.question[no-1][3]);
                    $("#qOptD").html(questions.question[no-1][4]);
                    $('#question input[value="'+answer[no-1]+'"]').prop("checked", true);
                }
                console.log(no);
                console.log(answer);
            }
            
            function nextButton(){
                if($("#name").val()===""){
                    alert("Please write all Participants Details...");
                } else if($("#roll").val()===""){
                    alert("Please write all Participants Details...");
                } else if($("#email").val()===""){
                    alert("Please write all Participants Details...");
                } else if($("#phone").val()===""){
                    alert("Please write all Participants Details...");
                } else if($("#course").val()===""){
                    alert("Please write all Participants Details...");
                } else if($("#college").val()===""){
                    alert("Please write all Participants Details...");
                } else{
                    $("#detail").hide();
                    $("#question").show();
                    no+=1;
                    $("#qNo").html("Q"+no+".");
                    $("#qQues").html(questions.question[no-1][0]);
                    $("#qOptA").html(questions.question[no-1][1]);
                    $("#qOptB").html(questions.question[no-1][2]);
                    $("#qOptC").html(questions.question[no-1][3]);
                    $("#qOptD").html(questions.question[no-1][4]);
                    $('input[type="radio"]').prop("checked", false);
                    $('#question input[value="'+answer[no-1]+'"]').prop("checked", true);
                    console.log(answer);
                }
            }
            $(document).ready(function() {
                $("#getAns").on("submit", function(event){
                    event.preventDefault();
                    for(var j=0;j<4;j++){
                        if($('#question input[type="radio"]')[j].checked){
                            answer[no-1] = $('#question input[name="qes1"]')[j].value;
                        }
                    }
                    var send = "quizId="+<%= id %>+"&total="+questions.total;
                    for(var i=0;i<answer.length;i++){
                        send=send+"&ans"+(i+1)+"="+answer[i];
                    }
                    var f = $(this).serialize();
                    $.ajax({
                        url: "./SubmitQuizServlet?"+send+"&"+f,
                        data: f,
                        success: function(data){
                            if(data.trim()==="no" || data.trim()===""){
                                alert("Something went wrong!");
                            } else {
                                $("#detail").hide();
                                $("#question").hide();
                                $("#marks").show();
                                $("#totalMarks").html("Total Marks - "+data);
                            }
                        },
                        error: function(){
                            alert("Something went wrong!");
                        }
                    });
                    console.log(send);
                    console.log(answer);
                    console.log(f);
                });
            });
        </script>
        <%
            }
        %>
    </body>
</html>
