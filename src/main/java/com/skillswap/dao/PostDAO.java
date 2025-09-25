package com.skillswap.dao;

import com.skillswap.model.Post;
import com.skillswap.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDAO {

    // ✅ Add new post
	public void addPost(Post post) {
	    String sql = "INSERT INTO posts (user_id, content, created_at) VALUES (?, ?, NOW())";

	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {

	        ps.setInt(1, post.getUserId());
	        ps.setString(2, post.getContent());

	        ps.executeUpdate();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

    // ✅ Get all posts
    public List<Post> getAllPosts() {
        List<Post> posts = new ArrayList<>();
        String sql = "SELECT p.*, u.full_name FROM posts p JOIN users u ON p.user_id = u.id ORDER BY p.created_at DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Post post = new Post();
                post.setId(rs.getInt("id"));
                post.setUserId(rs.getInt("user_id"));
                post.setTitle(rs.getString("title"));
                post.setContent(rs.getString("content"));
                post.setCreatedAt(rs.getTimestamp("created_at"));
                post.setUserName(rs.getString("full_name"));

                posts.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return posts;
    }

    // ✅ Get posts by user
    public List<Post> getPostsByUser(int userId) {
        List<Post> posts = new ArrayList<>();
        String sql = "SELECT p.*, u.full_name FROM posts p JOIN users u ON p.user_id = u.id WHERE p.user_id = ? ORDER BY p.created_at DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Post post = new Post();
                post.setId(rs.getInt("id"));
                post.setUserId(rs.getInt("user_id"));
                post.setTitle(rs.getString("title"));
                post.setContent(rs.getString("content"));
                post.setCreatedAt(rs.getTimestamp("created_at"));
                post.setUserName(rs.getString("full_name"));

                posts.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return posts;
    }
}
