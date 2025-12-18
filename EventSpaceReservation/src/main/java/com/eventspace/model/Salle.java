package com.eventspace.model;

public class Salle {
    private int id;
    private String nom;
    private String type;
    private int capacite;
    private String localisation;
    private String description;
    private String equipements;

    public Salle() {
    }

    public Salle(int id, String nom, String type, int capacite, String localisation, String description,
            String equipements) {
        this.id = id;
        this.nom = nom;
        this.type = type;
        this.capacite = capacite;
        this.localisation = localisation;
        this.description = description;
        this.equipements = equipements;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getCapacite() {
        return capacite;
    }

    public void setCapacite(int capacite) {
        this.capacite = capacite;
    }

    public String getLocalisation() {
        return localisation;
    }

    public void setLocalisation(String localisation) {
        this.localisation = localisation;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getEquipements() {
        return equipements;
    }

    public void setEquipements(String equipements) {
        this.equipements = equipements;
    }
}
