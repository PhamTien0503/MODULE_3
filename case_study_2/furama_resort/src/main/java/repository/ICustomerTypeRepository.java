package repository;

import model.CustomerType;

import java.util.List;
import java.util.Map;

public interface ICustomerTypeRepository {
    Map<Integer,String> findAll();
}
