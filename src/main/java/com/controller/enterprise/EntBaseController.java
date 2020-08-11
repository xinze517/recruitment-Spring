package com.controller.enterprise;

import com.exception.EntNotLoginException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class EntBaseController {

    @ModelAttribute
    public void isLogin(HttpSession session) throws EntNotLoginException {
        if (session.getAttribute("ent_id") == null) {
            throw new EntNotLoginException("没有登录");
        }
    }

}
