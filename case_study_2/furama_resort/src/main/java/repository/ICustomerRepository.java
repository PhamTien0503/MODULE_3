package repository;

import model.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll();
    Customer findById(int id);
    boolean save(Customer customer);
    boolean edit(Customer customer);
    boolean delete(int id);
    List<Customer> search(int id,String name);
}
