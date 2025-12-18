<%@ include file="header.jsp" %>
    <!-- Ensure header.jsp has the correct taglib from previous fix -->

    <h2>Gestion des Utilisateurs</h2>

    <c:if test="${param.msg == 'created'}">
        <div class="alert alert-success">Utilisateur crèè.</div>
    </c:if>
    <c:if test="${param.msg == 'updated'}">
        <div class="alert alert-success">Utilisateur mis à  jour.</div>
    </c:if>
    <c:if test="${param.msg == 'deleted'}">
        <div class="alert alert-warning">Utilisateur supprimè.</div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <table class="table table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Email</th>
                <th>Rôle</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="u" items="${users}">
                <tr>
                    <td>${u.id}</td>
                    <td>${u.nom}</td>
                    <td>${u.email}</td>
                    <td>${u.role}</td>
                    <td>
                        <a href="users?action=edit&id=${u.id}" class="btn btn-sm btn-primary">Editer</a>
                        <form action="users" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="id" value="${u.id}">
                            <button type="submit" class="btn btn-sm btn-danger"
                                onclick="return confirm('Confirmer suppression?')">Supprimer</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <hr>
    <h3>Ajouter un utilisateur</h3>
    <form action="users" method="post" class="row g-3">
        <input type="hidden" name="action" value="create">
        <div class="col-md-3">
            <input type="text" name="nom" class="form-control" placeholder="Nom" required>
        </div>
        <div class="col-md-3">
            <input type="email" name="email" class="form-control" placeholder="Email" required>
        </div>
        <div class="col-md-3">
            <input type="password" name="password" class="form-control" placeholder="Mot de passe" required>
        </div>
        <div class="col-md-2">
            <select name="role" class="form-select">
                <option value="USER">USER</option>
                <option value="ADMIN">ADMIN</option>
            </select>
        </div>
        <div class="col-md-1">
            <button type="submit" class="btn btn-success">Ajouter</button>
        </div>
    </form>

    <%@ include file="footer.jsp" %>