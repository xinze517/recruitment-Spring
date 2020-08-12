package com.exception;


import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

public class ExceptionHandler implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest request,
                                         HttpServletResponse response,
                                         Object o, Exception e) {
        Map<String, Object> model = new HashMap<>();
        model.put("ex", e);

        //根据不同错误跳转不同页面
        if (e instanceof AdminNotLoginException) {
            //设置错误信息
            request.setAttribute("title", "当前未登录");
            request.setAttribute("body", "登录已失效，请登录您的账户！");
            request.setAttribute("tab", "admin");
            return new ModelAndView("index", model);
        } else if (e instanceof EntNotLoginException) {
            //设置错误信息
            request.setAttribute("title", "当前未登录");
            request.setAttribute("body", "登录已失效，请登录您的账户！");
            request.setAttribute("tab", "ent");
            return new ModelAndView("index", model);
        } else if (e instanceof UserNotLoginException) {
            //设置错误信息
            request.setAttribute("title", "当前未登录");
            request.setAttribute("body", "登录已失效，请登录您的账户！");
            request.setAttribute("tab", "user");
            return new ModelAndView("index", model);
        } else if (e instanceof UserAccessLimitException) {
            //设置错误信息
            request.setAttribute("title", "权限限制警告");
            request.setAttribute("body", "您访问该功能的权限受到限制，已重定向至主页");
            String tab = e.getMessage();
            request.setAttribute("tab", tab);
            return new ModelAndView("forward:/user/mainPage", model);
        } else if (e instanceof EntAccessLimitException) {
            //设置错误信息
            request.setAttribute("title", "权限限制警告");
            request.setAttribute("body", "您访问该功能的权限受到限制，已重定向至主页");
            return new ModelAndView("forward:/ent/mainPage", model);
        } else {
            return new ModelAndView("error", model);
        }
    }
}
