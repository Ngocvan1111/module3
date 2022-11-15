package repository;

import model.Customer;
import model.CustomerType;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ICustomerRepository {
    List<Customer> findAll();
    List<CustomerType> findAllCustomerType();
    boolean deleteCustomer(int id) throws SQLException;
    boolean editCustomer(Customer customer) throws SQLException;
    Customer selectCustomer(int id);
    boolean insertCustomer(Customer customer);

}
