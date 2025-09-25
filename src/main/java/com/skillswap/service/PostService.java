package com.skillswap.service;

import com.skillswap.dao.PostDAO;
import com.skillswap.model.Post;

import java.util.List;

public class PostService {
    private PostDAO postDAO;

    public PostService() {
        this.postDAO = new PostDAO();
    }

    // ✅ Add new post
    public void addPost(Post post) {
        postDAO.addPost(post);
    }

    // ✅ Get all posts (for dashboard feed)
    public List<Post> getAllPosts() {
        return postDAO.getAllPosts();
    }

    // ✅ Get posts for a specific user
    public List<Post> getPostsByUser(int userId) {
        return postDAO.getPostsByUser(userId);
    }
}
