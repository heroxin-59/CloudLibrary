package com.heroxin.mapper;

import com.heroxin.daomain.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

/**
 * @author Heroxin
 * @create 2022-05-21-10:32
 * @Description:
 */
@Mapper
public interface UserMapper {

    @Select("select * from user where user_email=#{user_email} and user_password=#{user_password} and user_name=#{user_name}")
    User query(User user);

    @Insert("insert into user values(#{user_id},#{user_name},#{user_password},#{user_email},#{user_role},#{user_status})")
    void insert(User user);
}
