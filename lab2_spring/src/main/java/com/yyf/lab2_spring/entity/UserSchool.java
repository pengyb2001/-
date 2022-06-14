package com.yyf.lab2_spring.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;

@Entity
@Table(name = "T_USER_SCHOOL")
@JsonIgnoreProperties({ "handler","hibernateLazyInitializer" })
public class UserSchool {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "school_id")
    int schoolId;
    String schoolName;

    public void setSchoolId(int schoolNumber) {
        this.schoolId = schoolNumber;
    }
    public int getSchoolId() {
        return schoolId;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }
    public String getSchoolName() {
        return schoolName;
    }

}
