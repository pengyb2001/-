package com.yyf.lab2_spring.mapper;

import com.yyf.lab2_spring.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;


/**
 * 2022/3/3, Created by yyf
 * Mapper of the entity User
 */
@Repository
public interface UserDAO extends JpaRepository<User,Integer> {
    User findByNumber(String number);
    User findByIdentity(String identity);

    User getByNumberAndPassword(String number,String password);

    List<User> getAllByType(int type);
    List<User> findByNameContainingAndType(String name, int type);

    @Transactional
    void deleteByNumber(String number);
}
