package com.service;

import com.pojo.UserAccount;
import com.pojo.UserInfo;
import com.pojo.UserResume;
import com.dao.UserAccountDAO;
import com.dao.UserInfoDAO;
import com.dao.UserResumeDAO;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserService {
    private final UserAccountDAO accountDAO;
    private final UserInfoDAO infoDAO;
    private final UserResumeDAO resumeDAO;

    @Autowired
    public UserService(UserAccountDAO accountDAO, UserInfoDAO infoDAO, UserResumeDAO resumeDAO) {
        this.accountDAO = accountDAO;
        this.infoDAO = infoDAO;
        this.resumeDAO = resumeDAO;
    }

    //添加账户
    public void addUser(String account, String password) {
        //先生成加密字符串
        String hashed = BCrypt.hashpw(password, BCrypt.gensalt());
        //添加至集合
        Map<String, Object> param = new HashMap<>();
        param.put("account", account);
        param.put("password", hashed);
        //添加用户
        accountDAO.addUser(param);
    }

    //查看账户是否存在
    public boolean isUserExist(String account) {
        return getUserId(account) != -1;
    }

    //通过账户密码获取账户
    public UserAccount getUserAccount(String account, String password) {
        //获取ID
        int id = accountDAO.getId(account);
        //获取该账户对应密码哈希字符串
        String hashed = accountDAO.getPassword(id);
        //检查
        if (BCrypt.checkpw(password, hashed)) {
            //密码正确
            return accountDAO.getUserAccount(id);
        }
        else {
            return null;
        }
    }

    //通过用户ID获取账户
    public UserAccount getUserAccount(int id) {
        return accountDAO.getUserAccount(id);
    }

    //修改用户密码
    public boolean editPassword(int id, String oldPassword, String newPassword) {
        boolean result = false;
        String oldHashed = accountDAO.getPassword(id);
        //检查旧密码
        if (BCrypt.checkpw(oldPassword, oldHashed)) {
            //密码校验通过，修改为新密码
            String newHashed = BCrypt.hashpw(newPassword, BCrypt.gensalt());
            //添加至集合
            Map<String, Object> param = new HashMap<>();
            param.put("id", id);
            param.put("password", newHashed);
            //修改密码
            int effectRow = accountDAO.editPassword(param);
            //校验结果
            result = (effectRow == 1);
        }
        return result;
    }

    //修改用户权限
    public void editUserAccess(UserAccount userAccount) {
        accountDAO.editUserAccess(userAccount);
    }

    //获取用户ID
    public int getUserId(String account) {
        Integer id = accountDAO.getId(account);
        if (id != null) {
            return id;
        } else {
            return -1;
        }
    }

    //检查用户基本信息是否已存在
    public boolean isInfoExist(int id) {
        return getUserInfo(id) != null;
    }

    //获取用户基本信息
    public UserInfo getUserInfo(int id) {
        return infoDAO.getUserInfo(id);
    }

    //获取用户姓名
    public String getUserName(int id) {
        UserInfo userInfo = getUserInfo(id);

        if (userInfo == null) {
            return null;
        } else {
            return userInfo.getName();
        }
    }

    //获取所有用户基本信息
    public List<UserInfo> getUserInfos() {
        List<UserInfo> userInfos = infoDAO.getUserInfos();
        if (userInfos.size() == 0) {
            return null;
        } else {
            return userInfos;
        }
    }

    //添加用户基本信息
    public void addUserInfo(UserInfo info) {
        infoDAO.addInfo(info);
    }

    //修改用户基本信息
    public void editUserInfo(UserInfo info) {
        infoDAO.editInfo(info);
    }

    //获取用户简历
    public UserResume getUserResume(int id) {
        return resumeDAO.getUserResume(id);
    }


    //检查用户简历是否存在
    public boolean isResumeExist(int id) {
        return getUserResume(id) != null;
    }

    //添加用户简历
    public void addResume(UserResume resume) {
        resumeDAO.addResume(resume);
    }

    //修改用户简历
    public void editResume(UserResume resume) {
        resumeDAO.editResume(resume);
    }

}
