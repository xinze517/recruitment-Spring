package com.controller.user;

import com.pojo.EntInfo;
import com.pojo.Position;
import com.pojo.RecordApply;
import com.pojo.RecordComplaint;
import com.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserApplyController extends UserBaseController {

    private final PositionService positionService;
    private final RecordApplyService applyService;
    private final RecordComplaintService complaintService;
    private final EntService entService;

    @Autowired
    public UserApplyController(PositionService positionService, RecordApplyService applyService, RecordComplaintService complaintService, EntService entService) {
        this.positionService = positionService;
        this.applyService = applyService;
        this.complaintService = complaintService;
        this.entService = entService;
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

    //增加应聘记录/删除应聘记录
    @RequestMapping("/editRecordApply")
    public String editRecordApply(HttpSession session, RecordApply recordApply) {
        //获取必要信息
        int userId = (int) session.getAttribute("user_id");
        //组合
        recordApply.setUser_id(userId);
        recordApply.setStatus("未回复");
        //检查是否存在该职位的应聘记录
        if (applyService.isRecordExist(recordApply.getRecord_id())) {
            //删除该记录
            applyService.delRecord(recordApply.getRecord_id());
        } else {
            //添加记录
            applyService.addRecord(recordApply);
        }
        //跳转页面
        return "forward:/user/mainPage";
    }

    //增加投诉记录/删除投诉记录
    @RequestMapping("/editRecordComplaint")
    public String editRecordComplaint(HttpSession session, RecordComplaint complaint) {
        //获取必要信息
        int userId = (int) session.getAttribute("user_id");
        //组合
        complaint.setUser_id(userId);
        complaint.setStatus("未处理"); //未处理、投诉成功、投诉失败
        //检查是否存在该岗位的投诉记录
        if (complaintService.isRecordExist(complaint.getRecord_id())) {
            //删除该记录
            complaintService.delRecord(complaint.getRecord_id());
        } else {
            //投诉增加记录
            complaintService.addRecord(complaint);
        }
        //跳转页面
        return "forward:/user/mainPage";
    }
}
