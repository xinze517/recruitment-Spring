package com.service;

import com.pojo.RecordApply;
import com.dao.RecordApplyDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RecordApplyService {

    private final RecordApplyDAO applyDAO;

    @Autowired
    public RecordApplyService(RecordApplyDAO applyDAO) {
        this.applyDAO = applyDAO;
    }

    //获取某一人的所有应聘记录
    public List<RecordApply> getRecordApplyList(int userId) {
        List<RecordApply> recordApplyList = applyDAO.getRecordsByUserId(userId);
        if (recordApplyList.size() == 0) {
            return null;
        } else {
            return recordApplyList;
        }
    }

    //获取某一企业的所有应聘记录
    public List<RecordApply> getEntRecordApplyList(int entId) {
        return applyDAO.getEntRecordsByEntId(entId);
    }

    //检查某人是否存在某一岗位的应聘记录
    public boolean isRecordExist(int userId, int positionId) {
        return getRecordApply(userId, positionId) != null;
    }

    //检查某人是否存在某一岗位的应聘记录
    public boolean isRecordExist(int recordId) {
        return getRecordApply(recordId) != null;
    }

    //获取某人在某一职位的应聘记录
    public RecordApply getRecordApply(int userId, int positionId) {
        //添加至集合
        Map<String, Object> param = new HashMap<>();
        param.put("userId", userId);
        param.put("positionId", positionId);
        return applyDAO.getRecordByUserIdAndPositionId(param);
    }

    //获取某一条指定记录
    public RecordApply getRecordApply(int recordId) {
        return applyDAO.getRecordByRecordId(recordId);
    }

    //获取某人在某一职位的应聘ID(失败返回-1)
    public int getRecordId(int userId, int positionId) {
        RecordApply recordApply = getRecordApply(userId, positionId);
        if (recordApply == null) {
            return -1;
        } else {
            return recordApply.getRecord_id();
        }
    }

    //修改某一应聘记录的状态
    public void editStatus(int recordId, String status) {
        Map<String, Object> param = new HashMap<>();
        param.put("recordId", recordId);
        param.put("status", status);
        applyDAO.editRecord(param);
    }

    //获取某人在某一岗位的应聘状态
    public String getStatus(int userId, int positionId) {
        RecordApply recordApply = getRecordApply(userId, positionId);
        if (recordApply == null) {
            return null;
        } else {
            return recordApply.getStatus();
        }
    }

    //获取某一记录的应聘状态
    public String getStatus(int recordId) {
        RecordApply recordApply = getRecordApply(recordId);
        if (recordApply == null) {
            return null;
        } else {
            return recordApply.getStatus();
        }
    }

    //添加应聘记录
    public void addRecord(RecordApply recordApply) {
        applyDAO.addRecord(recordApply);
    }

    //删除应聘记录
    public void delRecord(int recordId) {
        applyDAO.delRecordByRecordId(recordId);
    }

    //删除应聘记录
    public void delRecord(int userId, int positionId) {
        //添加至集合
        Map<String, Object> param = new HashMap<>();
        param.put("userId", userId);
        param.put("positionId", positionId);
        applyDAO.delRecordByUserIdAndPositionId(param);
    }

    //删除某人对于某一企业的所有求职记录
    public void delRecords(int userId, int entId) {
        //添加至集合
        Map<String, Object> param = new HashMap<>();
        param.put("userId", userId);
        param.put("entId", entId);
        applyDAO.delRecordsByUserIdAndEntId(param);
    }
}
