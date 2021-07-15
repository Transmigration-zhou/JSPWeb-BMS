package com.BMS.controller;

import com.BMS.model.ResultInfo;
import com.BMS.util.DBUtil;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class RegServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 设置请求的编码格式
        req.setCharacterEncoding("utf-8");
        // 设置响应的编码格式
        resp.setContentType("application/json; charset=utf-8");

        String userName = req.getParameter("userName");
        String password = req.getParameter("password");
        String phone = req.getParameter("phone");
        String validate1 = req.getParameter("validate");
        HttpSession session=req.getSession();;
        String validate2 = (String) session.getAttribute("validateCode");

        // 实例化Gson
        Gson gson = new Gson();
        if (!validate1.equalsIgnoreCase(validate2)) {
            String result = gson.toJson(new ResultInfo(0, "验证码错误"));
            resp.getWriter().write(result);
            return;
        }

        Connection con = null;
        try {
            con = DBUtil.getCon();
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            Statement statement = con.createStatement();
            String select="select * from user where userName='" + userName + "'";
            ResultSet rs = statement.executeQuery(select);
            if(rs.next()){
                String result = gson.toJson(new ResultInfo(0, "用户名已被占用"));
                resp.getWriter().write(result);
            }
            else{
                String insert= "insert into user(userName,password,phone,userType) values('"+userName+"','"+password+"','"+phone+"',0)";
                int id = statement.executeUpdate(insert);
                if(id>0){
                    String result = gson.toJson(new ResultInfo(1, "注册成功"));
                    resp.getWriter().write(result);
                }
                else{
                    String result = gson.toJson(new ResultInfo(0, "注册失败"));
                    resp.getWriter().write(result);
                }
            }
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
    }
}
