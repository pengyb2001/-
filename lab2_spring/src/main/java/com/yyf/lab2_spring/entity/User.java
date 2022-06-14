package com.yyf.lab2_spring.entity;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import javax.persistence.*;

@Entity
@Table(name = "T_USER")
@JsonIgnoreProperties({"handler","hibernateLazyInitializer"})

/**
 * POJO User
 */
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    int id;

    @ManyToOne
    @JoinColumn(name = "department")
    private UserDepartment department;

    @Column(name = "number")
    String number;
    @Column(name = "password")
    String password;
    @Column(name = "type")
    int type;
    @Column
    String name;
    @Column
    String identity;
    @Column
    String mobile;
    @Column
    String email;
    int status;

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getId() { return id;}
    public void setId(int id) { this.id = id; }

    public String getNumber() {
        return number;
    }
    public void setNumber(String number) {
        this.number = number;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public int getType() {
        return type;
    }
    public void setType(int type) {
        this.type = type;
    }

    public void setName(String name) {
        this.name = name;
    }
    public String getName() {
        return name;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
    public String getMobile() {
        return mobile;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }
    public String getIdentity() {
        return identity;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    public String getEmail() {
        return email;
    }

    public UserDepartment getDepartment() {
        return department;
    }
    public void setDepartment(UserDepartment department) {
        this.department = department;
    }
}
