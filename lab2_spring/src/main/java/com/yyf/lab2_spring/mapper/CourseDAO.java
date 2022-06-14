package com.yyf.lab2_spring.mapper;

import com.yyf.lab2_spring.entity.Course;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface CourseDAO extends JpaRepository<Course, Integer> {
    List<Course> getAllByCourseDepartment(int courseDepartment);
    List<Course> getAllByCourseTeacherNumber(String courseTeacherNumber);
    List<Course> getAllByCourseDayAndCourseClassroomAndCourseTerm(int courseDay, int courseClassroom, String courseTerm);

    List<Course> findByCourseCodeContainingAndCourseTerm(String courseCode, String courseTerm);
    List<Course> findByCourseNameContainingAndCourseTerm(String courseName, String courseTerm);
    List<Course> findByCourseTeacherNumberAndCourseTerm(String courseTeacherNumber, String courseTerm);

    List<Course> findByCourseClassroomAndCourseTerm(int courseClassroom, String courseTerm);
    List<Course> findByCourseDayAndCourseStartTimeAndCourseEndTimeAndCourseTerm(int courseDay, int courseStartTime, int courseEndTime, String courseTerm);
    List<Course> findByCourseDayAndCourseClassroomAndCourseStartTimeAndCourseEndTimeAndCourseTerm(int courseDay, int courseClassroom,int courseStartTime, int courseEndTime, String courseTerm);

    @Deprecated
    Course findByCourseCode(String courseCode);
    Course findByCourseCodeAndCourseTerm(String courseCode, String courseTerm);

    @Transactional
    void deleteByCourseCode(String courseCode);
    @Transactional
    void deleteByCourseCodeAndCourseTerm(String courseCode, String courseTerm);
}
