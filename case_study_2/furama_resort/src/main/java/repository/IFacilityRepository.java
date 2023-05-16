package repository;

import model.Customer;
import model.Facility;

import java.util.List;
import java.util.Map;

public interface IFacilityRepository {
    List<Facility> findAll();

    Facility findById(int id);

    boolean save(Facility facility);

    boolean edit(Facility facility);

    boolean delete(int id);

    List<Facility> search(String idSearch, String name);
}