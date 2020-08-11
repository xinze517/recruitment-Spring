package com.controller.admin;

import com.pojo.Position;
import com.service.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * 管理岗位相关方法
 */

@Controller
@RequestMapping("/admin")
public class ManagePosController  extends AdminBaseController{

    private final PositionService positionService;

    @Autowired
    public ManagePosController(PositionService positionService) {
        this.positionService = positionService;
    }

    //跳转岗位管理页面
    @RequestMapping("/editPositionPage")
    public String editPositionPage(Model model, int positionId) {
        //获取岗位详情
        Position position = positionService.getPosition(positionId);
        //设置
        model.addAttribute("position", position);
        //转发
        return "main_admin_manage_position";
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

}
