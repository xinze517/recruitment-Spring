package com.dao;

import com.pojo.EntInfo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@Repository
@Mapper
public interface EntInfoDAO {

    public void addInfo(EntInfo info);

    public void editInfo(EntInfo info);

    public EntInfo getEntInfo(int id);

    public List<EntInfo> getEntInfos();
}
