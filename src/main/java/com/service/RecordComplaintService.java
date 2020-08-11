package com.service;

import com.pojo.RecordComplaint;
import com.dao.RecordComplaintDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RecordComplaintService {

    private final RecordComplaintDAO complaintDao;

    @Autowired
    public RecordComplaintService(RecordComplaintDAO complaintDao) {
        this.complaintDao = complaintDao;
    }

    //增加记录
    public void addRecord(RecordComplaint complaint) {
        complaintDao.addRecord(complaint);
    }

    //删除记录
    public void delRecord(int recordId) {
        complaintDao.delRecord(recordId);
    }

    //修改记录状态
    public void editStatus(int recordId, String status) {
        //添加至集合
        Map<String, Object> param = new HashMap<>();
        param.put("recordId", recordId);
        param.put("status", status);
        complaintDao.editStatus(param);
    }

    //检查某一记录是否存在
    public boolean isRecordExist(int recordId) {
        return getComplaint(recordId) != null;
    }

    //检查某一记录是否存在
    public boolean isRecordExist(int userId, int positionId) {
        return getComplaint(userId, positionId) != null;
    }

    //获取指定记录的ID
    public int getRecordId(int userId, int positionId) {
        RecordComplaint complaint = getComplaint(userId, positionId);
        if (complaint == null) {
            return -1;
        } else {
            return complaint.getRecord_id();
        }
    }

    //获取指定的记录的状态
    public String getStatus(int recordId) {
        RecordComplaint complaint = getComplaint(recordId);
        if (complaint == null) {
            return null;
        } else {
            return complaint.getStatus();
        }
    }

    //获取指定记录的状态
    public String getStatus(int userId, int positionId) {
        RecordComplaint complaint = getComplaint(userId, positionId);
        if (complaint == null) {
            return null;
        } else {
            return complaint.getStatus();
        }
    }

    //获取指定记录
    public RecordComplaint getComplaint(int recordId) {
        return complaintDao.getRecordByRecordId(recordId);
    }

    //获取指定记录
    public RecordComplaint getComplaint(int userId, int positionId) {
        //添加至集合
        Map<String, Object> param = new HashMap<>();
        param.put("userId", userId);
        param.put("positionId", positionId);
        return complaintDao.getRecordByUserIdAndPositionId(param);
    }

    //获取所有记录
    public List<RecordComplaint> getComplaints() {
        return complaintDao.getAllRecords();
    }

    //获取某一个人的所有记录
    public List<RecordComplaint> getComplaints(int userId) {
        List<RecordComplaint> complaints = complaintDao.getRecordsByUserId(userId);
        if (complaints.size() == 0) {
            return null;
        } else {
            return complaints;
        }
    }

}
