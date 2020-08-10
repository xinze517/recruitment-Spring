package com.service;

import com.pojo.Position;
import com.pojo.PositionFull;
import com.dao.PositionDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PositionService {
    private final PositionDAO positionDao;

    @Autowired
    public PositionService(PositionDAO positionDao) {
        this.positionDao = positionDao;
    }

    //添加岗位
    public void addPosition(Position position) {
        positionDao.addPosition(position);
    }

    //获取所有职位
    public List<Position> getPositions(int entId) {
        List<Position> positions = positionDao.getPositionsByEntId(entId);
        if (positions.size() == 0) {
            return null;
        } else {
            return positions;
        }
    }

    //获取单个职位
    public Position getPosition(int positionId) {
        return positionDao.getPosition(positionId);
    }

    //获取某个职位的名称
    public String getName(int positionId) {
        Position position = getPosition(positionId);

        if (position == null) {
            return null;
        } else {
            return position.getName();
        }
    }

    //获取某个岗位的状态
    public String getStatus(int positionId) {
        Position position = getPosition(positionId);

        if (position == null) {
            return null;
        } else {
            return position.getStatus();
        }
    }

    //检查某个岗位是否存在
    public boolean isPositionExist(int positionId) {
        return getPosition(positionId) != null;
    }

    //修改岗位
    public void editPosition(Position position) {
        positionDao.editPosition(position);
    }

    //修改岗位状态
    public void editStatus(int positionId, String status) {
        //添加至集合
        Map<String, Object> param = new HashMap<>();
        param.put("positionId", positionId);
        param.put("status", status);
        positionDao.editStatus(param);
    }

    //获取所有指定状态的岗位
    public List<Position> getPositions(String status) {
        List<Position> positions = positionDao.getPositionsByStatus(status);
        if (positions.size() == 0) {
            return null;
        } else {
            return positions;
        }
    }

    //获取所有职业
    public List<Position> getPositions() {
        List<Position> positions = positionDao.getPositions();
        if (positions.size() == 0) {
            return null;
        } else {
            return positions;
        }
    }

    //获取所有职业完整信息
    public List<PositionFull> getFullPositions() {
        List<PositionFull> positions = positionDao.getFullPositions();
        if (positions.size() == 0) {
            return null;
        } else {
            return positions;
        }
    }
}
