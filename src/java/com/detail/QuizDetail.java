/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.detail;

import java.util.List;

/**
 *
 * @author chetan
 */
public class QuizDetail {
    private int id;
    private String title;
    private String description;
    private boolean publish;
    private boolean s1;
    private boolean s2;
    private boolean s3;
    private boolean s4;
    private boolean s5;
    private boolean s6;
    private List<QuestionDetail> qds;
    private int userId;
    private int quizId;

    public int getQuizId() {
        return quizId;
    }

    public void setQuizId(int quizId) {
        this.quizId = quizId;
    }
    

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isPublish() {
        return publish;
    }

    public void setPublish(boolean publish) {
        this.publish = publish;
    }

    public boolean isS1() {
        return s1;
    }

    public void setS1(boolean s1) {
        this.s1 = s1;
    }

    public boolean isS2() {
        return s2;
    }

    public void setS2(boolean s2) {
        this.s2 = s2;
    }

    public boolean isS3() {
        return s3;
    }

    public void setS3(boolean s3) {
        this.s3 = s3;
    }

    public boolean isS4() {
        return s4;
    }

    public void setS4(boolean s4) {
        this.s4 = s4;
    }

    public boolean isS5() {
        return s5;
    }

    public void setS5(boolean s5) {
        this.s5 = s5;
    }

    public boolean isS6() {
        return s6;
    }

    public void setS6(boolean s6) {
        this.s6 = s6;
    }

    public List<QuestionDetail> getQds() {
        return qds;
    }

    public void setQds(List<QuestionDetail> qds) {
        this.qds = qds;
    }
    
}
