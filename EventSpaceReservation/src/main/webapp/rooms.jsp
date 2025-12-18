<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="header.jsp" %>

        <div class="container mt-5">
            <h2>Salles disponibles</h2>

            <!-- Search and Filter Form -->
            <form action="rooms" method="get" class="mb-4">
                <div class="row g-3">
                    <div class="col-md-6">
                        <div class="input-group">
                            <input type="text" name="search" class="form-control" placeholder="Rechercher une salle..."
                                value="${param.search}">
                            <button class="btn btn-outline-primary" type="submit">Rechercher</button>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <select name="type" class="form-select" onchange="this.form.submit()">
                            <option value="">-- Filtrer par type --</option>
                            <c:forEach items="${roomTypes}" var="t">
                                <option value="${t}" ${param.type==t ? 'selected' : '' }>${t}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <c:if test="${not empty param.search or not empty param.type}">
                            <a href="rooms" class="btn btn-outline-secondary w-100">Réinitialiser</a>
                        </c:if>
                    </div>
                </div>
            </form>

            <div class="row">
                <c:forEach items="${rooms}" var="s">
                    <div class="col-md-4 mb-4">
                        <div class="card h-100 shadow-sm">
                            <div class="card-body">
                                <h5 class="card-title">${s.nom}</h5>
                                <h6 class="card-subtitle mb-2 text-muted">${s.type} - ${s.capacite} pers.</h6>
                                <p class="card-text"><small class="text-muted"><i class="bi bi-geo-alt"></i>
                                        ${s.localisation}</small></p>
                                <p class="card-text"><small class="text-muted"><i class="bi bi-tools"></i>
                                        ${s.equipements}</small></p>

                                <div class="d-flex justify-content-between align-items-center">
                                    <a href="book?roomId=${s.id}" class="btn btn-primary">Réserver</a>

                                    <c:if test="${sessionScope.user.role == 'ADMIN'}">
                                        <div>
                                            <button type="button" class="btn btn-warning btn-sm" data-bs-toggle="modal"
                                                data-bs-target="#editModal${s.id}">
                                                Modifier
                                            </button>
                                            <form action="rooms" method="post" style="display:inline;">
                                                <input type="hidden" name="action" value="delete">
                                                <input type="hidden" name="id" value="${s.id}">
                                                <button type="submit" class="btn btn-danger btn-sm"
                                                    onclick="return confirm('Êtes-vous sûr ?')">Supprimer</button>
                                            </form>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Edit Modal for each room -->
                    <c:if test="${sessionScope.user.role == 'ADMIN'}">
                        <div class="modal fade" id="editModal${s.id}" tabindex="-1"
                            aria-labelledby="editModalLabel${s.id}" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="editModalLabel${s.id}">Modifier la salle</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <form action="rooms" method="post">
                                        <div class="modal-body">
                                            <input type="hidden" name="action" value="edit">
                                            <input type="hidden" name="id" value="${s.id}">
                                            <div class="mb-3">
                                                <label class="form-label">Nom</label>
                                                <input type="text" name="nom" class="form-control" value="${s.nom}"
                                                    required>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Type</label>
                                                <select name="type" class="form-select">
                                                    <option value="Reunion" ${s.type=='Reunion' ? 'selected' : '' }>
                                                        Réunion</option>
                                                    <option value="Conference" ${s.type=='Conference' ? 'selected' : ''
                                                        }>Conférence</option>
                                                    <option value="Formation" ${s.type=='Formation' ? 'selected' : '' }>
                                                        Formation</option>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Capacité</label>
                                                <input type="number" name="capacite" class="form-control"
                                                    value="${s.capacite}" required>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Localisation</label>
                                                <input type="text" name="localisation" class="form-control"
                                                    value="${s.localisation}">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Equipements</label>
                                                <input type="text" name="equipements" class="form-control"
                                                    value="${s.equipements}">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Description</label>
                                                <textarea name="description" class="form-control"
                                                    rows="2">${s.description}</textarea>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary"
                                                data-bs-dismiss="modal">Annuler</button>
                                            <button type="submit" class="btn btn-primary">Enregistrer</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
                <c:if test="${empty rooms}">
                    <div class="col-12">
                        <div class="alert alert-info text-center">Aucune salle ne correspond à votre recherche.</div>
                    </div>
                </c:if>
            </div>

            <c:if test="${sessionScope.user.role == 'ADMIN'}">
                <hr class="my-5">
                <div class="card">
                    <div class="card-header bg-light">
                        <h3 class="h5 mb-0">Ajouter une salle (Admin)</h3>
                    </div>
                    <div class="card-body">
                        <form action="rooms" method="post" class="row g-3">
                            <input type="hidden" name="action" value="create">
                            <div class="col-md-3">
                                <label class="form-label">Nom</label>
                                <input type="text" name="nom" class="form-control" required>
                            </div>
                            <div class="col-md-2">
                                <label class="form-label">Type</label>
                                <select name="type" class="form-select">
                                    <option value="Reunion">Réunion</option>
                                    <option value="Conference">Conférence</option>
                                    <option value="Formation">Formation</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <label class="form-label">Capacité</label>
                                <input type="number" name="capacite" class="form-control" required>
                            </div>
                            <div class="col-md-2">
                                <label class="form-label">Localisation</label>
                                <input type="text" name="localisation" class="form-control">
                            </div>
                            <div class="col-md-3">
                                <label class="form-label">Equipements</label>
                                <input type="text" name="equipements" class="form-control">
                            </div>
                            <div class="col-12">
                                <label class="form-label">Description</label>
                                <textarea name="description" class="form-control" rows="2"></textarea>
                            </div>
                            <div class="col-12">
                                <button type="submit" class="btn btn-success">Ajouter Salle</button>
                            </div>
                        </form>
                    </div>
                </div>
            </c:if>

        </div>

        <%@ include file="footer.jsp" %>