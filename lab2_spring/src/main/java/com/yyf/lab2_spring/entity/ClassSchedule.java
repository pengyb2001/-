package com.yyf.lab2_spring.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;



@Entity
@Table(name = "T_CLASS_SCHEDULE")
@JsonIgnoreProperties({"handler","hibernateLazyInitializer"})
public class ClassSchedule{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    int sequence;
    String startTime;
    String endTime;

    public int getSequence() {return sequence; }

    public  void setSequence(int sequence) {this.sequence=sequence; }

    public  String getStartTime(){return startTime;}

    public void setStartTime(String startTime){this.startTime =startTime;}

    public  String getEndTime(){return endTime;}

    public void setEndTime(String endTime){this.endTime =endTime;}
}
