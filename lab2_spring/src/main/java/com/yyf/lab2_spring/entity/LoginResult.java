package com.yyf.lab2_spring.entity;

/**
 * Response Code & User info (to do)
 */
public class LoginResult {
    private int code;
    private int type;

    public LoginResult(int code) {
        this.code = code;
        this.type = 0;
    }
    public LoginResult(int code, int type) {
        this.code = code;
        this.type = type;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
