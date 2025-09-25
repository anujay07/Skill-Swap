package com.skillswap.servlet;

import com.skillswap.model.Post;
import com.skillswap.service.PostService;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class PostServlet extends HttpServlet {

    private PostService postService;

    @Override
    public void init() throws ServletException {
        postService = new PostService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // ✅ Fetch all posts and forward to dashboard.jsp
        List<Post> posts = postService.getAllPosts();
        request.setAttribute("posts", posts);
        RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // ✅ Get post data
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        int userId = (Integer) session.getAttribute("userId");

        // ✅ Create post
        Post post = new Post();
        post.setUserId(userId);
        post.setTitle(title);
        post.setContent(content);
        
        postService.addPost(post);

        // Redirect back to dashboard
        response.sendRedirect("PostServlet");
    }
}
