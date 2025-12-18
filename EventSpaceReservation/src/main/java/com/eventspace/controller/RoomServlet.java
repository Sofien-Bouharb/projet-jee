package com.eventspace.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.eventspace.model.Salle;
import com.eventspace.model.Utilisateur;
import com.eventspace.service.RoomService;

public class RoomServlet extends HttpServlet {
    private RoomService roomService = new RoomService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Utilisateur user = (Utilisateur) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        request.setAttribute("rooms", roomService.getAllRooms());
        request.getRequestDispatcher("rooms.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Admin only for creating rooms
        Utilisateur user = (Utilisateur) request.getSession().getAttribute("user");
        if (user == null || !"ADMIN".equals(user.getRole())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        String action = request.getParameter("action");
        if ("create".equals(action)) {
            Salle s = new Salle();
            s.setNom(request.getParameter("nom"));
            s.setType(request.getParameter("type"));
            s.setCapacite(Integer.parseInt(request.getParameter("capacite")));
            s.setLocalisation(request.getParameter("localisation"));
            s.setDescription(request.getParameter("description"));
            s.setEquipements(request.getParameter("equipements"));
            roomService.createRoom(s);
            response.sendRedirect("rooms");
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            roomService.deleteRoom(id);
            response.sendRedirect("rooms");
        }
    }
}
