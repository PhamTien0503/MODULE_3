package service.iplm;

import model.Facility;
import repository.IFacilityRepository;
import repository.iplm.FacilityRepositoty;
import service.IFacilityService;


import java.util.List;

public class FacilityService implements IFacilityService {
    IFacilityRepository facilityRepository=new FacilityRepositoty();
    @Override
    public List<Facility> findAll() {
        return facilityRepository.findAll();
    }

    @Override
    public Facility findById(int id) {
        return facilityRepository.findById(id);
    }

    @Override
    public boolean save(Facility facility) {
        return facilityRepository.save(facility);
    }

    @Override
    public boolean edit(Facility facility) {
        return facilityRepository.edit(facility);
    }

    @Override
    public boolean delete(int id) {
        return facilityRepository.delete(id);
    }

    @Override
    public List<Facility> search(String idSearch, String name) {
        return facilityRepository.search(idSearch,name);
    }
}
