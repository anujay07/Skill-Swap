package com.skillswap.filter;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);
        String uri = req.getRequestURI();

        String user = (session != null) ? (String) session.getAttribute("user") : null;

        boolean allowedRequest =
        	    uri.endsWith("login.jsp") || uri.endsWith("register.jsp") ||
        	    uri.endsWith("login") || uri.endsWith("register") ||
        	    uri.endsWith(".css") || uri.endsWith(".js") ||
        	    uri.endsWith(".png") || uri.endsWith(".jpg") ||
        	    uri.endsWith(".jpeg") || uri.endsWith(".gif");


        if (user != null || allowedRequest) {
            // User is logged in OR accessing allowed resources
            chain.doFilter(request, response);
        } else {
            // 🚨 Not logged in → redirect to login
            res.sendRedirect(req.getContextPath() + "/login.jsp");
        }
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void destroy() {}
}
