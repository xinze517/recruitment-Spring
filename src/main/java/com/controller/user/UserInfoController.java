package com.controller.user;

import com.pojo.UserInfo;
import com.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserInfoController extends UserBaseController {

    private final UserService userService;

    @Autowired
    public UserInfoController(UserService userService) {
        this.userService = userService;
    }

    //跳转用户基本信息填写页
    @RequestMapping("/editInfoPage")
    public String editInfoPage(HttpSession session, Model model) {
        //从session中获取ID
        int user_id = (int) session.getAttribute("user_id");
        //注入用户基本信息
        model.addAttribute("info", userService.getUserInfo(user_id));
        //跳转
        return "main_user_info";
    }

    //用户修改基本信息
    @RequestMapping("/editInfo")
    public String editInfo(HttpServletRequest request, UserInfo info) {
        //转换基本信息
        int user_id = (int) request.getSession().getAttribute("user_id");
        info.setUser_id(user_id);
        //检查是否存在基本信息
        if (userService.isInfoExist(user_id)) {
            //若已存在
            userService.editUserInfo(info);
        } else {
            //若不存在
            userService.addUserInfo(info);
        }
        //跳转个人信息主页
        return "forward:/user/mainPage";
    }

}
