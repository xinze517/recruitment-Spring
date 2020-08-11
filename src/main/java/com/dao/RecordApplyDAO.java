package com.dao;

import com.pojo.RecordApply;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface RecordApplyDAO {

    void addRecord(RecordApply recordApply);

    //recordId,status
    void editRecord(Map<String, Object> param);

    //删除某一条记录
    void delRecordByRecordId(int recordId);

    //删除某一条记录
    //userId,positionId
    void delRecordByUserIdAndPositionId(Map<String, Object> param);

    //删除某个人对于某一家企业的求职记录
    //userId,entId
    void delRecordsByUserIdAndEntId(Map<String, Object> param);

    //通过记录ID获取单条记录
    RecordApply getRecordByRecordId(int recordId);

    //通过用户ID+岗位ID获取单条记录
    //userId,positionId
    RecordApply getRecordByUserIdAndPositionId(Map<String, Object> param);

    //通过用户ID获取记录列表
    List<RecordApply> getRecordsByUserId(int userId);

    //通过企业ID获取记录列表
    List<RecordApply> getEntRecordsByEntId(int entId);

    //获取所有记录
    List<RecordApply> getAllRecords();
}
