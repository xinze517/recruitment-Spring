package com.controller.enterprise;

import com.pojo.EntInfo;
import com.pojo.Position;
import com.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/ent")
public class EntInfoController extends EntBaseController {

    private final EntService entService;
    private final PositionService positionService;

    @Autowired
    public EntInfoController(EntService entService, PositionService positionService) {
        this.entService = entService;
        this.positionService = positionService;
    }

    //跳转企业注册信息填写页
    @RequestMapping("/editInfoPage")
    public String editInfoPage(HttpSession session, Model model) {
        //从session中获取ID
        int ent_id = (int) session.getAttribute("ent_id");
        model.addAttribute("entInfo", entService.getEntInfo(ent_id));
        return "main_ent_info";
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

}
