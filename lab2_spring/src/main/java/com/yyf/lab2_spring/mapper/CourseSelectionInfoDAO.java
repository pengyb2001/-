package com.yyf.lab2_spring.mapper;

import com.yyf.lab2_spring.entity.CourseSelectionInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface CourseSelectionInfoDAO extends JpaRepository<CourseSelectionInfo,Integer> {
    List<CourseSelectionInfo> findByStudentNumberAndCourseTermAndStatus(String studentNumber, String courseTerm, int status);

    List<CourseSelectionInfo> findByCourseCodeAndCourseTerm(String courseCode, String courseTerm);
    List<CourseSelectionInfo> findByCourseCodeAndCourseTermAndStatus(String courseCode, String courseTerm, int status);
    List<CourseSelectionInfo> findByCourseTerm(String courseTerm);

    CourseSelectionInfo findByStudentNumberAndCourseCodeContains(String studentNumber, String courseCode);

    @Transactional
    void deleteByStudentNumberAndCourseCodeAndCourseTerm(String studentNumber, String courseCode, String courseTerm);
}
