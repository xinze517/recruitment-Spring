package com.service;

import com.pojo.*;
import com.dao.EntAccountDAO;
import com.dao.EntInfoDAO;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class EntService {
    private final EntAccountDAO entAccountDAO;
    private final EntInfoDAO entInfoDAO;

    @Autowired
    public EntService(EntAccountDAO entAccountDAO, EntInfoDAO entInfoDAO) {
        this.entAccountDAO = entAccountDAO;
        this.entInfoDAO = entInfoDAO;
    }

    //添加用户
    public boolean addEnt(String account, String password) {
        String hashed = BCrypt.hashpw(password, BCrypt.gensalt());
        //添加至集合
        Map<String, Object> param = new HashMap<>();
        param.put("account", account);
        param.put("password", hashed);
        //添加
        int effectRow = entAccountDAO.addEnt(param);
        //判定结果
        return effectRow == 1;
    }

    //修改密码
    public boolean editPassword(int id, String oldPassword, String newPassword) {
        boolean result = false;
        //校验旧密码
        String oldHashed = entAccountDAO.getPassword(id);
        if (BCrypt.checkpw(oldPassword, oldHashed)) {
            //校验成功，修改为新密码
            String newHashed = BCrypt.hashpw(newPassword, BCrypt.gensalt());
            //添加至集合
            Map<String, Object> param = new HashMap<>();
            param.put("id", id);
            param.put("password", newHashed);
            entAccountDAO.editPassword(param);
            //修改成功
            result = true;
        }
        return result;
    }

    //修改企业资质
    public void editStatus(int id, String status) {
        //添加至集合
        Map<String, Object> param = new HashMap<>();
        param.put("id", id);
        param.put("status", status);
        entAccountDAO.editStatus(param);
    }

    //获取企业资质
    public String getStatus(int id) {
        EntAccount entAccount = this.getEntAccount(id);
        if (entAccount == null) {
            return null;
        } else {
            return entAccount.getStatus();
        }
    }

    //获取企业ID
    public int getEntId(String account) {
        Integer id = entAccountDAO.getId(account);
        if (id == null) {
            return -1;
        } else {
            return id;
        }
    }

    //获取企业名称
    public String getEntName(int id) {
        return getEntInfo(id).getName();
    }

    //查看账户是否存在
    public boolean isEntExist(String account) {
        return getEntId(account) != -1;
    }

    //通过账户密码获取账户
    public EntAccount getEntAccount(String account, String password) {
        EntAccount entAccount = null;
        //获取ID
        int id = entAccountDAO.getId(account);
        //获取密码
        String hashed = entAccountDAO.getPassword(id);
        if (BCrypt.checkpw(password, hashed)) {
            //密码正确
            entAccount = entAccountDAO.getEntAccount(id);
        }
        return entAccount;
    }

    //通过企业ID获取账户
    public EntAccount getEntAccount(int id) {
        return entAccountDAO.getEntAccount(id);
    }

    //获取企业注册信息
    public EntInfo getEntInfo(int id) {
        return entInfoDAO.getEntInfo(id);
    }

    //查看是否存在企业注册信息
    public boolean isInfoExist(int id) {
        return getEntInfo(id) != null;
    }

    //添加企业注册信息
    public void addEntInfo(EntInfo info) {
        entInfoDAO.addInfo(info);
    }

    //修改企业注册信息
    public void editEntInfo(EntInfo info) {
        entInfoDAO.editInfo(info);
    }

    //获取所有企业注册信息
    public List<EntInfo> getEntInfos() {
        List<EntInfo> entInfos = entInfoDAO.getEntInfos();
        if (entInfos.size() == 0) {
            return null;
        } else {
            return entInfos;
        }
    }
}
