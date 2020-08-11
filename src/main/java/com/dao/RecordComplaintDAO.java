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

    void addRecord(RecordComplaint complaint);

    void delRecord(int recordId);

    //recordId,status
    void editStatus(Map<String, Object> param);

    RecordComplaint getRecordByRecordId(int recordId);

    //userId,positionId
    RecordComplaint getRecordByUserIdAndPositionId(Map<String, Object> param);

    List<RecordComplaint> getAllRecords();

    List<RecordComplaint> getRecordsByUserId(int userId);

}
