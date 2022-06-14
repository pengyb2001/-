package com.yyf.lab2_spring.mapper;

import com.yyf.lab2_spring.entity.CourseSelectionRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CourseSelectionRequestDAO extends JpaRepository<CourseSelectionRequest, Integer> {
    List<CourseSelectionRequest> findByStudentNumber(String studentNumber);
}
