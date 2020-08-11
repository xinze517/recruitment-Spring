package com.controller.enterprise;

import com.pojo.Position;
import com.service.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/ent")
public class EntPosController extends EntBaseController {

    private final PositionService positionService;

    @Autowired
    public EntPosController(PositionService positionService) {
        this.positionService = positionService;
    }

    //跳转企业岗位信息填写页
    @RequestMapping("/editPositionPage")
    public String editPositionPage(Model model, int positionId){
        //获取岗位信息
        model.addAttribute("entPosition", positionService.getPosition(positionId));
        //跳转岗位填写页
        return "main_ent_position";
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
}
