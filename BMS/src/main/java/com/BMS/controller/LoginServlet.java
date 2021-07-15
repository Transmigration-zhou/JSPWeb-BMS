package com.BMS.controller;

import com.BMS.model.Admin;
import com.BMS.model.Reader;
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

public class LoginServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 设置请求的编码格式
        req.setCharacterEncoding("utf-8");
        // 设置响应的编码格式
        resp.setContentType("application/json; charset=utf-8");

        String userName = req.getParameter("userName");
        String password = req.getParameter("password");
        String userType = req.getParameter("userType");
        int type = userType.equals("读者") ? 0 : 1;

        // 实例化Gson
        Gson gson = new Gson();

        Connection con = null;
        try {
            con = DBUtil.getCon();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            HttpSession session = req.getSession();
            Statement statement = con.createStatement();
            String select = "select * from user where userName='" + userName + "' and userType=" + type;
            ResultSet rs = statement.executeQuery(select);
            if (!rs.next()) {
                String result = gson.toJson(new ResultInfo(0, "用户名不存在"));
                resp.getWriter().write(result);
            }
            else if (password.equals(rs.getString("password"))) {
                String result = gson.toJson(new ResultInfo(1, "登录成功"));
                resp.getWriter().write(result);
                if(type==0){
                    Reader reader = new Reader(rs.getInt(1),userName,password,rs.getString(4));
                    session.setAttribute("reader",reader);
                }
                else{
                    Admin admin = new Admin(rs.getInt(1),userName,password);
                    session.setAttribute("admin",admin);
                }
            }
            else {
                String result = gson.toJson(new ResultInfo(0, "密码不正确"));
                resp.getWriter().write(result);
            }
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
    }
}
