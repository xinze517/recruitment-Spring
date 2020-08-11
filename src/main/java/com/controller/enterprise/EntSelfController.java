package com.controller.enterprise;

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

@Controller
@RequestMapping("/ent")
public class EntSelfController extends EntBaseController {

    private final EntService entService;
    private final PositionService positionService;
    private final RecordApplyService applyService;
    private final EntBlackListService blackListService;
    private final UserService userService;

    @Autowired
    public EntSelfController(EntService entService, PositionService positionService, RecordApplyService applyService, EntBlackListService blackListService, UserService userService) {
        this.entService = entService;
        this.positionService = positionService;
        this.applyService = applyService;
        this.blackListService = blackListService;
        this.userService = userService;
    }

    //跳转至企业信息主页
    @RequestMapping("/mainPage")
    public String mainPage(HttpServletRequest request, Model model){
        //从session中获取ID
        int entId = (int) request.getSession().getAttribute("ent_id");
        //从参数中获取tab并设置至request
        if (request.getParameter("tab") != null) {
            String tab = request.getParameter("tab");
            request.setAttribute("tab", tab);
        }
        //获取用户账户信息
        EntAccount account = entService.getEntAccount(entId);
        //获取企业注册信息
        EntInfo info = entService.getEntInfo(entId);
        //获取企业岗位信息
        List<Position> positions = positionService.getPositions(entId);
        //获取该企业的所有求职记录
        List<RecordApply> applyList = applyService.getEntRecordApplyList(entId);
        //获取该企业的所有黑名单
        List<EntBlackList> blackLists = blackListService.getList(entId);

        Map<Integer, UserInfo> userInfoMap = new HashMap<>();   //用户ID-用户信息
        Map<Integer, String> positionNameMap = new HashMap<>(); //岗位ID-岗位名称
        Map<Integer, Boolean> isInBlackList = new HashMap<>();  //用户ID-是否在黑名单中
        for (RecordApply apply : applyList) {
            int userId = apply.getUser_id();
            int positionId = apply.getPosition_id();
            if (!userInfoMap.containsKey(userId)) {
                userInfoMap.put(userId, userService.getUserInfo(userId));
            }
            if (!positionNameMap.containsKey(positionId)) {
                positionNameMap.put(positionId, positionService.getName(positionId));
            }
            if (!isInBlackList.containsKey(userId)) {
                isInBlackList.put(userId, blackListService.isItemExist(entId, userId));
            }
        }
        //设置信息
        model.addAttribute("entAccount", account);
        model.addAttribute("entInfo", info);
        model.addAttribute("entPositions", positions);
        model.addAttribute("applyList", applyList);
        model.addAttribute("userInfoMap", userInfoMap);
        model.addAttribute("positionNameMap", positionNameMap);
        model.addAttribute("blackLists", blackLists);
        model.addAttribute("isInBlackList", isInBlackList);
        //转发
        return "main_ent";
    }

    //企业修改密码
    @RequestMapping("/editPassword")
    public String editPassword(HttpServletRequest request, String old_password, String new_password, String confirm_password) {
        //获取信息
        int ent_id = (int) request.getSession().getAttribute("ent_id");
        //校验
        if (!new_password.equals(confirm_password)) {
            //两次密码输入不同
            request.setAttribute("title", "密码修改失败");
            request.setAttribute("body", "两次密码输入不一致");
            //跳转主页
            request.setAttribute("tab", "account");
            return "forward:/ent/logout";
        } else {
            //修改密码
            if (entService.editPassword(ent_id, old_password, new_password)) {
                //修改成功
                request.setAttribute("title", "密码修改成功");
                request.setAttribute("body", "请重新登录你的账号！");
                //跳转主页
                return "forward:/";
            } else {
                //修改失败
                request.setAttribute("title", "密码修改失败");
                request.setAttribute("body", "旧密码输入错误！");
                //跳转主页
                request.setAttribute("tab", "account");
                return "forward:/ent/mainPage";
            }
        }
    }

}
