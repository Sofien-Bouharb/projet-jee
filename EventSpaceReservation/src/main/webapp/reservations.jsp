<%@ include file="header.jsp" %>

    <h2>
        ${param.view == 'all' ? 'Toutes les Rèservations (Admin)' : 'Mes Rèservations'}
    </h2>

    <c:if test="${param.msg == 'success'}">
        <div class="alert alert-success">Rèservation effectuèe avec succèes !</div>
    </c:if>
    <c:if test="${param.msg == 'cancelled'}">
        <div class="alert alert-warning">Rèservation annulèe.</div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <table class="table table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Salle</th>
                <th>Utilisateur</th>
                <th>Dèbut</th>
                <th>Fin</th>
                <th>Statut</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="res" items="${reservations}">
                <tr>
                    <td>${res.id}</td>
                    <td>${res.salle.nom}</td>
                    <td>${res.utilisateur.nom} (${res.utilisateur.email})</td>
                    <td>${res.dateDebut}</td>
                    <td>${res.dateFin}</td>
                    <td>
                        <span
                            class="badge bg-${res.statut == 'PLANIFIEE' ? 'success' : (res.statut == 'ANNULEE' ? 'danger' : 'secondary')}">
                            ${res.statut}
                        </span>
                    </td>
                    <td>
                        <c:if test="${res.statut == 'PLANIFIEE'}">
                            <form action="reservations" method="post">
                                <input type="hidden" name="action" value="cancel">
                                <input type="hidden" name="id" value="${res.id}">
                                <button type="submit" class="btn btn-outline-danger btn-sm"
                                    onclick="return confirm('Annuler cette rÃ©servation ?')">Annuler</button>
                            </form>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <%@ include file="footer.jsp" %>