package com.skillswap;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.*;
import javax.servlet.http.*;

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String fullName = request.getParameter("full_name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");  
        String phone = request.getParameter("phone");

        try (Connection conn = DBConnection.getConnection()) {
            
            String sql = "INSERT INTO users (full_name, phone, email, password) VALUES (?, ?, ?, ?)";
            
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, fullName);
                ps.setString(2, phone); 
                ps.setString(3, email);
                ps.setString(4, password);
                
                int rowsAffected = ps.executeUpdate();
                
                if (rowsAffected > 0) {
                    response.sendRedirect("login.html");
                } else {
                    request.setAttribute("error", "Registration failed.");
                    request.getRequestDispatcher("register.html").forward(request, response);
                }
            }

        } catch (SQLException e) {
            if ("23505".equals(e.getSQLState())) {
                String message = e.getMessage();
                if (message.contains("users_email_key")) {
                    request.setAttribute("error", "Email is already registered.");
                } else if (message.contains("users_phone_key")) {
                    request.setAttribute("error", "Phone number is already registered.");
                } else {
                    request.setAttribute("error", "Duplicate entry detected.");
                }
            } else {
                request.setAttribute("error", "Database error: " + e.getMessage());
            }
            request.getRequestDispatcher("register.html").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Unexpected error: " + e.getMessage());
            request.getRequestDispatcher("register.html").forward(request, response);
        }
    }
}