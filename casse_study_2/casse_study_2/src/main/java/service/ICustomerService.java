package service;

import model.Customer;
import model.CustomerType;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ICustomerService {
    List<Customer> findAll();
    List<CustomerType> findAllCustomerType();
    boolean deleteCustomer(int id) throws SQLException;
    boolean editCustomer(Customer customer) throws SQLException;
    Customer selectCustomer(int id);
    Map<String,String> insertCustomer(Customer customer);
}
