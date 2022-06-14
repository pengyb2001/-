package com.yyf.lab2_spring.entity;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;

@Entity
@Table(name = "T_COURSE_SELECTION_STATUS")
@JsonIgnoreProperties({"handler","hibernateLazyInitializer"})
public class CourseSelectionStatus {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    int id;
    int round;

    public  int getId() {
        return id;
    }

    public  int getRound() {
        return round;
    }

    public void setRound(int round) {
        this.round = round;
    }

}
