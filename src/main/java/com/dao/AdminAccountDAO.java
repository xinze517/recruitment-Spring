package com.dao;

import com.pojo.AdminAccount;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
@Mapper
public interface AdminAccountDAO {

     AdminAccount getAdminAccountByAccount(String account);

     AdminAccount getAdminAccountById(int id);

     String getPassword(String account);

    //account、password
     void editPassword(Map<String, Object> param);

}
