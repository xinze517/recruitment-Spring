package com.controller.user;

import com.pojo.PositionFull;
import com.pojo.UserAccount;
import com.pojo.UserInfo;
import com.pojo.UserResume;
import com.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserSelfController extends UserBaseController {

    private final UserService userService;
    private final PositionService positionService;

    @Autowired
    public UserSelfController(UserService userService, PositionService positionService) {
        this.userService = userService;
        this.positionService = positionService;
    }

    //跳转用户主页
    @RequestMapping("/mainPage")
    public String mainPage(HttpServletRequest request, Model model) {
        //从session中获取ID
        int userId = (int) request.getSession().getAttribute("user_id");
        //从参数中获取tab并设置至request
        if (request.getParameter("tab") != null) {
            String tab = request.getParameter("tab");
            request.setAttribute("tab", tab);
        }
        //获取用户账户信息
        UserAccount account = userService.getUserAccount(userId);
        //获取用户基本信息
        UserInfo info = userService.getUserInfo(userId);
        //获取用户简历信息
        UserResume resume = userService.getUserResume(userId);
        //获取所有已发布的岗位
        List<PositionFull> positionFulls = positionService.getFullPositions();
        //设置信息
        model.addAttribute("account", account);
        model.addAttribute("info", info);
        model.addAttribute("resume", resume);
        model.addAttribute("positionFulls", positionFulls);
        //转发
        return "main_user";
    }

    //用户修改密码
    @RequestMapping("/editPassword")
    public String editPassword(HttpServletRequest request, String old_password,
                               String new_password, String confirm_password) {
        //获取信息
        int user_id = (int) request.getSession().getAttribute("user_id");
        //校验
        if (!new_password.equals(confirm_password)) {
            //两次密码输入不同
            request.setAttribute("title", "密码修改失败");
            request.setAttribute("body", "两次密码输入不一致");
            //跳转主页
            request.setAttribute("tab", "account");
            return "forward:/user/mainPage";
        } else {
            //修改密码
            if (userService.editPassword(user_id, old_password, new_password)) {
                //修改成功
                request.setAttribute("title", "密码修改成功");
                request.setAttribute("body", "请重新登录你的账号！");
                //跳转主页
                return "forward:/user/logout";
            } else {
                //修改失败
                request.setAttribute("title", "密码修改失败");
                request.setAttribute("body", "旧密码输入错误！");
                //跳转主页
                request.setAttribute("tab", "account");
                return "forward:/user/mainPage";
            }
        }
    }
}
