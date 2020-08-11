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
    void addItem(Map<String, Object> param);

    void delItem(int blackListId);

    //entId,userId
    EntBlackList getItem(Map<String, Object> param);

    EntBlackList getItemByBlackListId(int blackListId);

    List<EntBlackList> getList(int entId);
}
