package service.iplm;

import repository.IFacilityTypeRepository;
import repository.iplm.FacilityTypeRepository;
import service.IFacilityTypeService;


import java.util.Map;

public class FacilityTypeService implements IFacilityTypeService {
    IFacilityTypeRepository facilityTypeRepository=new FacilityTypeRepository();

    @Override
    public Map<Integer, String> findAll() {
        return facilityTypeRepository.findAll();
    }
}
