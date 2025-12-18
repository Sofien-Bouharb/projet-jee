<%@ include file="header.jsp" %>

    <h2>Modifier Utilisateur: ${editUser.nom}</h2>

    <div class="row">
        <div class="col-md-6">
            <form action="users" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="${editUser.id}">

                <div class="mb-3">
                    <label class="form-label">Nom</label>
                    <input type="text" name="nom" class="form-control" value="${editUser.nom}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" value="${editUser.email}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Mot de passe</label>
                    <input type="text" name="password" class="form-control" value="${editUser.password}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Rôle</label>
                    <select name="role" class="form-select">
                        <option value="USER" ${editUser.role=='USER' ? 'selected' : '' }>USER</option>
                        <option value="ADMIN" ${editUser.role=='ADMIN' ? 'selected' : '' }>ADMIN</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary">Enregistrer</button>
                <a href="users" class="btn btn-secondary">Annuler</a>
            </form>
        </div>
    </div>

    <%@ include file="footer.jsp" %>