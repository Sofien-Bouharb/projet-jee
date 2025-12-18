<%@ include file="header.jsp" %>

    <h2>Salles Disponibles</h2>

    <div class="row">
        <c:forEach var="salle" items="${rooms}">
            <div class="col-md-4 mb-3">
                <div class="card h-100">
                    <div class="card-body">
                        <h5 class="card-title">${salle.nom}</h5>
                        <h6 class="card-subtitle mb-2 text-muted">${salle.type} - ${salle.capacite} pers.</h6>
                        <p class="card-text">${salle.description}<br>
                            <small>Equipements: ${salle.equipements}</small><br>
                            <small>Lieu: ${salle.localisation}</small>
                        </p>
                    </div>
                    <div class="card-footer">
                        <a href="book.jsp?roomId=${salle.id}&roomName=${salle.nom}"
                            class="btn btn-success btn-sm">Réserver</a>
                        <c:if test="${sessionScope.user.role == 'ADMIN'}">
                            <form action="rooms" method="post" style="display:inline;">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="${salle.id}">
                                <button type="submit" class="btn btn-danger btn-sm"
                                    onclick="return confirm('Confirmer suppression?')">Supprimer</button>
                            </form>
                        </c:if>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <c:if test="${sessionScope.user.role == 'ADMIN'}">
        <hr>
        <h3>Ajouter une salle (Admin)</h3>
        <form action="rooms" method="post" class="row g-3">
            <input type="hidden" name="action" value="create">
            <div class="col-md-3">
                <input type="text" name="nom" class="form-control" placeholder="Nom de la salle" required>
            </div>
            <div class="col-md-2">
                <select name="type" class="form-select">
                    <option value="Reunion">Rèunion</option>
                    <option value="ConfÃ©rence">Confèrence</option>
                    <option value="Formation">Formation</option>
                </select>
            </div>
            <div class="col-md-2">
                <input type="number" name="capacite" class="form-control" placeholder="Capacité" required>
            </div>
            <div class="col-md-2">
                <input type="text" name="localisation" class="form-control" placeholder="Localisation">
            </div>
            <div class="col-md-3">
                <input type="text" name="equipements" class="form-control" placeholder="Equipements">
            </div>
            <div class="col-12">
                <textarea name="description" class="form-control" placeholder="Description"></textarea>
            </div>
            <div class="col-12">
                <button type="submit" class="btn btn-primary">Ajouter Salle</button>
            </div>
        </form>
    </c:if>

    <%@ include file="footer.jsp" %>