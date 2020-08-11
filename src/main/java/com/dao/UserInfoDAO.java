package com.dao;

import com.pojo.UserInfo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface UserInfoDAO {

    void addInfo(UserInfo info);

    void editInfo(UserInfo info);

    UserInfo getUserInfo(int id);

    List<UserInfo> getUserInfos();

}
