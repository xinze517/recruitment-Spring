package com.service;

import com.pojo.AdminAccount;
import com.dao.AdminAccountDAO;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class AdminService {

    private final AdminAccountDAO adminAccountDAO;

    @Autowired
    public AdminService(AdminAccountDAO adminAccountDAO) {
        this.adminAccountDAO = adminAccountDAO;
    }

    //通过账户密码获取整个账号
    public AdminAccount getAdminAccount(String account, String password) {
        AdminAccount adminAccount = null;
        String hashed = adminAccountDAO.getPassword(account);
        //校验密码
        if (BCrypt.checkpw(password, hashed)) {
            //检查通过
            adminAccount = adminAccountDAO.getAdminAccountByAccount(account);
        }
        return adminAccount;
    }

    //通过账号ID获取整个账号
    public AdminAccount getAdminAccount(int adminId) {
        return adminAccountDAO.getAdminAccountById(adminId);
    }

    //检查账户是否存在
    public boolean isExist(String account) {
        return getAdminId(account) != -1;
    }

    //校验账户密码是否正确
    public boolean login(String account, String password) {
        return getAdminAccount(account, password) != null;
    }

    //获取账户ID
    public int getAdminId(String account) {
        int id = -1;
        AdminAccount adminAccount = adminAccountDAO.getAdminAccountByAccount(account);
        if (adminAccount != null) {
            id = adminAccount.getAdmin_id();
        }
        return id;
    }

    //修改密码(账号 - 新密码)
    public void editPassword(String account, String newPassword) {
        String hashed = BCrypt.hashpw(newPassword, BCrypt.gensalt());
        Map<String, Object> param = new HashMap<>();
        param.put("account", account);
        param.put("password", hashed);
        adminAccountDAO.editPassword(param);
    }
}
