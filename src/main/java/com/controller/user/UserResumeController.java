package com.controller.user;

import com.pojo.UserResume;
import com.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserResumeController extends UserBaseController {

    private final UserService userService;

    @Autowired
    public UserResumeController(UserService userService) {
        this.userService = userService;
    }

    //跳转简历填写页
    @RequestMapping("/editResumePage")
    public String editResumePage(HttpSession session, Model model) {
        //从session中获取ID
        int userId = (int) session.getAttribute("user_id");
        //注入用户简历信息
        model.addAttribute("resume", userService.getUserResume(userId));
        //跳转
        return "main_user_resume";
    }

    //用户修改简历信息
    @RequestMapping("/editResume")
    public String editResume(HttpSession session, UserResume resume) {
        //获取信息
        int user_id = (int) session.getAttribute("user_id");
        resume.setUser_id(user_id);
        //检查简历是否存在
        if (userService.isResumeExist(user_id)) {
            //存在则修改
            userService.editResume(resume);
        } else {
            //不存在则添加
            userService.addResume(resume);
        }
        //跳转主页
        return "forward:/user/mainPage";
    }

}
