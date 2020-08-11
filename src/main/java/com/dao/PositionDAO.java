package com.dao;

import com.pojo.Position;
import com.pojo.PositionFull;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface PositionDAO {

    void addPosition(Position position);

    void editPosition(Position position);

    //positionId,status
    void editStatus(Map<String, Object> param);

    Position getPosition(int positionId);

    List<Position> getPositionsByEntId(int entId);

    List<Position> getPositionsByStatus(String status);

    List<Position> getPositions();

    List<PositionFull> getFullPositions();
}
