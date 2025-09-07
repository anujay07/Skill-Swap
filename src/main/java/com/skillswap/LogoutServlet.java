package com.skillswap;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false); // don't create new
        if (session != null) {
            session.invalidate(); // clear session
        }

        // redirect to login page after logout
        response.sendRedirect(request.getContextPath() + "/login.html");
    }
}
