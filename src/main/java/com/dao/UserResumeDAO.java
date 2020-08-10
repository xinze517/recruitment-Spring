package com.dao;

import com.pojo.UserResume;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.SQLException;

@Repository
@Mapper
public interface UserResumeDAO {

    public void addResume(UserResume resume);

    public void editResume(UserResume resume);

    public UserResume getUserResume(int id);

}
