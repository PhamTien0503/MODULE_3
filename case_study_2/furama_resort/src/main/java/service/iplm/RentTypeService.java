package service.iplm;

import repository.IFacilityTypeRepository;
import repository.IRentTypeRepository;
import repository.iplm.RentTypeRepository;
import service.IRentTypeService;

import java.util.Map;

public class RentTypeService implements IRentTypeService {
    IRentTypeRepository rentTypeRepository=new RentTypeRepository();
    @Override
    public Map<Integer, String> findAll() {
        return rentTypeRepository.findAll();
    }
}
