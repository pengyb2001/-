package com.yyf.lab2_spring.util;

import com.yyf.lab2_spring.entity.Course;

public class CourseConflict {
    public static Boolean isCourseConflict(Course courseOne, Course courseTwo) {
        int maxStartTime = Math.max(courseOne.getCourseStartTime(), courseTwo.getCourseStartTime());
        int minEndTime = Math.min(courseOne.getCourseEndTime(), courseTwo.getCourseEndTime());
        return (courseOne.getCourseDay() == courseTwo.getCourseDay()) && (maxStartTime <= minEndTime); //course conflict exists
    }
}
