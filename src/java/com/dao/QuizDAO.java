/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.database.DBConnect;
import com.detail.ParticipantDetail;
import com.detail.QuestionDetail;
import com.detail.QuizDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author chetan
 */
public class QuizDAO {
    
    public String insertQuiz(QuizDetail qds){
        try{
            Connection conn = DBConnect.getConn();
            String query = "insert into quiz (title,description,publish,s1,s2,s3,s4,s5,s6,userId) values(?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setString(1, qds.getTitle());
            pt.setString(2, qds.getDescription());
            pt.setBoolean(3, qds.isPublish());
            pt.setBoolean(4, qds.isS1());
            pt.setBoolean(5, qds.isS2());
            pt.setBoolean(6, qds.isS3());
            pt.setBoolean(7, qds.isS4());
            pt.setBoolean(8, qds.isS5());
            pt.setBoolean(9, qds.isS6());
            pt.setInt(10, qds.getUserId());
            int i = pt.executeUpdate();
            if(i==1){
                String query3 = "select id from quiz where userId = ? order by id desc limit 1";
                PreparedStatement pt3 = conn.prepareStatement(query3);
                pt3.setInt(1, qds.getUserId());
                ResultSet rs = pt3.executeQuery();
                if(rs.next()){
                    for(QuestionDetail qd:qds.getQds()){
                        String query2 = "insert into question (name,a,b,c,d,correct,quizId) values (?,?,?,?,?,?,?)";
                        PreparedStatement pt2 = conn.prepareStatement(query2);
                        pt2.setString(1, qd.getQuestion());
                        pt2.setString(2, qd.getQa());
                        pt2.setString(3, qd.getQb());
                        pt2.setString(4, qd.getQc());
                        pt2.setString(5, qd.getQd());
                        pt2.setString(6, qd.getCorrect());
                        pt2.setInt(7, rs.getInt("id"));
                        System.out.println(qd.getQuestion()+qd.getQa()+qd.getQb()+qd.getQc()+qd.getQd()+rs.getInt("id"));
                        pt2.executeUpdate();
                    }
                    return "done";
                }
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("Quiz created by user "+qds.getUserId());
        
        return "no";
    }
    
    public String editQuiz(QuizDetail qds){
        try{
            Connection conn = DBConnect.getConn();
            String query = "update quiz set title = ?,description = ?,publish = ?,s1 = ?,s2 = ?,s3 = ?,s4 = ?,s5 = ?,s6 = ? where id = ? and userId = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setString(1, qds.getTitle());
            pt.setString(2, qds.getDescription());
            pt.setBoolean(3, qds.isPublish());
            pt.setBoolean(4, qds.isS1());
            pt.setBoolean(5, qds.isS2());
            pt.setBoolean(6, qds.isS3());
            pt.setBoolean(7, qds.isS4());
            pt.setBoolean(8, qds.isS5());
            pt.setBoolean(9, qds.isS6());
            pt.setInt(10, qds.getQuizId());
            pt.setInt(11, qds.getUserId());
            int i = pt.executeUpdate();
            if(i==1){
                return "done";
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("Quiz created by user "+qds.getUserId());
        
        return "no";
    }
    
    public List<QuizDetail> getQuiz(int userId){
        List<QuizDetail> list = new ArrayList<QuizDetail>();
        QuizDetail qd;
        try{
            Connection conn = DBConnect.getConn();
            String query = "select * from quiz where userID = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setInt(1, userId);
            ResultSet rs = pt.executeQuery();
            while(rs.next()){
                qd = new QuizDetail();
                qd.setId(rs.getInt("id"));
                qd.setTitle(rs.getString("title"));
                qd.setDescription(rs.getString("description"));
                qd.setPublish(rs.getBoolean("publish"));
                list.add(qd);
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public List<QuizDetail> getQuizScore(int userId){
        List<QuizDetail> list = new ArrayList<QuizDetail>();
        QuizDetail qd;
        try{
            Connection conn = DBConnect.getConn();
            String query = "select * from quiz where userID = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setInt(1, userId);
            ResultSet rs = pt.executeQuery();
            while(rs.next()){
                qd = new QuizDetail();
                qd.setId(rs.getInt("id"));
                qd.setTitle(rs.getString("title"));
                qd.setPublish(rs.getBoolean("publish"));
                list.add(qd);
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public List<ParticipantDetail> getQuizScore(int userId,int quizId){
        List<ParticipantDetail> list = new ArrayList<ParticipantDetail>();
        ParticipantDetail pd;
        try{
            Connection conn = DBConnect.getConn();
            String query = "select * from quiz where userID = ? and id = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setInt(1, userId);
            pt.setInt(2, quizId);
            ResultSet rs = pt.executeQuery();
            if(rs.next()){
                String query2 = "select * from participants where quizId = ?";
                PreparedStatement pt2 = conn.prepareStatement(query2);
                pt2.setInt(1, quizId);
                ResultSet rs2 = pt2.executeQuery();
                while(rs2.next()){
                    pd = new ParticipantDetail();
                    pd.setName(rs2.getString("name"));
                    pd.setRoll(rs2.getString("rollNo"));
                    pd.setEmail(rs2.getString("email"));
                    pd.setPhone(rs2.getString("phoneNo"));
                    pd.setCourse(rs2.getString("course"));
                    pd.setCollege(rs2.getString("collegeName"));
                    pd.setMarks(rs2.getString("marks"));
                    list.add(pd);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public QuizDetail getEditQuiz(int userId, int id){
        QuizDetail qd = null;
        try{
            System.out.println(userId+" "+id);
            Connection conn = DBConnect.getConn();
            String query = "select * from quiz where id = ? and userID = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setInt(1, id);
            pt.setInt(2, userId);
            ResultSet rs = pt.executeQuery();
            if(rs.next()){
                qd = new QuizDetail();
                qd.setId(rs.getInt("id"));
                qd.setTitle(rs.getString("title"));
                qd.setDescription(rs.getString("description"));
                qd.setPublish(rs.getBoolean("publish"));
                qd.setS1(rs.getBoolean("s1"));
                qd.setS2(rs.getBoolean("s2"));
                qd.setS3(rs.getBoolean("s3"));
                qd.setS4(rs.getBoolean("s4"));
                qd.setS5(rs.getBoolean("s5"));
                qd.setS6(rs.getBoolean("s6"));
                List<QuestionDetail> qds = new ArrayList<QuestionDetail>();
                QuestionDetail qd1;
                String query2 = "select * from question where quizId = ?";
                PreparedStatement pt2 = conn.prepareStatement(query2);
                pt2.setInt(1, id);
                ResultSet rs2 = pt2.executeQuery();
                while(rs2.next()){
                    qd1 = new QuestionDetail();
                    qd1.setQuestion(rs2.getString("name"));
                    qd1.setQa(rs2.getString("a"));
                    qd1.setQb(rs2.getString("b"));
                    qd1.setQc(rs2.getString("c"));
                    qd1.setQd(rs2.getString("d"));
                    qd1.setCorrect(rs2.getString("correct"));
                    qds.add(qd1);
                }
                qd.setQds(qds);
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return qd;
    }
    
    public String deleteQuiz(int id, int userId){
        try{
            Connection conn = DBConnect.getConn();
            String query = "delete from quiz where id = ? and userId = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setInt(1, id);
            pt.setInt(2, userId);
            int i = pt.executeUpdate();
            if(i==1){
                return "done";
            }
        } catch(SQLException ex){
            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "no";
    }
    
    public int getTotalQuiz(int userId){
        int total = 0;
         try{
            Connection conn = DBConnect.getConn();
            String query = "SELECT COUNT(*) AS total FROM quiz where userId = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setInt(1, userId);
            ResultSet rs = pt.executeQuery();
            if(rs.next()){
                total = rs.getInt("total");
            }
        } catch(SQLException ex){
            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }
}
