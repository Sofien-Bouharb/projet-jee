package com.eventspace.service;

import java.util.List;
import com.eventspace.dao.RoomDAO;
import com.eventspace.model.Salle;

public class RoomService {
    private RoomDAO roomDAO = new RoomDAO();

    public List<Salle> getAllRooms() {
        return roomDAO.findAll();
    }

    public Salle getRoom(int id) {
        return roomDAO.findById(id);
    }

    public List<Salle> searchRooms(String keyword) {
        return roomDAO.search(keyword);
    }

    public void createRoom(Salle salle) {
        roomDAO.create(salle);
    }

    public void deleteRoom(int id) {
        roomDAO.delete(id);
    }

    public List<Salle> getRoomsByType(String type) {
        return roomDAO.findByType(type);
    }

    public List<String> getAllRoomTypes() {
        return roomDAO.findAllTypes();
    }

    public void updateRoom(Salle salle) {
        roomDAO.update(salle);
    }
}
