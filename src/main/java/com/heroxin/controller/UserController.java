package com.heroxin.controller;

import com.heroxin.daomain.User;
import com.heroxin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * @author Heroxin
 * @create 2022-05-21-10:32
 * @Description:
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private ModelAndView modelAndView;

    //    验证用户登录
    @RequestMapping("/login")
    public String query(User user, HttpSession session){
        User query = userService.query(user);

        modelAndView.addObject("query",query);
        modelAndView.setViewName("login");

        if (query != null){
//            将用户放入 session
            session.setAttribute("user",query);
            return "redirect:/main.jsp";
        }
        return "redirect:/login.jsp";
    }

    //    用户注册(添加用户)
    @RequestMapping("/init")
    public String insert(User user){
        userService.insert(user);
        return "redirect:/login.jsp";
    }

//    退出登录
    @RequestMapping("/logout")
    public String logout(HttpSession session){

        session.removeAttribute("user");

        return "redirect:/login.jsp";
    }
}
