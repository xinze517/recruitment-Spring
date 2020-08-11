package com.dao;

import com.pojo.UserResume;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface UserResumeDAO {

    void addResume(UserResume resume);

    void editResume(UserResume resume);

    UserResume getUserResume(int id);

}
