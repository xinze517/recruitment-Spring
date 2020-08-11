package com.exception;


import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

public class NotLoginExceptionHandler implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest request,
                                         HttpServletResponse response,
                                         Object o, Exception e) {
        Map<String, Object> model = new HashMap<>();
        model.put("ex", e);
        //设置错误信息
        request.setAttribute("title", "当前未登录");
        request.setAttribute("body", "登录已失效，请登录您的账户！");
        //根据不同错误跳转不同页面
        if (e instanceof AdminNotLoginException) {
            request.setAttribute("tab", "admin");
            return new ModelAndView("index", model);
        } else if (e instanceof EntNotLoginException) {
            request.setAttribute("tab", "ent");
            return new ModelAndView("index", model);
        } else if (e instanceof UserNotLoginException) {
            request.setAttribute("tab", "user");
            return new ModelAndView("index", model);
        } else {
            return new ModelAndView("error", model);
        }
    }
}
