package com.controller.user;

import com.pojo.*;
import com.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/indexPage")
    public String indexPage(HttpServletRequest request) {
        request.setAttribute("tab", "user");
        return "index";
    }
    
    //跳转用户注册
    @RequestMapping("/registerPage")
    public String registerPage() {
        return "register_user";
    }

    //用户注册
    @RequestMapping("/register")
    public String register(HttpServletRequest request, String account, String password) {
        if (userService.isUserExist(account)) {
            //如果待注册的账号存在则注册失败
            request.setAttribute("title", "注册失败");
            request.setAttribute("body", "账户" + account + "已存在！请更换账户或尝试登录该账户！");
            //转发至注册页
            return "forward:/user/registerPage";
        } else {
            userService.addUser(account, password);
            //注册成功
            request.setAttribute("title", "注册成功");
            request.setAttribute("body", "你的账户" + account + "已注册成功，快去登录吧！");
            //重定向至登录页
            return "forward:/user/indexPage";
        }
    }

    //用户登录
    @RequestMapping("/login")
    public String login(HttpServletRequest request, String account, String password) {
        if (!userService.isUserExist(account)) {
            //账户不存在
            request.setAttribute("title", "登录失败");
            request.setAttribute("body", "该账户" + account + "不存在！");
            //转发至登录页
            return "forward:/user/indexPage";
        } else {
            //账户存在，验证密码
            UserAccount userAccount = userService.getUserAccount(account, password);
            if (userAccount == null) {
                //密码错误
                request.setAttribute("title", "登录失败");
                request.setAttribute("body", "你输入的密码有误！");
                //转发至登录页
                return "forward:/user/indexPage";
            } else {
                //账户、密码均正确
                int id = userService.getUserId(account);
                //设置ID至session
                request.getSession().setAttribute("user_id", id);
                //检查基本信息是否存在
                if (!userService.isInfoExist(id)) {
                    //转发至基本信息填写页
                    return "forward:/user/editInfoPage";
                } else {
                    //跳转个人信息主页
                    return "forward:/user/mainPage";
                }
            }
        }
    }

    //退出登录
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user_id");
        return "forward:/user/indexPage";
    }
    
}
