package com.eventspace.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.eventspace.model.Utilisateur;
import com.eventspace.service.UserService;

public class UserServlet extends HttpServlet {
    private UserService userService = new UserService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Utilisateur user = (Utilisateur) request.getSession().getAttribute("user");
        if (user == null || !"ADMIN".equals(user.getRole())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        String action = request.getParameter("action");
        if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Utilisateur u = userService.getUserById(id);
            request.setAttribute("editUser", u);
            request.getRequestDispatcher("user_edit.jsp").forward(request, response);
        } else {
            request.setAttribute("users", userService.getAllUsers());
            request.getRequestDispatcher("users.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Utilisateur user = (Utilisateur) request.getSession().getAttribute("user");
        if (user == null || !"ADMIN".equals(user.getRole())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        String action = request.getParameter("action");
        if ("create".equals(action)) {
            Utilisateur newUser = new Utilisateur();
            newUser.setNom(request.getParameter("nom"));
            newUser.setEmail(request.getParameter("email"));
            newUser.setPassword(request.getParameter("password"));
            newUser.setRole(request.getParameter("role"));
            try {
                userService.register(newUser);
                response.sendRedirect("users?msg=created");
            } catch (Exception e) {
                request.setAttribute("error", e.getMessage());
                request.setAttribute("users", userService.getAllUsers());
                request.getRequestDispatcher("users.jsp").forward(request, response);
            }
        } else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Utilisateur u = userService.getUserById(id);
            if (u != null) {
                u.setNom(request.getParameter("nom"));
                u.setEmail(request.getParameter("email"));
                u.setPassword(request.getParameter("password")); // Basic update
                u.setRole(request.getParameter("role"));
                userService.updateUser(u);
            }
            response.sendRedirect("users?msg=updated");
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            userService.deleteUser(id);
            response.sendRedirect("users?msg=deleted");
        }
    }
}
