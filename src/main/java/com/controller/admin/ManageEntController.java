package com.controller.admin;

import com.pojo.EntAccount;
import com.pojo.EntInfo;
import com.pojo.Position;
import com.service.EntService;
import com.service.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 管理企业相关方法
 */

@Controller
@RequestMapping("/admin")
public class ManageEntController extends AdminBaseController{
    private final EntService entService;
    private final PositionService positionService;

    @Autowired
    public ManageEntController(EntService entService, PositionService positionService) {
        this.entService = entService;
        this.positionService = positionService;
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
}
