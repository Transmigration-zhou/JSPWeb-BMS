package com.BMS.controller;

import com.BMS.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ReturnBookServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 设置请求的编码格式
        req.setCharacterEncoding("utf-8");
        // 设置响应的编码格式
        resp.setContentType("application/json; charset=utf-8");

        String b_id = req.getParameter("b_id");
        String add = req.getParameter("add");

        Connection con = null;
        try {
            con = DBUtil.getCon();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            PreparedStatement pre = con.prepareStatement("delete from borrow_info where b_id=?");
            pre.setInt(1, Integer.parseInt(b_id));
            pre.executeUpdate();
            pre = con.prepareStatement("update book set state=0 where b_id=?");
            pre.setInt(1, Integer.parseInt(b_id));
            pre.executeUpdate();
            if(add.equals("book")) req.getRequestDispatcher("book.jsp").forward(req,resp);
            else req.getRequestDispatcher("borrow.jsp").forward(req,resp);
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
    }
}
