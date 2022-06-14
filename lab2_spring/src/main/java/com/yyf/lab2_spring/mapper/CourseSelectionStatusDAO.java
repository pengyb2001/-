package com.yyf.lab2_spring.mapper;


import com.yyf.lab2_spring.entity.CourseSelectionStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository

public interface CourseSelectionStatusDAO extends JpaRepository<CourseSelectionStatus,Integer> {
    CourseSelectionStatus findById(int id);

}

