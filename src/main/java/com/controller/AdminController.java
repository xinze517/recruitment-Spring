package com.controller;

import com.pojo.*;
import com.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private final AdminService adminService;
    private final EntService entService;
    private final UserService userService;
    private final PositionService positionService;
    private final RecordComplaintService complaintService;

    @Autowired
    public AdminController(AdminService adminService, EntService entService, UserService userService, PositionService positionService, RecordComplaintService complaintService) {
        this.adminService = adminService;
        this.entService = entService;
        this.userService = userService;
        this.positionService = positionService;
        this.complaintService = complaintService;
    }

    //跳转登录页
    @RequestMapping("/indexPage")
    public void indexPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("tab", "admin");
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    //跳转企业审核页
    @RequestMapping("/entManagePage")
    public String entManagePage(Model model, int entId) {
        //获取企业注册信息
        EntInfo entInfo = entService.getEntInfo(entId);
        //获取企业账户信息
        EntAccount entAccount = entService.getEntAccount(entId);
        //设置
        model.addAttribute("entInfo", entInfo);
        model.addAttribute("entAccount", entAccount);
        //转发
        return "main_admin_manage_ent";
    }

    //跳转个人权限管理页
    @RequestMapping("/editUserAccessPage")
    public String editUserAccessPage(Model model, int userId) {
        //获取个人权限
        UserAccount userAccount = userService.getUserAccount(userId);
        //设置
        model.addAttribute("userAccount", userAccount);
        //转发
        return "main_admin_manage_user";
    }

    //跳转岗位管理页
    @RequestMapping("/editPositionPage")
    public String editPositionPage(Model model, int positionId) {
        //获取岗位详情
        Position position = positionService.getPosition(positionId);
        //设置
        model.addAttribute("position", position);
        //转发
        return "main_admin_manage_position";
    }

    //跳转投诉管理员
    @RequestMapping("/editComplaintPage")
    public String editComplaintPage(Model model, int complaintRecordId) {
        //获取投诉记录
        RecordComplaint complaint = complaintService.getComplaint(complaintRecordId);
        //获取投诉人信息
        UserAccount userAccount = userService.getUserAccount(complaint.getUser_id());
        UserInfo userInfo = userService.getUserInfo(complaint.getUser_id());
        //获取投诉公司信息
        EntInfo entInfo = entService.getEntInfo(complaint.getEnt_id());
        //获取投诉岗位信息
        Position position = positionService.getPosition(complaint.getPosition_id());
        //设置
        model.addAttribute("complaint", complaint);
        model.addAttribute("userAccount", userAccount);
        model.addAttribute("userInfo", userInfo);
        model.addAttribute("entInfo", entInfo);
        model.addAttribute("position", position);
        //转发
        return "main_admin_manage_complaint";
    }

    //跳转主页面
    @RequestMapping("/mainPage")
    public String mainPage(HttpServletRequest request, Model model) {
        //从参数中获取tab并设置至request
        if (request.getParameter("tab") != null) {
            String tab = request.getParameter("tab");
            request.setAttribute("tab", tab);
        }
        //获取所有企业的注册资料
        List<EntInfo> entInfos = entService.getEntInfos();
        //获取所有用户的基本信息
        List<UserInfo> userInfos = userService.getUserInfos();
        //获取所有岗位的信息
        List<Position> positionList = positionService.getPositions();
        //获取所有的投诉记录
        List<RecordComplaint> complaintList = complaintService.getComplaints();
        //建立企业ID - 企业状态的对应表
        Map<Integer, String> entStatusMap = new HashMap<>();
        //建立企业ID - 企业名称的对应表
        Map<Integer, String> entNameMap = new HashMap<>();
        //建立岗位ID - 岗位名称的对应表
        Map<Integer, String> positionNameMap = new HashMap<>();
        //建立用户ID - 用户姓名的对应表
        Map<Integer, String> userNameMap = new HashMap<>();
        //获取所有企业的资质
        for (EntInfo entInfo : entInfos) {
            int entId = entInfo.getEnt_id();
            if (!entStatusMap.containsKey(entId)) {
                entStatusMap.put(entId, entService.getStatus(entId));
            }
        }
        for (RecordComplaint complaint : complaintList) {
            int entId = complaint.getEnt_id();
            int userId = complaint.getUser_id();
            int positionId = complaint.getPosition_id();
            //建立企业ID - 企业名称的对应表
            if (!entNameMap.containsKey(entId)) {
                entNameMap.put(entId, entService.getEntName(entId));
            }
            //建立岗位ID - 岗位名称的对应表
            if (!positionNameMap.containsKey(positionId)) {
                positionNameMap.put(positionId, positionService.getName(positionId));
            }
            //建立用户ID - 用户姓名的对应表
            if (!userNameMap.containsKey(userId)) {
                userNameMap.put(userId, userService.getUserName(userId));
            }
        }

        //设置信息
        model.addAttribute("entInfos", entInfos);                 //所有企业的注册信息
        model.addAttribute("userInfos", userInfos);               //所有用户的基本信息
        model.addAttribute("positionList", positionList);         //所有岗位的信息
        model.addAttribute("complaintList", complaintList);       //所有投诉记录
        model.addAttribute("entStatusMap", entStatusMap);         //企业ID - 企业资质
        model.addAttribute("entNameMap", entNameMap);             //企业ID - 企业名称
        model.addAttribute("positionNameMap", positionNameMap);   //岗位ID - 岗位名称
        model.addAttribute("userNameMap", userNameMap);           //用户ID - 用户姓名
        //转发
        return "main_admin";
    }

    //用户登录
    @RequestMapping("/login")
    public String login(HttpServletRequest request, String account, String password) {
        if (!adminService.isExist(account)) {
            //账户不存在
            request.setAttribute("title", "登录失败");
            request.setAttribute("body", "该账户" + account + "不存在！");
            //转发至登录页
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

    //退出登录
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("adminId");
        return "forward:/admin/indexPage";
    }

    //修改企业资质
    @RequestMapping("/editEntStatus")
    public String editEntStatus(HttpServletRequest request, int entId, String status, String tab) {
        //修改资质
        entService.editStatus(entId, status);
        //修改企业岗位状态
        List<Position> positionList = positionService.getPositions(entId);
        if (status.equals("审核通过")) {
            //审核通过，恢复企业的所有的岗位状态为关闭
            for (Position position : positionList) {
                positionService.editStatus(position.getPosition_id(), "关闭");
            }
        } else {
            //审核不通过，屏蔽企业的所有岗位
            for (Position position : positionList) {
                positionService.editStatus(position.getPosition_id(), "屏蔽");
            }
        }
        //跳转主页
        request.setAttribute("tab", tab);
        return "forward:/admin/mainPage";
    }

    //修改个人权限
    @RequestMapping("/editUserAccess")
    public String editUserAccess(HttpServletRequest request, String tab, UserAccount userAccount) {
        //修改权限
        userService.editUserAccess(userAccount);
        //跳转主页
        request.setAttribute("tab", tab);
        return "forward:/admin/mainPage";
    }

    //修改岗位状态
    @RequestMapping("/editPosition")
    public String editPosition(HttpServletRequest request, String tab, int positionId, String status) {
        //修改岗位状态
        positionService.editStatus(positionId, status);
        //跳转主页
        request.setAttribute("tab", tab);
        return "forward:/admin/mainPage";
    }

    //修改投诉状态
    @RequestMapping("/editComplaint")
    public String editComplaint(HttpServletRequest request, int complaintRecordId, String status, String tab) {
        //获取投诉记录
        RecordComplaint complaint = complaintService.getComplaint(complaintRecordId);
        //获取投诉岗位信息
        int positionId = complaint.getPosition_id();
        //修改投诉记录状态
        complaintService.editStatus(complaintRecordId, status);
        //修改岗位状态
        if (status.equals("投诉成功")) {
            positionService.editStatus(positionId, "屏蔽");
        } else {
            positionService.editStatus(positionId, "关闭");
        }
        //跳转主页
        request.setAttribute("tab", tab);
        return "forward:/admin/mainPage";
    }

    //管理员修改密码
    @RequestMapping("/editPassword")
    public String editPassword(HttpServletRequest request, String old_password, String new_password, String confirm_password) {
        //获取信息
        int adminId = (int) request.getSession().getAttribute("adminId");
        //校验
        if (!new_password.equals(confirm_password)) {
            //两次密码输入不同
            request.setAttribute("title", "密码修改失败");
            request.setAttribute("body", "两次密码输入不一致");
            //跳转主页
            request.setAttribute("tab", "account");
            return "forward:/admin/mainPage";
        } else {
            //校验旧密码
            String account = adminService.getAdminAccount(adminId).getAccount();
            if (adminService.login(account, old_password)) {
                //正确
                adminService.editPassword(account, new_password);
                //修改成功
                request.setAttribute("title", "密码修改成功");
                request.setAttribute("body", "请重新登录你的账号！");
                //跳转主页
                return "forward:/admin/logout";
            } else {
                //修改失败
                request.setAttribute("title", "密码修改失败");
                request.setAttribute("body", "旧密码输入错误！");
                //跳转主页
                request.setAttribute("tab", "account");
                return "forward:/admin/mainPage";
            }
        }
    }
}
