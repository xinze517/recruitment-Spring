package com.dao;

import com.pojo.EntBlackList;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface EntBlackListDAO {

    //entId,userId
    public void addItem(Map<String, Object> param);

    public void delItem(int blackListId);

    //entId,userId
    public EntBlackList getItem(Map<String, Object> param);

    public EntBlackList getItemByBlackListId(int blackListId);

    public List<EntBlackList> getList(int entId);
}
