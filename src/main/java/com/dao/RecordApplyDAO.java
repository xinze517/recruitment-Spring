package com.dao;

import com.pojo.RecordApply;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface RecordApplyDAO {

    public void addRecord(RecordApply recordApply);

    //recordId,status
    public void editRecord(Map<String, Object> param);

    //删除某一条记录
    public void delRecordByRecordId(int recordId);

    //删除某一条记录
    //userId,positionId
    public void delRecordByUserIdAndPositionId(Map<String, Object> param);

    //删除某个人对于某一家企业的求职记录
    //userId,entId
    public void delRecordsByUserIdAndEntId(Map<String, Object> param);

    //通过记录ID获取单条记录
    public RecordApply getRecordByRecordId(int recordId);

    //通过用户ID+岗位ID获取单条记录
    //userId,positionId
    public RecordApply getRecordByUserIdAndPositionId(Map<String, Object> param);

    //通过用户ID获取记录列表
    public List<RecordApply> getRecordsByUserId(int userId);

    //通过企业ID获取记录列表
    public List<RecordApply> getEntRecordsByEntId(int entId);

    //获取所有记录
    public List<RecordApply> getAllRecords();
}
