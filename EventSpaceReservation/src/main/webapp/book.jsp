<%@ include file="header.jsp" %>

    <h2>Rèserver : ${param.roomName}</h2>

    <div class="row">
        <div class="col-md-6">
            <form action="reservations" method="post">
                <input type="hidden" name="action" value="book">
                <input type="hidden" name="roomId" value="${param.roomId}">

                <div class="mb-3">
                    <label class="form-label">Date et Heure de début</label>
                    <input type="datetime-local" name="start" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Date et Heure de fin</label>
                    <input type="datetime-local" name="end" class="form-control" required>
                </div>

                <button type="submit" class="btn btn-success">Confirmer la rèservation</button>
                <a href="rooms" class="btn btn-secondary">Annuler</a>
            </form>
        </div>
    </div>

    <%@ include file="footer.jsp" %>