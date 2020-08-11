package com.controller.admin;

import com.exception.AdminNotLoginException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpSession;

@Controller
public class AdminBaseController {

    //登录检查
    @ModelAttribute
    public void isLogin(HttpSession session) throws AdminNotLoginException {
        if (session.getAttribute("adminId") == null) {
            throw new AdminNotLoginException("没有登录");
        }
    }

}
