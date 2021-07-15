package com.BMS.controller;

import com.BMS.model.Reader;
import com.BMS.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminReaderServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 设置请求的编码格式
        req.setCharacterEncoding("utf-8");
        // 设置响应的编码格式
        resp.setContentType("application/json; charset=utf-8");

        String userName = req.getParameter("userName");
        Connection con = null;
        try {
            con = DBUtil.getCon();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            PreparedStatement pre = con.prepareStatement("select * from user where userName=?");
            pre.setString(1, userName);
            ResultSet rs = pre.executeQuery();
            List<Reader> list = new ArrayList<Reader>();;
            while (rs.next()) {
                list.add(new Reader(rs.getInt("u_id"), rs.getString("userName"), rs.getString("phone")));
            }
            req.setAttribute("list4",list);
            req.getRequestDispatcher("user.jsp").forward(req,resp);
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
    }
}
