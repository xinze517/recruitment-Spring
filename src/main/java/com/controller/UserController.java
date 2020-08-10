package com.controller;

import com.pojo.*;
import com.service.*;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    private final UserService userService;
    private final PositionService positionService;
    private final RecordApplyService applyService;
    private final RecordComplaintService complaintService;
    private final EntService entService;

    @Autowired
    public UserController(UserService userService, PositionService positionService, RecordApplyService applyService, RecordComplaintService complaintService, EntService entService) {
        this.userService = userService;
        this.positionService = positionService;
        this.applyService = applyService;
        this.complaintService = complaintService;
        this.entService = entService;
    }

    //跳转登录页
    @RequestMapping("/indexPage")
    public String indexPage(HttpServletRequest request) {
        request.setAttribute("tab", "user");
        return "forward:/index.jsp";
    }

    //跳转用户注册
    @RequestMapping("/registerPage")
    public String registerPage() {
        return "register_user";
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

    //跳转用户基本信息填写页
    @RequestMapping("/editInfoPage")
    public String editInfoPage(HttpSession session, Model model) {
        //从session中获取ID
        int user_id = (int) session.getAttribute("user_id");
        //注入用户基本信息
        model.addAttribute("info", userService.getUserInfo(user_id));
        //跳转
        return "main_user_info";
    }

    //跳转简历填写页
    @RequestMapping("/editResumePage")
    public String editResumePage(HttpSession session, Model model) {
        //从session中获取ID
        int userId = (int) session.getAttribute("user_id");
        //注入用户简历信息
        model.addAttribute("resume", userService.getUserResume(userId));
        //跳转
        return "main_user_resume";
    }

    //跳转岗位申请页
    @RequestMapping("/editApplyPage")
    public String editApplyPage(HttpSession session, Model model, int positionId, String from) {
        //从session中获取ID
        int userId = (int) session.getAttribute("user_id");
        //获取应聘记录ID
        int applyRecordId = applyService.getRecordId(userId, positionId);
        //获取岗位信息
        Position position = positionService.getPosition(positionId);
        //获取岗位投诉记录
        RecordComplaint complaint = complaintService.getComplaint(userId, positionId);
        //获取对应公司信息
        EntInfo entInfo = entService.getEntInfo(position.getEnt_id());
        //设置信息
        model.addAttribute("position", position);
        model.addAttribute("entInfo", entInfo);
        model.addAttribute("applyRecordId", applyRecordId);
        model.addAttribute("complaint", complaint);
        //设置页面来源
        model.addAttribute("from", from);
        //转发
        return "main_user_recruit";
    }

    /*****************************************************************************************************/

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

    //用户修改基本信息
    @RequestMapping("/editInfo")
    public String editInfo(HttpServletRequest request, UserInfo info) {
        //转换基本信息
        int user_id = (int) request.getSession().getAttribute("user_id");
        info.setUser_id(user_id);
        //检查是否存在基本信息
        if (userService.isInfoExist(user_id)) {
            //若已存在
            userService.editUserInfo(info);
        } else {
            //若不存在
            userService.addUserInfo(info);
        }
        //跳转个人信息主页
        return "forward:/user/mainPage";
    }

    //用户修改简历信息
    @RequestMapping("/editResume")
    public String editResume(HttpServletRequest request) {
        //获取信息
        int user_id = (int) request.getSession().getAttribute("user_id");
        String self_evaluation = request.getParameter("self_evaluation");
        String home_page = request.getParameter("home_page");
        String except_position = request.getParameter("except_position");
        int except_wage = Integer.parseInt(request.getParameter("except_wage"));
        String except_city = request.getParameter("except_city");
        String work_experience = request.getParameter("work_experience");
        String project_experience = request.getParameter("project_experience");
        UserResume resume = new UserResume(user_id, self_evaluation, home_page, except_position,
                except_wage, except_city, work_experience, project_experience);
        //检查简历是否存在
        if (userService.isResumeExist(user_id)) {
            //存在
            userService.editResume(resume);
        } else {
            //不存在
            userService.addResume(resume);
        }
        //跳转主页
        return "forward:/user/mainPage";
    }

    //用户修改密码
    @RequestMapping("/editPassword")
    public String editPassword(HttpServletRequest request) {
        //获取信息
        int user_id = (int) request.getSession().getAttribute("user_id");
        String old_password = request.getParameter("old_password");
        String new_password = request.getParameter("new_password");
        String confirm_password = request.getParameter("confirm_password");

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

    //退出登录
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().removeAttribute("user_id");
        return "forward:/user/indexPage";
    }

    //增加应聘记录/删除应聘记录
    @RequestMapping("/editRecordApply")
    public String editRecordApply(HttpServletRequest request) {
        //获取必要信息
        int userId = (int) request.getSession().getAttribute("user_id");
        int recordId = Integer.parseInt(request.getParameter("record_apply_id"));
        int entId = Integer.parseInt(request.getParameter("ent_id"));
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        String status = "未回复";
        //组合
        RecordApply recordApply = new RecordApply(recordId, userId, entId, positionId, status);
        //检查是否存在该职位的应聘记录
        if (applyService.isRecordExist(recordId)) {
            //删除该记录
            applyService.delRecord(recordId);
        } else {
            //添加记录
            applyService.addRecord(recordApply);
        }
        //跳转页面
        return "forward:/user/mainPage";
    }

    //增加投诉记录/删除投诉记录
    @RequestMapping("/editRecordComplaint")
    public String editRecordComplaint(HttpServletRequest request) {
        //获取必要信息
        int userId = (int) request.getSession().getAttribute("user_id");
        int entId = Integer.parseInt(request.getParameter("ent_id"));
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int complaintRecordId = Integer.parseInt(request.getParameter("complaintRecordId"));
        String status = "未处理";  //未处理、投诉成功、投诉失败
        //组合
        RecordComplaint complaint = new RecordComplaint(complaintRecordId, entId, positionId, userId, status);
        //检查是否存在该岗位的投诉记录
        if (complaintService.isRecordExist(complaintRecordId)) {
            //删除该记录
            complaintService.delRecord(complaintRecordId);
        } else {
            //投诉增加记录
            complaintService.addRecord(complaint);
        }
        //跳转页面
        return "forward:/user/mainPage";
    }
}
