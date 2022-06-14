package com.yyf.lab2_spring.mapper;

import com.yyf.lab2_spring.entity.CourseRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CourseRequestDAO extends JpaRepository<CourseRequest, Integer> {
    List<CourseRequest> getAllByCourseTeacherNumber(String teacherNumber);

}
