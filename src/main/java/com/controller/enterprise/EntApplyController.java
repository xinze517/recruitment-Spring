package com.controller.enterprise;

import com.pojo.*;
import com.service.EntBlackListService;
import com.service.PositionService;
import com.service.RecordApplyService;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/ent")
public class EntApplyController extends EntBaseController {

    private final PositionService positionService;
    private final RecordApplyService applyService;
    private final EntBlackListService blackListService;
    private final UserService userService;

    @Autowired
    public EntApplyController(PositionService positionService, RecordApplyService applyService, EntBlackListService blackListService, UserService userService) {
        this.positionService = positionService;
        this.applyService = applyService;
        this.blackListService = blackListService;
        this.userService = userService;
    }

    //跳转应聘页
    @RequestMapping("/editApplyPage")
    public String editApplyPage(HttpSession session, String from, int applyRecordId, Model model) {
        //从session中获取ID
        int entId = (int) session.getAttribute("ent_id");
        //获取记录
        RecordApply apply = applyService.getRecordApply(applyRecordId);
        int userId = apply.getUser_id();
        int positionId = apply.getPosition_id();
        //获取个人信息
        UserInfo userInfo = userService.getUserInfo(userId);
        //获取个人简历
        UserResume userResume = userService.getUserResume(userId);
        //应聘岗位信息
        Position position = positionService.getPosition(positionId);
        //获取黑名单信息
        EntBlackList entBlackList = blackListService.getItem(entId, userId);
        //设置信息
        model.addAttribute("from", from);
        model.addAttribute("applyRecordId", applyRecordId);
        model.addAttribute("userInfo", userInfo);
        model.addAttribute("userResume", userResume);
        model.addAttribute("position", position);
        model.addAttribute("entBlackList", entBlackList);
        //转发
        return "main_ent_apply";
    }

    //企业修改应聘状态
    @RequestMapping("/editRecordApply")
    public String editRecordApply(HttpServletRequest request, String tab, String status, int applyRecordId) {
        //修改状态
        applyService.editStatus(applyRecordId, status);
        //跳转主页
        request.setAttribute("tab", tab);
        return "forward:/ent/mainPage";
    }

    //企业修改应聘黑名单
    @RequestMapping("/editBlackList")
    public String editBlackList(HttpServletRequest request, String tab, EntBlackList blackList) {
        //获取信息
        int entId = (int) request.getSession().getAttribute("ent_id");
        blackList.setEnt_id(entId);
        //检查是否存在
        if (blackListService.isItemExist(blackList.getBlack_list_id())) {
            //若存在
            blackListService.delItem(blackList.getBlack_list_id());
        } else {
            //若不存在，添加黑名单新纪录
            blackListService.addItem(blackList);
        }
        //跳转
        request.setAttribute("tab", tab);
        return "forward:/ent/mainPage";
    }
}
