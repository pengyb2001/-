package com.yyf.lab2_spring.mapper;

import com.yyf.lab2_spring.entity.CourseAccessSetting;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface CourseAccessSettingDAO extends JpaRepository<CourseAccessSetting, Integer> {
    @Transactional
    void deleteAllByCourseCodeAndCourseTerm(String courseCode, String courseTerm);

    List<CourseAccessSetting> findAllByCourseCodeAndCourseTerm(String courseCode, String courseTerm);
    List<CourseAccessSetting> findAllByDepartmentNumber(int departmentNumber);

    CourseAccessSetting getByCourseCodeAndCourseTermAndDepartmentNumber(String courseCode, String courseTerm, int departmentNumber);
}
