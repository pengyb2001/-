package com.yyf.lab2_spring.mapper;

import com.yyf.lab2_spring.entity.LoginInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * 2022/3/12, Created by yyf
 * Mapper of the entity LoginInfo
 */
@Repository
public interface LoginInfoDAO extends JpaRepository<LoginInfo,Integer> {
    boolean existsByUserNumber(String userNumber);

}
