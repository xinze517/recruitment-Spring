package com.dao;

import com.pojo.UserInfo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@Repository
@Mapper
public interface UserInfoDAO {

    public void addInfo(UserInfo info);

    public void editInfo(UserInfo info);

    public UserInfo getUserInfo(int id);

    public List<UserInfo> getUserInfos();

}
