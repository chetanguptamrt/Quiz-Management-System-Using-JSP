/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.dao.QuizDAO;
import com.detail.QuizDetail;
import com.detail.UserDetail;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author chetan
 */
public class EditQuizSevlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("userLogin")==null){
            return;
        }
        UserDetail ud = (UserDetail) session.getAttribute("userLogin");
        int userId = ud.getId();
        int quizId = Integer.parseInt(request.getParameter("quizId").trim());
        String title = request.getParameter("title").trim();
        String description = request.getParameter("description").trim();
        boolean publish = Boolean.parseBoolean(request.getParameter("publish").trim());
        boolean s1 = false;
        try{
            if(request.getParameter("s1").trim().equals("yes"))
                s1 = true;
        } catch(Exception e){}
        boolean s2 = false;
        try{
            if(request.getParameter("s2").trim().equals("yes"))
                s2 = true;
        } catch(Exception e){}
        boolean s3 = false;
        try{
            if(request.getParameter("s3").trim().equals("yes"))
                s3 = true;
        } catch(Exception e){}
        boolean s4 = false;
        try{
            if(request.getParameter("s4").trim().equals("yes"))
                s4 = true;
        } catch(Exception e){}
        boolean s5 = false;
        try{
        if(request.getParameter("s5").trim().equals("yes"))
            s5 = true;        
        } catch(Exception e){}
        boolean s6 = false;
        try{
        if(request.getParameter("s6").trim().equals("yes"))
            s6 = true;        
        } catch(Exception e){}
        QuizDetail quiz = new QuizDetail(); 
        quiz.setUserId(userId);
        quiz.setTitle(title);
        quiz.setDescription(description);
        quiz.setPublish(publish);
        quiz.setS1(s1);
        quiz.setS2(s2);
        quiz.setS3(s3);
        quiz.setS4(s4);
        quiz.setS5(s5);
        quiz.setS6(s6);
        quiz.setQuizId(quizId);
        QuizDAO dao = new QuizDAO();
        String done = dao.editQuiz(quiz);
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println(done);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
