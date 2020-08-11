package com.dao;

import com.pojo.EntInfo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface EntInfoDAO {

    void addInfo(EntInfo info);

    void editInfo(EntInfo info);

    EntInfo getEntInfo(int id);

    List<EntInfo> getEntInfos();
}
