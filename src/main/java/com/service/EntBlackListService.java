package com.service;

import com.pojo.EntBlackList;
import com.dao.EntBlackListDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class EntBlackListService {

    private final EntBlackListDAO blackListDAO;

    @Autowired
    public EntBlackListService(EntBlackListDAO blackListDAO) {
        this.blackListDAO = blackListDAO;
    }

    public void addItem(EntBlackList blackList) {
        blackListDAO.addItem(blackList);
    }

    //删除指定黑名单
    public void delItem(int blackListId) {
        blackListDAO.delItem(blackListId);
    }

    public EntBlackList getItem(int blackListId) {
        return blackListDAO.getItemByBlackListId(blackListId);
    }

    public EntBlackList getItem(int entId, int userId) {
        //添加至集合
        Map<String, Object> param = new HashMap<>();
        param.put("entId", entId);
        param.put("userId", userId);
        return blackListDAO.getItem(param);
    }

    public List<EntBlackList> getList(int entId) {
        List<EntBlackList> entBlackLists = blackListDAO.getList(entId);
        if (entBlackLists.size() == 0) {
            return null;
        } else {
            return entBlackLists;
        }
    }

    public int getBlackListId(int entId, int userId) {
        EntBlackList item = getItem(entId, userId);
        if (item == null) {
            return -1;
        } else {
            return item.getBlack_list_id();
        }
    }

    public boolean isItemExist(int blackListId) {
        return getItem(blackListId) != null;
    }

    public boolean isItemExist(int entId, int userId) {
        return getItem(entId, userId) != null;
    }
}
