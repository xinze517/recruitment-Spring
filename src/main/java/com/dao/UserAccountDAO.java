package com.dao;

import com.pojo.UserAccount;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
@Mapper
public interface UserAccountDAO {

    //新增用户账号
    //account,password
    void addUser(Map<String, Object> param);

    //修改用户权限
    void editUserAccess(UserAccount userAccount);

    //修改密码
    //id,password
    int editPassword(Map<String, Object> param);

    //通过登录账户获取用户ID
    Integer getId(String account);

    //通过用户ID获取登录账户
    String getAccount(int id);

    //通过用户ID获取用户全部账户信息
    UserAccount getUserAccount(int id);

    //根据账号获取密码哈希字符串
    String getPassword(int id);

}
