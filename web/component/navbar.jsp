        <%@page import="com.dao.QuizDAO"%>
        <% 
            QuizDAO quizTotalDAO = new QuizDAO();
            int getQuizTotal = quizTotalDAO.getTotalQuiz(ud.getId());
        %>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <a class="navbar-brand" href="#">
                <i class="fa fa-question" aria-hidden="true"></i> Quiz Maker
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link text-light" href="./index.jsp">
                            <i class="fa fa-home" aria-hidden="true"></i> Home
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light" href="./createQuiz.jsp">
                            <i class="fa fa-plus" aria-hidden="true"></i> Create Quiz
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light" href="./viewQuiz.jsp">
                            <i class="fa fa-file-text-o" aria-hidden="true"></i> Your Quiz
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light" href="./viewScore.jsp">
                            <i class="fa fa-eye" aria-hidden="true"></i> View Score
                        </a>
                    </li>
                </ul>
                <button data-toggle="popover" tabindex="0" class="btn btn-outline-light rounded-pill profile-pic"></button>
                <script>
                    $('.profile-pic').popover({
                        trigger: 'focus',
                        html: true,
                        title:"Your Account",
                        content:"<h5><%= ud.getName() %></h5>"+
                                "<span style='color: #666666;'>"+<%=getQuizTotal%>+" Quiz Created</span>"+
                                "<div class='mt-3'>"+
                                "<a href='./profile.jsp' class='btn btn-primary btn-sm mr-3' ><i class='fa fa-user' aria-hidden='true'></i> Profile</a>"+
                                "<a href='./logoutUser.jsp' class='btn btn-sm btn-danger' ><i class='fa fa-sign-out' aria-hidden='true'></i> Logout</a>"+
                                "</div>",
                        placement: 'bottom'
                    });
                </script>
            </div>
        </nav>
