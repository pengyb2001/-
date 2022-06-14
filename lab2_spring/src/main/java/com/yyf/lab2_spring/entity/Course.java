package com.yyf.lab2_spring.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.util.ArrayList;

/**
 * 2022/4/4
 * POJO: Course
 * @author YYF
 * @version 2.0
 */
@Entity
@Table(name = "T_COURSE")
@JsonIgnoreProperties({"handler","hibernateLazyInitializer"})
public class Course {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    int id;
    String courseCode;
    String courseName;
    int courseDepartment;
    int courseCredit;
    int courseDay;
    int courseStartTime;
    int courseEndTime;
    int courseClassroom;
    int courseCapacity;
    String courseTeacherNumber;

    String courseTerm;
    int courseType;
    int courseEnrollment;
    @Transient
    int[] courseAccess;

    public String getCourseTerm() {
        return courseTerm;
    }

    public void setCourseTerm(String courseTerm) {
        this.courseTerm = courseTerm;
    }

    public int getCourseType() {
        return courseType;
    }

    public void setCourseType(int courseType) {
        this.courseType = courseType;
    }

    public int[] getCourseAccess() {
        return courseAccess;
    }

    public void setCourseAccess(int[] courseAccess) {
        this.courseAccess = courseAccess;
    }

    public int getCourseEnrollment() {
        return courseEnrollment;
    }

    public void setCourseEnrollment(int courseEnrollment) {
        this.courseEnrollment = courseEnrollment;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public int getCourseDepartment() {
        return courseDepartment;
    }

    public void setCourseDepartment(int courseDepartment) {
        this.courseDepartment = courseDepartment;
    }

    public int getCourseCredit() {
        return courseCredit;
    }

    public void setCourseCredit(int courseCredit) {
        this.courseCredit = courseCredit;
    }

    public int getCourseStartTime() {
        return courseStartTime;
    }

    public void setCourseStartTime(int courseStartTime) {
        this.courseStartTime = courseStartTime;
    }

    public int getCourseDay() {
        return courseDay;
    }

    public void setCourseDay(int courseDay) {
        this.courseDay = courseDay;
    }

    public int getCourseEndTime() {
        return courseEndTime;
    }

    public void setCourseEndTime(int courseEndTime) {
        this.courseEndTime = courseEndTime;
    }

    public int getCourseClassroom() {
        return courseClassroom;
    }

    public void setCourseClassroom(int courseClassroom) {
        this.courseClassroom = courseClassroom;
    }

    public int getCourseCapacity() {
        return courseCapacity;
    }

    public void setCourseCapacity(int courseCapacity) {
        this.courseCapacity = courseCapacity;
    }

    public String getCourseTeacherNumber() {
        return courseTeacherNumber;
    }

    public void setCourseTeacherNumber(String courseTeacherNumber) {
        this.courseTeacherNumber = courseTeacherNumber;
    }
}
