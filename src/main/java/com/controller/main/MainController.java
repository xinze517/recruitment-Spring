package com.controller.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 设置默认首页
 */

@Controller
public class MainController {

    @RequestMapping("/")
    public String main() {
        return "index";
    }
}
