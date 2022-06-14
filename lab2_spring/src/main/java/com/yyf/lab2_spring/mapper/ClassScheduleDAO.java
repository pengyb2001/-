package com.yyf.lab2_spring.mapper;

import com.yyf.lab2_spring.entity.ClassSchedule;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClassScheduleDAO extends JpaRepository<ClassSchedule,Integer> {
    List<ClassSchedule> findAllBySequence(int sequence);
    ClassSchedule findBySequence(int sequence);
}
