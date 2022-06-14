package com.yyf.lab2_spring.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import javax.persistence.*;

@Entity
@Table(name = "T_USER_DEPARTMENT")
@JsonIgnoreProperties({ "handler","hibernateLazyInitializer" })
public class UserDepartment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "department_number")
    int departmentNumber;

    @ManyToOne
    @JoinColumn(name = "school")
    private UserSchool school;

    @Column
    String departmentName;

    public void setDepartmentNumber(int departmentNumber) {
        this.departmentNumber = departmentNumber;
    }
    public int getDepartmentNumber() {
        return departmentNumber;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }
    public String getDepartmentName() {
        return departmentName;
    }

    public void setSchool(UserSchool school) {
        this.school = school;
    }
    public UserSchool getSchool() {
        return school;
    }
}

