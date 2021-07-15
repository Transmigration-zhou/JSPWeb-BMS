package com.BMS.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@MultipartConfig(maxFileSize = 10*1024*1024)
@WebServlet("/uploadImgServlet")
/**
 * 待完善
 */
public class UploadImgServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");
        PrintWriter out = resp.getWriter();
        Part part = req.getPart("usrHeadImage");
        //好消息！！如果设置的是 new File("C:/XXX/"); 就可以上传成功，看来现在的bug在于文件路径的错误,指定的是文件夹，而我上传的是文件夹+文件名，难道是这里的问题？
        File uploadFileDir = new File("/home/transmigration_zhou/IdeaProjects/BMS/src/main/webapp/static/files");
        if(uploadFileDir.exists()) {
            uploadFileDir.mkdir();
        }
        //获取文件名
        String fileName=part.getSubmittedFileName();
        //给字符串加上用户id
        if(fileName != null) {
            HttpSession session = req.getSession(true);
            String usrName = (String)session.getAttribute("usrName");
            //获取文件后缀如 .jpg
            //图像名改为用户IDHeadImage.jpg
            //如果上传同名文件，原有的文件会被覆盖
            String fileNameWithID = usrName + "IDHeadImage" +fileName.substring(fileName.lastIndexOf("."), fileName.length());
            part.write(uploadFileDir+ File.separator+fileNameWithID);
        }
        resp.sendRedirect("home.jsp");
    }
}
