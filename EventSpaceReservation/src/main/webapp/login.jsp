<%@ include file="header.jsp" %>

    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">Connexion</div>
                <div class="card-body">
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger">${error}</div>
                    </c:if>

                    <form action="auth" method="post">
                        <input type="hidden" name="action" value="login">
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" name="email" class="form-control" required value="admin@example.com">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Mot de passe</label>
                            <input type="password" name="password" class="form-control" required value="admin123">
                        </div>
                        <button type="submit" class="btn btn-primary">Se connecter</button>
                    </form>

                    <div class="mt-3 text-muted">
                        <small>Comptes de test:<br>
                            Admin: admin@example.com / admin123<br>
                            User: alice@example.com / user123</small>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>