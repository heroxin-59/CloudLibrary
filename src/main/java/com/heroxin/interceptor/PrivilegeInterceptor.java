package com.heroxin.interceptor;

import com.heroxin.daomain.User;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author Heroxin
 * @create 2022-05-21-10:38
 * @Description:
 */
public class PrivilegeInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //逻辑：判断用户是否登录  本质：判断session中有没有user
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");//用user接收，那边是用user封装的，否则爆 ClassCastException
        if(user == null){
            //没有登录 session 中找不到
            response.sendRedirect(request.getContextPath()+"/login.jsp");
            return false;
        }
        //放行  访问目标资源
        return true;
    }
}

