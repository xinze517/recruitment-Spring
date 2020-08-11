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
@RequestMapping("/ent")
public class EntController {
    private final EntService entService;
    private final PositionService positionService;
    private final RecordApplyService applyService;
    private final EntBlackListService blackListService;
    private final UserService userService;

    @Autowired
    public EntController(EntService entService, PositionService positionService, RecordApplyService applyService, EntBlackListService blackListService, UserService userService) {
        this.entService = entService;
        this.positionService = positionService;
        this.applyService = applyService;
        this.blackListService = blackListService;
        this.userService = userService;
    }

    //跳转注册
    @RequestMapping("/registerPage")
    public String registerPage() {
        return "register_ent";
    }

    //跳转登录页
    @RequestMapping("/indexPage")
    public void indexPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("tab", "ent");
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    //跳转企业注册信息填写页
    @RequestMapping("/editInfoPage")
    public String editInfoPage(HttpSession session, Model model) {
        //从session中获取ID
        int ent_id = (int) session.getAttribute("ent_id");
        model.addAttribute("entInfo", entService.getEntInfo(ent_id));
        return "main_ent_info";
    }

    //跳转企业岗位信息填写页
    @RequestMapping("/editPositionPage")
    public String editPositionPage(Model model, int positionId){
        //获取岗位信息
        model.addAttribute("entPosition", positionService.getPosition(positionId));
        //跳转岗位填写页
        return "main_ent_position";
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

    //用户注册
    @RequestMapping("/register")
    public String register(HttpServletRequest request, String account, String password) {
        if (entService.addEnt(account, password)) {
            //注册成功
            request.setAttribute("title", "注册成功");
            request.setAttribute("body", "你的账户" + account + "已注册成功，快去登录吧！");
            //转发至登录页
            return "forward:/ent/indexPage";
        } else {
            //注册失败
            request.setAttribute("title", "注册失败");
            request.setAttribute("body", "账户已存在！请更换账户或尝试登录！");
            //转发至注册页
            return "forward:/ent/registerPage";
        }
    }

    //企业登录
    @RequestMapping("/login")
    public String login(HttpServletRequest request, String account, String password) {
        if (!entService.isEntExist(account)) {
            //账户不存在
            request.setAttribute("title", "登录失败");
            request.setAttribute("body", "该账户" + account + "不存在！");
            //转发至登录页
            return "forward:/ent/indexPage";
        } else {
            //账户存在，验证密码
            EntAccount entAccount = entService.getEntAccount(account, password);
            if (entAccount == null) {
                //密码错误
                request.setAttribute("title", "登录失败");
                request.setAttribute("body", "你输入的密码有误！");
                //转发至登录页
                return "forward:/ent/indexPage";
            } else {
                //账户、密码均正确
                int id = entService.getEntId(account);
                //设置ID至session
                request.getSession().setAttribute("ent_id", id);
                //检查企业注册信息是否存在
                if (!entService.isInfoExist(id)) {
                    //转发至企业注册信息填写页
                    return "forward:/ent/editInfoPage";
                } else {
                    //跳转企业主页
                    return "forward:/ent/mainPage";
                }
            }
        }
    }

    //企业修改注册信息
    @RequestMapping("/editInfo")
    public String editInfo(HttpServletRequest request, EntInfo info) {
        //获取企业ID
        int entId = (int) request.getSession().getAttribute("ent_id");
        //组合
        info.setEnt_id(entId);
        //检查是否存在基本信息
        if (entService.isInfoExist(entId)) {
            //若已存在
            entService.editEntInfo(info);
        } else {
            //若不存在
            entService.addEntInfo(info);
        }
        //注册信息变动，修改企业资质变为未审核
        entService.editStatus(entId, "未审核");
        //屏蔽其所有的岗位
        List<Position> positionList = positionService.getPositions(entId);
        for (Position position : positionList) {
            positionService.editStatus(position.getPosition_id(), "屏蔽");
        }
        //跳转企业信息主页
        request.setAttribute("tab", "info");
        return "forward:/ent/mainPage";
    }

    //修改企业岗位信息
    @RequestMapping("/editPosition")
    public String editPosition(HttpServletRequest request, Position position) {
        //获取企业ID
        int ent_id = (int) request.getSession().getAttribute("ent_id");
        //组合
        position.setEnt_id(ent_id);
        //检查是否存在该条记录
        if (positionService.isPositionExist(position.getPosition_id())) {
            //若已存在
            positionService.editPosition(position);
        } else {
            //若不存在
            positionService.addPosition(position);
        }
        //跳转企业信息主页
        request.setAttribute("tab", "position");
        return "forward:/ent/mainPage";
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
                return "forward:/ent/indexPage";
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

    //退出登录
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("ent_id");
        return "forward:/ent/indexPage";
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

    //企业修改黑名单
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
