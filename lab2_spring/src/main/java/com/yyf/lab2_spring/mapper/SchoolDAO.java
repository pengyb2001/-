package com.yyf.lab2_spring.mapper;


import com.yyf.lab2_spring.entity.UserSchool;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

/**
 * Mapper of the entity UserSchool
 */
@Repository
public interface SchoolDAO extends JpaRepository<UserSchool, Integer> {
    UserSchool getBySchoolId(int schoolId);

    UserSchool findBySchoolName(String schoolName);

    @Transactional
    void deleteBySchoolName(String schoolName);
}
