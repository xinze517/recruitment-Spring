package com.dao;

import com.pojo.Position;
import com.pojo.PositionFull;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface PositionDAO {

    public void addPosition(Position position);

    public void editPosition(Position position);

    //positionId,status
    public void editStatus(Map<String, Object> param);

    public Position getPosition(int positionId);

    public List<Position> getPositionsByEntId(int entId);

    public List<Position> getPositionsByStatus(String status);

    public List<Position> getPositions();

    public List<PositionFull> getFullPositions();
}
