package com.skillswap.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false); // Don't create if it doesn't exist
        if (session != null) {
            session.invalidate(); // Destroy session
        }

        response.sendRedirect(request.getContextPath() + "/login.jsp"); // Redirect to login
    }
}
