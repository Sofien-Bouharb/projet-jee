package com.eventspace.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.eventspace.model.Salle;
import com.eventspace.model.Utilisateur;
import com.eventspace.service.RoomService;

public class BookServlet extends HttpServlet {
    private RoomService roomService = new RoomService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check authentication
        Utilisateur user = (Utilisateur) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Get room details
        String roomIdStr = request.getParameter("roomId");
        if (roomIdStr == null || roomIdStr.isEmpty()) {
            response.sendRedirect("rooms");
            return;
        }

        try {
            int roomId = Integer.parseInt(roomIdStr);
            Salle room = roomService.getRoom(roomId);
            if (room == null) {
                response.sendRedirect("rooms?error=room_not_found");
                return;
            }
            request.setAttribute("room", room);
            request.getRequestDispatcher("book.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect("rooms");
        }
    }
}
