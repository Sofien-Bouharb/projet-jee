package com.eventspace.model;

import java.time.LocalDateTime;

public class Reservation {
    private int id;
    private int utilisateurId;
    private int salleId;
    private LocalDateTime dateDebut;
    private LocalDateTime dateFin;
    private String statut; // "PLANIFIEE", "ANNULEE", "TERMINEE"

    // Optional: References to full objects for display convenience
    private Utilisateur utilisateur;
    private Salle salle;

    public Reservation() {
    }

    public Reservation(int id, int utilisateurId, int salleId, LocalDateTime dateDebut, LocalDateTime dateFin,
            String statut) {
        this.id = id;
        this.utilisateurId = utilisateurId;
        this.salleId = salleId;
        this.dateDebut = dateDebut;
        this.dateFin = dateFin;
        this.statut = statut;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUtilisateurId() {
        return utilisateurId;
    }

    public void setUtilisateurId(int utilisateurId) {
        this.utilisateurId = utilisateurId;
    }

    public int getSalleId() {
        return salleId;
    }

    public void setSalleId(int salleId) {
        this.salleId = salleId;
    }

    public LocalDateTime getDateDebut() {
        return dateDebut;
    }

    public void setDateDebut(LocalDateTime dateDebut) {
        this.dateDebut = dateDebut;
    }

    public LocalDateTime getDateFin() {
        return dateFin;
    }

    public void setDateFin(LocalDateTime dateFin) {
        this.dateFin = dateFin;
    }

    public String getStatut() {
        return statut;
    }

    public void setStatut(String statut) {
        this.statut = statut;
    }

    public Utilisateur getUtilisateur() {
        return utilisateur;
    }

    public void setUtilisateur(Utilisateur utilisateur) {
        this.utilisateur = utilisateur;
    }

    public Salle getSalle() {
        return salle;
    }

    public void setSalle(Salle salle) {
        this.salle = salle;
    }
}
