package com.eventspace.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.eventspace.model.Salle;
import com.eventspace.util.DBConnection;

public class RoomDAO {

    public List<Salle> findAll() {
        List<Salle> salles = new ArrayList<>();
        String sql = "SELECT * FROM salle";
        try (Connection conn = DBConnection.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                salles.add(mapResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return salles;
    }

    public Salle findById(int id) {
        String sql = "SELECT * FROM salle WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void create(Salle salle) {
        String sql = "INSERT INTO salle (nom, type, capacite, localisation, description, equipements) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, salle.getNom());
            stmt.setString(2, salle.getType());
            stmt.setInt(3, salle.getCapacite());
            stmt.setString(4, salle.getLocalisation());
            stmt.setString(5, salle.getDescription());
            stmt.setString(6, salle.getEquipements());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM salle WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private Salle mapResultSet(ResultSet rs) throws SQLException {
        return new Salle(
                rs.getInt("id"),
                rs.getString("nom"),
                rs.getString("type"),
                rs.getInt("capacite"),
                rs.getString("localisation"),
                rs.getString("description"),
                rs.getString("equipements"));
    }
}
