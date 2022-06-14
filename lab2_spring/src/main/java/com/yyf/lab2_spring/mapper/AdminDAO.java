package com.yyf.lab2_spring.mapper;

import com.yyf.lab2_spring.entity.Admin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminDAO extends JpaRepository<Admin,Integer> {
    Admin findByAdminNo(String adminNo);

    Admin getByAdminNoAndAdminPassword(String adminNo,String adminPassword);
}
