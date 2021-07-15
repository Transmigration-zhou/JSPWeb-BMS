package com.BMS.controller;

import com.BMS.model.Book;
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

public class QueryBookServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 设置请求的编码格式
        req.setCharacterEncoding("utf-8");
        // 设置响应的编码格式
        resp.setContentType("application/json; charset=utf-8");

        String bookName = req.getParameter("bookName").trim();
        Connection con = null;
        try {
            con = DBUtil.getCon();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            PreparedStatement pre;
            if (bookName.equals("")) {
                pre = con.prepareStatement("select * from book");
            }
            else {
                pre = con.prepareStatement("select * from book where b_name regexp ?");
                pre.setString(1, bookName);
            }
            ResultSet rs = pre.executeQuery();
            List<Book> list = new ArrayList<Book>();
            while (rs.next()) {
                list.add(new Book(rs.getInt("b_id"), rs.getString("b_name"), rs.getDouble("price"), rs.getString("author"), rs.getString("publisher"), rs.getBoolean("state")));
            }
            req.setAttribute("list", list);
            req.getRequestDispatcher("query.jsp").forward(req, resp);
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
    }
}
