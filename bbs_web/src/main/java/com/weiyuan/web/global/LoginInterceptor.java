package com.weiyuan.web.global;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String url = request.getRequestURI();
        if(url.toLowerCase().indexOf("login")>=0 || url.toLowerCase().indexOf("register")>=0 || url.toLowerCase().indexOf("to_list")>=0 || url.toLowerCase().indexOf("post")>=0){
            return true;
        }
        HttpSession session = request.getSession();
        if(session.getAttribute("user")!=null){
            return true;
        }
        response.sendRedirect("post/to_list");
        return false;
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
