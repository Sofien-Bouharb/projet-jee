<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Event Space Reservation</title>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
            <style>
                body {
                    padding-top: 60px;
                }

                .footer {
                    margin-top: 30px;
                    padding: 20px;
                    background: #f8f9fa;
                    text-align: center;
                }
            </style>
        </head>

        <body>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">EventSpace</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav me-auto">
                            <c:if test="${not empty sessionScope.user}">
                                <li class="nav-item"><a class="nav-link" href="rooms">Salles</a></li>
                                <li class="nav-item"><a class="nav-link" href="reservations">Mes Réservations</a></li>
                                <c:if test="${sessionScope.user.role == 'ADMIN'}">
                                    <li class="nav-item"><a class="nav-link" href="reservations?view=all">Toutes les
                                            réservations (Admin)</a></li>
                                    <li class="nav-item"><a class="nav-link" href="users">Utilisateurs (Admin)</a></li>
                                </c:if>
                            </c:if>
                        </ul>
                        <ul class="navbar-nav">
                            <c:if test="${not empty sessionScope.user}">
                                <li class="nav-item"><span class="nav-link">Bonjour, ${sessionScope.user.nom}</span>
                                </li>
                                <li class="nav-item"><a class="nav-link" href="auth?action=logout">Déconnexion</a></li>
                            </c:if>
                            <c:if test="${empty sessionScope.user}">
                                <li class="nav-item"><a class="nav-link" href="login.jsp">Connexion</a></li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="container mt-4">