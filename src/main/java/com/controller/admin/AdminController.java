package com.controller.admin;

import com.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 无需权限检查的方法
 */

@Controller
@RequestMapping("/admin")
public class AdminController {
    private final AdminService adminService;

    @Autowired
    public AdminController(AdminService adminService) {
        this.adminService = adminService;
    }

    @RequestMapping("/indexPage")
    public String indexPage(HttpServletRequest request) {
        request.setAttribute("tab", "admin");
        return "index";
    }

    //管理员登入
    @RequestMapping("/login")
    public String login(HttpServletRequest request, String account, String password) {
        if (!adminService.isExist(account)) {
            //账户不存在
            request.setAttribute("title", "登录失败");
            request.setAttribute("body", "该账户" + account + "不存在！");
            //转发至登录页
            request.setAttribute("tab", "admin");
            return "forward:/admin/indexPage";
        } else {
            //账户存在，验证密码
            if (!adminService.login(account, password)) {
                //密码错误
                request.setAttribute("title", "登录失败");
                request.setAttribute("body", "你输入的密码有误！");
                //转发至登录页
                return "forward:/admin/indexPage";
            } else {
                //账户、密码均正确
                int id = adminService.getAdminId(account);
                //设置ID至session
                request.getSession().setAttribute("adminId", id);
                //跳转主页
                return "forward:/admin/mainPage";
            }
        }
    }

    //管理员登出
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("adminId");
        return "forward:/admin/indexPage";
    }

}
