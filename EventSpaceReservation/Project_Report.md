# Rapport de Projet : Système de Réservation EventSpace

## 1. Présentation du Projet
EventSpace est une application web de gestion de réservation de salles (réunion, conférence, formation). Elle permet aux utilisateurs de consulter les salles disponibles et de les réserver, tandis que les administrateurs gèrent le catalogue de salles et les utilisateurs.

---

## 2. Architecture Technique
L'application suit le modèle **MVC (Modèle-Vue-Contrôleur)** :
- **Modèles** : Classes Java simples (POJO) représentant les données.
- **Vues** : Pages JSP (JavaServer Pages) avec JSTL et Bootstrap 5 pour l'interface.
- **Contrôleurs** : Servlets Jakarta gérant la logique de navigation et les requêtes.
- **Services** : Couche intermédiaire pour la logique métier.
- **DAO (Data Access Object)** : Interaction directe avec la base de données via JDBC.

---

## 3. Modèles de Données (Models)

### `Utilisateur`
Représente un compte dans le système.
- `id` (int) : Identifiant unique.
- `nom` (String) : Nom complet.
- `email` (String) : Identifiant de connexion.
- `password` (String) : Mot de passe.
- `role` (String) : Rôle de l'utilisateur (`USER` ou `ADMIN`).

### `Salle`
Représente un espace réservable.
- `id` (int) : Identifiant unique.
- `nom` (String) : Nom de la salle.
- `type` (String) : Type (Réunion, Conférence, etc.).
- `capacite` (int) : Nombre de personnes maximum.
- `localisation` (String) : Emplacement physique.
- `description` (String) : Détails sur la salle.
- `equipements` (String) : Liste des équipements disponibles.

### `Reservation`
Représente une location effectuée.
- `id` (int) : Identifiant de la réservation.
- `utilisateurId` (int) : Clé étrangère vers l'utilisateur.
- `salleId` (int) : Clé étrangère vers la salle.
- `dateDebut` (LocalDateTime) : Date/Heure de début.
- `dateFin` (LocalDateTime) : Date/Heure de fin.
- `statut` (String) : État (`PLANIFIEE`, `ANNULEE`).

---

## 4. Contrôleurs (Servlets)

### `AuthServlet`
Gère l'authentification.
- `doPost` : Connexion (`login`) et Déconnexion (`logout`).
- `doGet` : Affiche la page de connexion ou gère le logout.

### `RoomServlet`
Gère le catalogue de salles.
- `doGet` : Liste toutes les salles, gère la recherche (`search`) et les filtres par type (`type`).
- `doPost` (Admin) : Création, modification et suppression de salles.

### `ReservationServlet`
Gère les réservations.
- `doGet` : Affiche les réservations de l'utilisateur (ou toutes pour l'admin).
- `doPost` : Crée une réservation (`book`) ou annule une réservation (`cancel`).

### `BookServlet`
Assistante de réservation.
- `doGet` : Prépare les données de la salle sélectionnée avant d'afficher le formulaire de réservation.

### `UserServlet` (Admin)
Gestion des comptes.
- `doGet` : Liste les utilisateurs ou affiche le formulaire d'édition.
- `doPost` : Création, mise à jour ou suppression d'un utilisateur.

---

## 5. Vues (Views)

| Fichier | Description |
| :--- | :--- |
| `index.jsp` | Page d'accueil (redirection automatique). |
| `rooms.jsp` | Catalogue avec barre de recherche et filtres. |
| `book.jsp` | Formulaire de réservation avec détails complets de la salle. |
| `reservations.jsp` | Liste des réservations (Vue Utilisateur / Dashboard Admin). |
| `login.jsp` | Interface de connexion. |
| `users.jsp` | Liste des utilisateurs (Admin). |
| `user_edit.jsp` | Formulaire de modification d'utilisateur (Admin). |
| `header/footer.jsp` | Éléments communs (menu, informations de contact). |

---

## 6. Fonctionnalités Développées

### Pour les Utilisateurs :
- **Consultation Publique** : Accès au catalogue de salles sans connexion.
- **Recherche Avancée** : Recherche par nom, lieu ou description.
- **Filtrage** : Tri des salles par type via un menu déroulant.
- **Réservation** : Formulaire interactif avec sélection de dates (requiert connexion).
- **Suivi** : Consultation de l'historique personnel et possibilité d'annulation.

### Pour les Administrateurs :
- **Gestion du Catalogue** : Ajouter, modifier ou supprimer des salles directement depuis l'interface.
- **Gestion des Utilisateurs** : Créer des comptes, modifier les rôles ou supprimer des utilisateurs.
- **Supervision** : Vue d'ensemble de toutes les réservations du système.

---

## 7. Structure du Projet (Dossiers)
```text
src/main/java/com/eventspace/
├── controller/ (Servlets - Logique de navigation)
├── dao/        (Interaction Base de Données)
├── model/      (Classes de données : Salle, Utilisateur...)
├── service/    (Logique métier : validation, calculs)
└── util/       (Utilitaires : DBConnection.java)

src/main/webapp/
├── WEB-INF/    (Configuration web.xml)
└── *.jsp       (Pages d'interface utilisateur)
```

---

## 8. Connexion Base de Données
L'application utilise une classe utilitaire `DBConnection.java` qui implémente le chargement du driver JDBC et fournit un `Connection` unique pour les DAO. Les requêtes SQL sont sécurisées via l'utilisation de `PreparedStatement` pour éviter les injections SQL.

---

## 9. Stack Technologique
- **Langage** : Java (JDK 17+)
- **Framework Web** : Jakarta EE (Servlets, JSP)
- **Interface** : HTML5, CSS3, Bootstrap 5, JSTL.
- **Base de Données** : MySQL/PostgreSQL géré via JDBC.
