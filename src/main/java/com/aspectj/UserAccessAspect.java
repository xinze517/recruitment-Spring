package com.aspectj;

import com.exception.UserAccessLimitException;
import com.pojo.UserAccount;
import com.service.UserService;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Aspect
@Component
public class UserAccessAspect {

    private final HttpSession session;
    private final UserService userService;

    @Autowired
    public UserAccessAspect(HttpSession session, UserService userService) {
        this.session = session;
        this.userService = userService;
    }

    //获取request
    private HttpServletRequest getRequest() {
        RequestAttributes ra = RequestContextHolder.getRequestAttributes();
        ServletRequestAttributes sra = (ServletRequestAttributes) ra;
        assert sra != null;
        return sra.getRequest();
    }

    //获取用户账户
    private UserAccount getUserAccount() {
        int userId = (int) session.getAttribute("user_id");
        return userService.getUserAccount(userId);
    }

    //用户基本信息访问权限检查
    @Before("execution(* com.controller.user.UserInfoController.* (..))")
    public void infoCheck() throws UserAccessLimitException {
        if (!getUserAccount().isAccess_basic_information()) {
            throw new UserAccessLimitException("info");
        }
    }

    //用户简历信息访问权限检查
    @Before("execution(* com.controller.user.UserResumeController.* (..))")
    public void resumeCheck() throws UserAccessLimitException {
        if (!getUserAccount().isAccess_resume()) {
            throw new UserAccessLimitException("resume");
        }
    }

    //跳转岗位申请页权限检查
    @Before("execution(* com.controller.user.UserApplyController.editApplyPage(..))")
    public void toApplyPageCheck() throws Exception {
        HttpServletRequest request = getRequest();
        UserAccount account = getUserAccount();
        String from = request.getParameter("from");

        switch (from) {
            case "recruit":
                if (!account.isAccess_apply()) {
                    throw new UserAccessLimitException("recruit");
                }
                break;
            case "complaint":
                if (!account.isAccess_complaint()) {
                    throw new UserAccessLimitException("complaint");
                }
                break;
            case "apply":
                if (!account.isAccess_apply_record()) {
                    throw new UserAccessLimitException("apply");
                }
                break;
            default:
                throw new Exception();
        }
    }

    //增加应聘记录/删除应聘记录
    @Before("execution(* com.controller.user.UserApplyController.editRecordApply(..))")
    public void applyCheck() throws UserAccessLimitException {
        HttpServletRequest request = getRequest();
        UserAccount account = getUserAccount();

        int recordId = Integer.parseInt(request.getParameter("record_id"));
        if (recordId == -1) {
            //增加应聘记录，需要应聘权限
            if (!account.isAccess_apply()) {
                throw new UserAccessLimitException("recruit");
            }
        } else {
            //删除应聘记录，需要访问应聘记录权限
            if (!account.isAccess_apply_record()) {
                throw new UserAccessLimitException("apply");
            }
        }
    }

    //投诉岗位权限检查
    @Before("execution(* com.controller.user.UserApplyController.editRecordComplaint(..))")
    public void complaintCheck() throws UserAccessLimitException {
        UserAccount account = getUserAccount();

        if (!account.isAccess_complaint()) {
            throw new UserAccessLimitException("complaint");
        }
    }

    //修改密码权限检查
    @Before("execution(* com.controller.user.UserSelfController.editPassword(..))")
    public void editPasswordCheck() throws UserAccessLimitException {
        UserAccount account = getUserAccount();

        if (!account.isAccess_edit_password()) {
            throw new UserAccessLimitException("account");
        }
    }
}
