package com.dao;

import com.pojo.EntBlackList;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface EntBlackListDAO {

    void addItem(EntBlackList blackList);

    void delItem(int blackListId);

    //entId,userId
    EntBlackList getItem(Map<String, Object> param);

    EntBlackList getItemByBlackListId(int blackListId);

    List<EntBlackList> getList(int entId);
}
