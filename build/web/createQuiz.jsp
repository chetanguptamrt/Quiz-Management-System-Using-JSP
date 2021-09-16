<%-- 
    Document   : createQuiz
    Created on : 26-May-2021, 9:58:01 AM
    Author     : chetan
--%>
<%@page import="com.dao.UserDAO"%>
<%@page import="com.detail.UserDetail"%>
<%
    if(session.getAttribute("userLogin")==null){
        response.sendRedirect("./login.jsp");
    } else{
        UserDetail ud = (UserDetail) session.getAttribute("userLogin");
        if(ud.isActivate()){
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="./component/head.jsp" %>
        <title>Create Quiz | Quiz Maker</title>
    </head>
    <body>
        <%@include file="./component/navbar.jsp" %>
        <form id="quiz">
        <div class="container-md mb-5">
            <div class="row">
                <div class="col-12">
                    <div class="mt-3">
                        <div style="float: left">
                            <h3>Create quiz</h3>
                        </div>
                        <div style="float: right;display: flex;">
                            <select name="publish" class="mr-3">
                                <option selected value="true">Public</option>
                                <option value="false">Private</option>
                            </select>
                            <button type="submit" class="btn btn-success">Create</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <input id="total" name="total" hidden value="1">
                    <h6 class="mt-3">Title of quiz <span style="color:red;">*</span></h6>
                    <input type="text" maxlength="100" class="form-control" name="title" id="title" placeholder="For eg: Database Management System Quiz (Max-length: 100)" required="required"/>
                    <h6 class="mt-3">Description</h6>
                    <textarea rows="4" name="description" maxlength="500" class="form-control" placeholder="Description (Max-length: 500)"></textarea>
                    <h6 class="mt-3">Student Details <span style="color:red;">*</span> <span style="font-weight: 400; color: #666666">(Please check at least one)</span></h6>
                    <div class="border border-primary rounded p-3">
                        <table cellpadding="4">
                            <tr>
                                <td>
                                    <input type="checkbox" id="s1" name="s1" value="yes" /> <label for="s1">Name</label>
                                </td>
                                <td>
                                    <input type="checkbox" id="s2" name="s2" value="yes" /> <label for="s2">Roll No.</label> <br/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="checkbox" id="s3" name="s3" value="yes" /> <label for="s3">Email Address</label>
                                </td>
                                <td>
                                    <input type="checkbox" id="s4" name="s4" value="yes" /> <label for="s4">Phone No.</label> <br/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="checkbox" id="s5" name="s5" value="yes" /> <label for="s5">Course</label>
                                </td>
                                <td>
                                    <input type="checkbox" id="s6" name="s6" value="yes" /> <label for="s6">College Name</label>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <h6 class="mt-3">Question <span style="color:red;">*</span></h6>
                    <div id="questionset">
                        <div class="mt-3">
                            <div style="display: flex">
                                <h6 class=" align-self-center">Q1.</h6>&nbsp;&nbsp;&nbsp;
                                <input type="text" id="question1" name="question1" class="form-control" placeholder="Question 1"/>
                            </div>
                            <table cellpadding="2" style="width: 100%" class="mt-2">
                                <tr>
                                    <td>
                                        <input type="text" id="qa1" name="qa1" class="form-control" placeholder="Answer A"/>
                                    </td>
                                    <td>
                                        <input type="text" id="qb1" name="qb1" class="form-control" placeholder="Answer B"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" id="qc1" name="qc1" class="form-control" placeholder="Answer C"/>
                                    </td>
                                    <td>
                                        <input type="text" id="qd1" name="qd1" class="form-control" placeholder="Answer D"/>
                                    </td>
                                </tr>
                            </table>
                            <div style="display: flex">
                                <h6 class="mt-2 align-self-center">Correct Answer: </h6>&nbsp;&nbsp;&nbsp;
                                <select class="pl-3 pr-3 pt-0 pb-0" name="ans1">
                                    <option selected value="1">A</option>
                                    <option value="2">B</option>
                                    <option value="3">C</option>
                                    <option value="4">D</option>
                                </select>
                            </div>
                        </div>                        
                    </div>
                </div>
            </div>
        </div>
        </form>
        <footer class="bg-primary text-light text-center pt-1 pb-1">
            Copyright &copy; 2020, Chetanguptamrt. All Rights Reserved.
        </footer>
        <script src="js/createQuiz.js" type="text/javascript"></script>
    </body>
</html>
<%
        } else {
            response.sendRedirect("./index.jsp");
        }
    }
%>