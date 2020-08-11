package com.controller.user;

import com.exception.UserNotLoginException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpSession;

@Controller
public class UserBaseController {

    @ModelAttribute
    public void isLogin(HttpSession session) throws UserNotLoginException {
        if (session.getAttribute("user_id") == null) {
            throw new UserNotLoginException("没有登陆");
        }
    }

}
