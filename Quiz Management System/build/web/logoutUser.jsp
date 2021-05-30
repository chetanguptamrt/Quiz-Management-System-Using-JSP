<%-- 
    Document   : logoutUser
    Created on : 25-May-2021, 8:52:51 PM
    Author     : chetan
--%>

<%
    session.removeAttribute("userLogin");
    session.invalidate();
    response.sendRedirect("./getStarted.jsp");
%>