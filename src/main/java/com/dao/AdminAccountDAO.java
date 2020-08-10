package com.dao;

import com.pojo.AdminAccount;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.Map;

@Repository
@Mapper
public interface AdminAccountDAO {

    public AdminAccount getAdminAccountByAccount(String account);

    public AdminAccount getAdminAccountById(int id);

    public String getPassword(String account);

    //account、password
    public void editPassword(Map<String, Object> param);

}
