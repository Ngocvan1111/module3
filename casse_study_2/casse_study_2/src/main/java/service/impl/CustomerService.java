package service.impl;

import model.Customer;
import model.CustomerType;
import repository.ICustomerRepository;
import repository.impl.CustomerRepository;
import service.ICustomerService;
import validate.Validate;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService implements ICustomerService {
    ICustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<Customer> findAll() {
        return customerRepository.findAll();
    }

    @Override
    public List<CustomerType> findAllCustomerType() {
        return customerRepository.findAllCustomerType();
    }

    @Override
    public boolean deleteCustomer(int id) throws SQLException {
        return customerRepository.deleteCustomer(id);
    }

    @Override
    public boolean editCustomer(Customer customer) throws SQLException {
        return customerRepository.editCustomer(customer);
    }

    @Override
    public Customer selectCustomer(int id) {
        return customerRepository.selectCustomer(id);
    }

    @Override
    public Map<String,String> insertCustomer(Customer customer) {
        Map<String,String> errorMaps = new HashMap<>();
        List<Customer> customerList = customerRepository.findAll();
        for(int i =0;i<customerList.size();i++){
            if(customerList.get(i).getIdCard().equals(customer.getIdCard()) ){
                errorMaps.put("customerId","Customer id card đã tồn tại");
            }
        }
        if("".equals(customer.getIdCard())){
            errorMaps.put("customerId","customer id không được để trống");
        }else if(Validate.identityCard(customer.getIdCard())){
            errorMaps.put("customerId","Không đúng định dạng");
        }
        //////////////////////////////// name //////////////////
        String nameValue = Validate.name(customer.getName());
        if(nameValue != null){
            errorMaps.put("name",nameValue);
        }
        ///////////////// end name //////////////////


        if( errorMaps.isEmpty()){
             customerRepository.insertCustomer(customer);
        }
        return errorMaps;
    }
}
