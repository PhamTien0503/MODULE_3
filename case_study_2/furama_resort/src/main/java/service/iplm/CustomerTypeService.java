package service.iplm;

import repository.ICustomerTypeRepository;
import repository.iplm.CustomerTypeRepository;
import service.ICustomerTypeService;

import java.util.Map;

public class CustomerTypeService implements ICustomerTypeService {
    private final ICustomerTypeRepository customerTypeRepository=new CustomerTypeRepository();

    @Override
    public Map<Integer, String> findAll() {
        return customerTypeRepository.findAll();
    }
}
