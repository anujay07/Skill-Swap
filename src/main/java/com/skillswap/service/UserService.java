package com.skillswap.service;

import com.skillswap.model.User;
import com.skillswap.dao.*;
public class UserService {
    private UserDAO userDAO = new UserDAO();

    public User login(String email, String password) {
        return userDAO.getUserByEmailAndPassword(email, password);
    }

    public boolean register(User user) {
        return userDAO.saveUser(user);
    }
}
