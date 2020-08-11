package com.dao;

import com.pojo.EntAccount;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

@Repository
@Mapper
public interface EntAccountDAO {

    //新增账户(account、password)
    int addEnt(Map<String, Object> param);

    //修改账户密码(id、password)
    void editPassword(Map<String, Object> param);

    //修改账户状态(id、status)
    void editStatus(Map<String, Object> param);

    //获取账户ID
    Integer getId(String account);

    //获取登录账户
    String getAccount(int id);

    //获取密码哈希字符串
    String getPassword(int id);

    //获取完整账户信息
    EntAccount getEntAccount(int id);
}
