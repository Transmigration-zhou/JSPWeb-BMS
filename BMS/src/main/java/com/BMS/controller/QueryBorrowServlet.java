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

public class QueryBorrowServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 设置请求的编码格式
        req.setCharacterEncoding("utf-8");
        // 设置响应的编码格式
        resp.setContentType("application/json; charset=utf-8");

        String u_id = req.getParameter("u_id");

        Connection con = null;
        try {
            con = DBUtil.getCon();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            PreparedStatement pre = con.prepareStatement("select * from book,borrow_info where book.b_id=borrow_info.b_id and  borrow_info.u_id=?");
            pre.setInt(1, Integer.parseInt(u_id));
            ResultSet rs = pre.executeQuery();
            List<Book> list = new ArrayList<Book>();;
            while (rs.next()) {
                list.add(new Book(rs.getInt("b_id"), rs.getString("b_name"), rs.getDouble("price"), rs.getString("author"), rs.getString("publisher"), rs.getBoolean("state")));
            }
            req.setAttribute("list2",list);
            req.getRequestDispatcher("borrow.jsp").forward(req,resp);
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
    }
}
