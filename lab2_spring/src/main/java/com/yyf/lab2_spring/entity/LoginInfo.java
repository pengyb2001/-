package com.yyf.lab2_spring.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "T_LOGIN_INFO")
@JsonIgnoreProperties({"handler","hibernateLazyInitializer"})
/**
 * 2022/3/12 Created by yyf
 * POJO LoginInfo
 */
public class LoginInfo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    int id;
    String userNumber;
    Date loginDate;

    public LoginInfo() { }

    public LoginInfo(String userNumber) {
        this.userNumber = userNumber;
        loginDate = new Date();
    }

    public Date getLoginDate() {
        return loginDate;
    }

    public int getId() {
        return id;
    }

    public String getUserNumber() {
        return userNumber;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setLoginDate(Date loginDate) {
        this.loginDate = loginDate;
    }

    public void setUserNumber(String userNumber) {
        this.userNumber = userNumber;
    }
}
