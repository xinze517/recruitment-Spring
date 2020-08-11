package com.controller.admin;

import com.pojo.*;
import com.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 管理员自身相关方法
 */

@Controller
@RequestMapping("/admin")
public class ManageSelfController extends AdminBaseController {
    private final AdminService adminService;
    private final EntService entService;
    private final UserService userService;
    private final PositionService positionService;
    private final RecordComplaintService complaintService;

    @Autowired
    public ManageSelfController(AdminService adminService, EntService entService, UserService userService, PositionService positionService, RecordComplaintService complaintService) {
        this.adminService = adminService;
        this.entService = entService;
        this.userService = userService;
        this.positionService = positionService;
        this.complaintService = complaintService;
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
