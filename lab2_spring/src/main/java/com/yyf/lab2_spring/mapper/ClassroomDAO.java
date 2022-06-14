package com.yyf.lab2_spring.mapper;

import com.yyf.lab2_spring.entity.CourseClassroom;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClassroomDAO extends JpaRepository<CourseClassroom, Integer> {
    List<CourseClassroom> getAllByIsAvailable(int isAvailable);
    CourseClassroom findByClassroom(String classroom);
    CourseClassroom findById(int id);
}
