package com.archive.archive;

import java.io.*;
import java.sql.*;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "getData", value = {"/api/getData"})
public class HelloServlet extends HttpServlet {
    private String message;
    public HelloServlet() {
    }
    public void init() {
        message = "Hello World!";
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

//        l want to return a json object
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        try{
            String id = request.getParameter("id");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/archive?autoReconnect=true&useSSL=false", "root", "password");
            PreparedStatement ps = conn.prepareStatement("SELECT xempFolderId, xempname FROM docmeta WHERE xempID=?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            String json = "{";
            while(rs.next()){
                String name = rs.getString("xempname");
                String folderId = rs.getString("xempFolderId");
                System.out.println(name + " " + folderId);
                json += "\"name\": \"" + name + "\", \"folderId\": \"" + folderId + "\"";
            }
            json += "}";
            out.println(json);
        }
        catch (Exception e){
            System.out.println(e);
        }

    }

    public void destroy() {
    }
}