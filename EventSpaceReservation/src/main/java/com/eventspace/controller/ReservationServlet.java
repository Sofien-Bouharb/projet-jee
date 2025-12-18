package com.eventspace.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.eventspace.model.Utilisateur;
import com.eventspace.service.ReservationService;

public class ReservationServlet extends HttpServlet {
    private ReservationService resService = new ReservationService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Utilisateur user = (Utilisateur) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String view = request.getParameter("view");
        if ("all".equals(view) && "ADMIN".equals(user.getRole())) {
            request.setAttribute("reservations", resService.getAllReservations());
        } else {
            request.setAttribute("reservations", resService.getReservationsByUser(user.getId()));
        }
        request.getRequestDispatcher("reservations.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Utilisateur user = (Utilisateur) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");
        try {
            if ("book".equals(action)) {
                int roomId = Integer.parseInt(request.getParameter("roomId"));
                // Format expected: yyyy-MM-dd'T'HH:mm (HTML datetime-local)
                LocalDateTime start = LocalDateTime.parse(request.getParameter("start"));
                LocalDateTime end = LocalDateTime.parse(request.getParameter("end"));

                resService.createReservation(user.getId(), roomId, start, end);
                response.sendRedirect("reservations?msg=success");
            } else if ("cancel".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                resService.cancelReservation(id, user);
                response.sendRedirect("reservations?msg=cancelled");
            }
        } catch (Exception e) {
            request.setAttribute("error", "Erreur: " + e.getMessage());
            // Forward back to rooms or reservations depending on context, simple fallback
            // to users reservations
            request.setAttribute("reservations", resService.getReservationsByUser(user.getId()));
            request.getRequestDispatcher("reservations.jsp").forward(request, response);
        }
    }
}
