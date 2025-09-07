package com.skillswap;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // optional init code
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);

        boolean loggedIn = (session != null && session.getAttribute("user") != null);

        // Allow login + register + static files without auth
        String uri = req.getRequestURI();
        boolean allowedRequest =
                uri.endsWith("login.html") || uri.endsWith("login") ||
                uri.endsWith("register.html") || uri.endsWith("register") ||
                uri.contains("css") || uri.contains("js") || uri.contains("images");

        if (loggedIn || allowedRequest) {
            chain.doFilter(request, response); // continue request
        } else {
            res.sendRedirect(req.getContextPath() + "/login.html");
        }
    }

    @Override
    public void destroy() {
        // optional cleanup
    }
}
