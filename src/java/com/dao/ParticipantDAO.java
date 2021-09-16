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
public class ParticipantDAO {
    
    public String checkAns(ParticipantDetail pd){
        try{
            Connection conn = DBConnect.getConn();
            String query1 = "select correct from question where quizId = ?";
            PreparedStatement pt1 = conn.prepareStatement(query1);
            pt1.setInt(1, pd.getQuizId());
            System.out.println(pd.getQuizId());
            ResultSet rs1 = pt1.executeQuery();
            int i = 0;
            int rightAns = 0;
            while(rs1.next()){
                if(rs1.getString("correct").equals(pd.getAns().get(i++))){
                    rightAns+=1;
                }
            }
            String query2 = "insert into participants (name, rollNo, email, phoneNo, course, collegeName, quizId, marks) values(?,?,?,?,?,?,?,?)";
            PreparedStatement pt2 = conn.prepareStatement(query2);
            pt2.setString(1, pd.getName());
            pt2.setString(2, pd.getRoll());
            pt2.setString(3, pd.getEmail());
            pt2.setString(4, pd.getPhone());
            pt2.setString(5, pd.getCourse());
            pt2.setString(6, pd.getCollege());
            pt2.setInt(7, pd.getQuizId());
            pt2.setString(8, rightAns+"/"+pd.getTotal());
            pt2.executeUpdate();
            return rightAns+"/"+pd.getTotal();
        } catch (SQLException ex) {
            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return "no";
    }
    
    public QuizDetail getQuizQuestion(int id){
        QuizDetail qd = null;
        try{
            Connection conn = DBConnect.getConn();
            String query = "select * from quiz where id = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setInt(1, id);
            ResultSet rs = pt.executeQuery();
            if(rs.next()){
                if(!rs.getBoolean("publish")){
                    return qd;
                }
                qd = new QuizDetail();
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
                    qds.add(qd1);
                }
                qd.setQds(qds);
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return qd;
    }
    
}
