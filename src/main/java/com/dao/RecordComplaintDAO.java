package com.dao;

import com.pojo.RecordComplaint;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface RecordComplaintDAO {

    public void addRecord(RecordComplaint complaint);

    public void delRecord(int recordId);

    //recordId,status
    public void editStatus(Map<String, Object> param);

    public RecordComplaint getRecordByRecordId(int recordId);

    //userId,positionId
    public RecordComplaint getRecordByUserIdAndPositionId(Map<String, Object> param);

    public List<RecordComplaint> getAllRecords();

    public List<RecordComplaint> getRecordsByUserId(int userId);

}
