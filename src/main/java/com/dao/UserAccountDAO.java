package com.dao;

import com.pojo.UserAccount;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.Map;

@Repository
@Mapper
public interface UserAccountDAO {

    //新增用户账号
    //account,password
    public void addUser(Map<String, Object> param);

    //修改用户权限
    public void editUserAccess(UserAccount userAccount);

    //修改密码
    //id,password
    public int editPassword(Map<String, Object> param);

    //通过登录账户获取用户ID
    public Integer getId(String account);

    //通过用户ID获取登录账户
    public String getAccount(int id);

    //通过用户ID获取用户全部账户信息
    public UserAccount getUserAccount(int id);

    //根据账号获取密码哈希字符串
    public String getPassword(int id);

}
