package com.controller.admin;

import com.pojo.UserAccount;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * 管理用户相关方法
 */

@Controller
@RequestMapping("/admin")
public class ManageUserController extends AdminBaseController{

    private final UserService userService;

    @Autowired
    public ManageUserController(UserService userService) {
        this.userService = userService;
    }

    //跳转个人权限管理页面
    @RequestMapping("/editUserAccessPage")
    public String editUserAccessPage(Model model, int userId) {
        //获取个人权限
        UserAccount userAccount = userService.getUserAccount(userId);
        //设置
        model.addAttribute("userAccount", userAccount);
        //转发
        return "main_admin_manage_user";
    }

    //修改个人权限
    @RequestMapping("/editUserAccess")
    public String editUserAccess(HttpServletRequest request, String tab, UserAccount userAccount) {
        //修改权限
        userService.editUserAccess(userAccount);
        //跳转主页
        request.setAttribute("tab", tab);
        return "forward:/admin/mainPage";
    }

}
