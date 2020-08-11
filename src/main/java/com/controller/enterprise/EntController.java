package com.controller.enterprise;

import com.pojo.*;
import com.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/ent")
public class EntController {
    private final EntService entService;

    @Autowired
    public EntController(EntService entService) {
        this.entService = entService;
    }

    @RequestMapping("/indexPage")
    public String indexPage(HttpServletRequest request) {
        request.setAttribute("tab", "ent");
        return "index";
    }

    //跳转注册
    @RequestMapping("/registerPage")
    public String registerPage() {
        return "register_ent";
    }

    //用户注册
    @RequestMapping("/register")
    public String register(HttpServletRequest request, String account, String password) {
        if (entService.addEnt(account, password)) {
            //注册成功
            request.setAttribute("title", "注册成功");
            request.setAttribute("body", "你的账户" + account + "已注册成功，快去登录吧！");
            //转发至登录页
            return "forward:/ent/indexPage";
        } else {
            //注册失败
            request.setAttribute("title", "注册失败");
            request.setAttribute("body", "账户已存在！请更换账户或尝试登录！");
            //转发至注册页
            return "forward:/ent/registerPage";
        }
    }

    //企业登录
    @RequestMapping("/login")
    public String login(HttpServletRequest request, String account, String password) {
        if (!entService.isEntExist(account)) {
            //账户不存在
            request.setAttribute("title", "登录失败");
            request.setAttribute("body", "该账户" + account + "不存在！");
            //转发至登录页
            return "forward:/ent/indexPage";
        } else {
            //账户存在，验证密码
            EntAccount entAccount = entService.getEntAccount(account, password);
            if (entAccount == null) {
                //密码错误
                request.setAttribute("title", "登录失败");
                request.setAttribute("body", "你输入的密码有误！");
                //转发至登录页
                return "forward:/ent/indexPage";
            } else {
                //账户、密码均正确
                int id = entService.getEntId(account);
                //设置ID至session
                request.getSession().setAttribute("ent_id", id);
                //检查企业注册信息是否存在
                if (!entService.isInfoExist(id)) {
                    //转发至企业注册信息填写页
                    return "forward:/ent/editInfoPage";
                } else {
                    //跳转企业主页
                    return "forward:/ent/mainPage";
                }
            }
        }
    }

    //退出登录
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("ent_id");
        return "forward:/ent/indexPage";
    }
}
