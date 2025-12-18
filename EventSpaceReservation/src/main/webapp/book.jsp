<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="header.jsp" %>

        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card shadow">
                        <div class="card-header bg-primary text-white">
                            <h3 class="h5 mb-0">Réserver une salle</h3>
                        </div>
                        <div class="card-body">
                            <form action="reservations" method="post">
                                <input type="hidden" name="action" value="book">
                                <input type="hidden" name="roomId" value="${room.id}">

                                <div class="mb-3">
                                    <label class="form-label">Salle</label>
                                    <input type="text" class="form-control" value="${room.nom}" disabled readonly>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Type</label>
                                    <input type="text" class="form-control" value="${room.type}" disabled readonly>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Capacité</label>
                                    <input type="text" class="form-control" value="${room.capacite} personnes" disabled
                                        readonly>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Localisation</label>
                                    <input type="text" class="form-control" value="${room.localisation}" disabled
                                        readonly>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Equipements</label>
                                    <input type="text" class="form-control" value="${room.equipements}" disabled
                                        readonly>
                                </div>

                                <c:if test="${not empty room.description}">
                                    <div class="mb-3">
                                        <label class="form-label">Description</label>
                                        <p class="form-control-plaintext border rounded p-2 bg-light">
                                            ${room.description}</p>
                                    </div>
                                </c:if>

                                <hr>

                                <div class="mb-3">
                                    <label class="form-label">Date et Heure de début</label>
                                    <input type="datetime-local" name="start" class="form-control" required>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Date et Heure de fin</label>
                                    <input type="datetime-local" name="end" class="form-control" required>
                                </div>

                                <div class="d-grid gap-2">
                                    <button type="submit" class="btn btn-primary">Confirmer la réservation</button>
                                    <a href="rooms" class="btn btn-light">Annuler</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@ include file="footer.jsp" %>