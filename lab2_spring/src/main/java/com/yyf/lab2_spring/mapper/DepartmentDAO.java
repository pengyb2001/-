package com.yyf.lab2_spring.mapper;

import com.yyf.lab2_spring.entity.UserDepartment;
import com.yyf.lab2_spring.entity.UserSchool;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface DepartmentDAO extends JpaRepository<UserDepartment, Integer> {
    List<UserDepartment> findAllBySchool(UserSchool school);
    @Transactional
    void deleteByDepartmentName(String departmentName);

    UserDepartment findByDepartmentName(String departmentName);
}
