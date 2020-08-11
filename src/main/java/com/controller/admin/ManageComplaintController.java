package com.controller.admin;

import com.pojo.*;
import com.service.EntService;
import com.service.PositionService;
import com.service.RecordComplaintService;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * 处理投诉相关方法
 */

@Controller
@RequestMapping("/admin")
public class ManageComplaintController extends AdminBaseController {

    private final PositionService positionService;
    private final RecordComplaintService complaintService;
    private final UserService userService;
    private final EntService entService;

    @Autowired
    public ManageComplaintController(PositionService positionService, RecordComplaintService complaintService, UserService userService, EntService entService) {
        this.positionService = positionService;
        this.complaintService = complaintService;
        this.userService = userService;
        this.entService = entService;
    }

    //跳转投诉页面
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

}
