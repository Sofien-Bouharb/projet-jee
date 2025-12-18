package com.eventspace.service;

import com.eventspace.dao.UserDAO;
import com.eventspace.model.Utilisateur;

public class UserService {
    private UserDAO userDAO = new UserDAO();

    public Utilisateur login(String email, String password) {
        Utilisateur user = userDAO.findByEmail(email);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }

    // Simple registration (optional for this context but good to have)
    public void register(Utilisateur user) throws Exception {
        if (userDAO.findByEmail(user.getEmail()) != null) {
            throw new Exception("Cet email est déjà utilisé.");
        }
        userDAO.create(user);
    }

    public java.util.List<Utilisateur> getAllUsers() {
        return userDAO.findAll();
    }

    public Utilisateur getUserById(int id) {
        return userDAO.findById(id);
    }

    public void updateUser(Utilisateur user) {
        userDAO.update(user);
    }

    public void deleteUser(int id) {
        userDAO.delete(id);
    }
}
