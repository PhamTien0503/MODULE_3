package service;

import model.Facility;

import java.util.List;

public interface IFacilityService {
    List<Facility> findAll();

    Facility findById(int id);

    boolean save(Facility facility);

    boolean edit(Facility facility);

    boolean delete(int id);

    List<Facility> search(String idSearch, String name);
}