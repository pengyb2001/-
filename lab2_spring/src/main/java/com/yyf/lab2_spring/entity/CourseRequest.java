package com.yyf.lab2_spring.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;

/**
 * 2022/4/10
 * POJO: CourseRequest
 * @author YYF
 * @version 1.0
 */
@Entity
@Table(name = "T_COURSE_REQUEST")
@JsonIgnoreProperties({"handler","hibernateLazyInitializer"})
public class CourseRequest {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "request_id")
    int requestId;
    int requestStatus;
    String courseName;
    int courseDepartmentNumber;
    int courseCredit;
    int courseDay;
    int courseStartTime;
    int courseEndTime;
    int courseClassroomId;
    int courseCapacity;
    String courseTeacherNumber;
    String courseTerm;
    int courseType;

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

    public String getCourseAccess() {
        return courseAccess;
    }

    public void setCourseAccess(String courseAccess) {
        this.courseAccess = courseAccess;
    }

    String courseAccess;


    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    public int getRequestStatus() {
        return requestStatus;
    }

    public void setRequestStatus(int requestStatus) {
        this.requestStatus = requestStatus;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public int getCourseDepartmentNumber() {
        return courseDepartmentNumber;
    }

    public void setCourseDepartmentNumber(int courseDepartment) {
        this.courseDepartmentNumber = courseDepartment;
    }

    public int getCourseCredit() {
        return courseCredit;
    }

    public void setCourseCredit(int courseCredit) {
        this.courseCredit = courseCredit;
    }

    public int getCourseDay() {
        return courseDay;
    }

    public void setCourseDay(int courseDay) {
        this.courseDay = courseDay;
    }

    public int getCourseStartTime() {
        return courseStartTime;
    }

    public void setCourseStartTime(int courseStartTime) {
        this.courseStartTime = courseStartTime;
    }

    public int getCourseEndTime() {
        return courseEndTime;
    }

    public void setCourseEndTime(int courseEndTime) {
        this.courseEndTime = courseEndTime;
    }

    public int getCourseClassroomId() {
        return courseClassroomId;
    }

    public void setCourseClassroomId(int courseClassroomId) {
        this.courseClassroomId = courseClassroomId;
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
