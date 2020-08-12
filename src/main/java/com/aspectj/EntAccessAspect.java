package com.aspectj;

import com.exception.EntAccessLimitException;
import com.pojo.EntAccount;
import com.service.EntService;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;

@Aspect
@Component
public class EntAccessAspect {

    private final HttpSession session;
    private final EntService entService;

    @Autowired
    public EntAccessAspect(HttpSession session, EntService entService) {
        this.session = session;
        this.entService = entService;
    }

    @Pointcut("execution(* com.controller.enterprise.EntInfoController.*(..))")
    public void entInfo() {

    }

    @Pointcut("execution(* com.controller.enterprise.EntPosController.*(..))")
    public void entPos() {

    }

    @Pointcut("execution(* com.controller.enterprise.EntApplyController.*(..))")
    public void entApplyAndBlackList() {

    }

    @Before("entInfo() || entPos() || entApplyAndBlackList()")
    public void EntStatusCheck() throws EntAccessLimitException {
        int entId = (int) session.getAttribute("ent_id");
        EntAccount account = entService.getEntAccount(entId);

        if (!account.getStatus().equals("审核通过")) {
            throw new EntAccessLimitException();
        }
    }
}
