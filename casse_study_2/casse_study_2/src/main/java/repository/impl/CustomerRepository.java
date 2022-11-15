package repository.impl;

import model.Customer;
import model.CustomerType;
import model.Employee;
import repository.BaseRepository;
import repository.ICustomerRepository;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    BaseRepository baseRepository = new BaseRepository();

    private static final String SELECT_ALL_CUSTOMER = "select*from customer";

    @Override
    public List<Customer> findAll() {
//        String query = "{call group_table_customer_customer_type}"
        String query = "{CALL group_table_customer_customer_type};";
        List<Customer> customerList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             CallableStatement callableStatement = connection.prepareCall(query)) {
            System.out.println(callableStatement);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int customerTypeId = rs.getInt("customer_type_id");
                String name = rs.getString("name");
                String dateOfBirth = rs.getString("date_of_birth");
                int gender = rs.getInt("gender");
                String idCard = rs.getString("id_card");
                String phoneNumber = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String customerTypeName = rs.getString("customer_type_name");
                CustomerType customerType = new CustomerType(customerTypeId,customerTypeName);
                customerList.add(new Customer(id,customerTypeId,name,dateOfBirth,gender,idCard,phoneNumber,email,address,customerType));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    @Override
    public List<CustomerType> findAllCustomerType() {
        String query = "select* from customer_type;";
        List<CustomerType> customerTypeList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String customerTypeName = rs.getString("name");
                CustomerType customerType = new CustomerType(id,customerTypeName);
                customerTypeList.add(customerType);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerTypeList;
    }


    @Override
    public boolean deleteCustomer(int id) throws SQLException {
        boolean rowDeleted;
        String query = "{CALL delete_customer(?)}";
        try (Connection connection =baseRepository.getConnection(); CallableStatement callableStatement = connection.prepareCall(query)) {
            callableStatement.setInt(1, id);
            rowDeleted = callableStatement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public boolean editCustomer(Customer customer) throws SQLException {
        boolean rowUpdated;
        String query =  "{CALL edit_customer(?,?,?,?,?,?,?,?,?)};";
        try(Connection connection = baseRepository.getConnection();
        CallableStatement callableStatement = connection.prepareCall(query)) {

            callableStatement.setInt(1,customer.getId());
            callableStatement.setInt(2,customer.getCustomerTypeId());
            callableStatement.setString(3,customer.getName());
            callableStatement.setString(4,customer.getDateOfBirth());
            callableStatement.setInt(5,customer.getGender());
            callableStatement.setString(6,customer.getIdCard());
            callableStatement.setString(7,customer.getPhoneNumber());
            callableStatement.setString(8,customer.getEmail());
            callableStatement.setString(9,customer.getAddress());
            rowUpdated = callableStatement.executeUpdate() > 0;

        }
        return rowUpdated;
    }



    @Override
    public Customer selectCustomer(int id) {
        Customer customer = null;
        String query = "{CALL group_table_customer_customer_type_find_by_id(?)}";
        try(Connection connection = baseRepository.getConnection();
            CallableStatement callableStatement = connection.prepareCall(query)
        ) {
            callableStatement.setInt(1, id);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                int customerTypeId = rs.getInt("customer_type_id");
                String name = rs.getString("name");
                String dateOfBirth = rs.getString("date_of_birth");
                int gender = rs.getInt("gender");
                String idCard = rs.getString("id_card");
                String phoneNumber = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String customertypeName = rs.getString("customer_type_name");
                CustomerType customerType = new CustomerType(customerTypeId,customertypeName);
                customer = new Customer(id,customerTypeId,name,dateOfBirth,gender,idCard,phoneNumber,email,address,customerType);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    @Override
    public boolean insertCustomer(Customer customer) {
        boolean check = false;
        String query = "insert into customer (id,customer_type_id,name,date_of_birth,gender,id_card,phone_number,email,address) values (?,?,?,?,?,?,?,?,?);";
        try(Connection connection = baseRepository.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(query)) {
//            preparedStatement.setInt(1,customer.getId());
//            preparedStatement.setInt(2,customer.getCustomerTypeId());
//            preparedStatement.setString(3,customer.getName());
//            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MMM-dd");
//            Date date = formatter.parse(customer.getDateOfBirth());
//            preparedStatement.setDate(4, (java.sql.Date) date);
//            preparedStatement.setBoolean(5,customer.getGender() == 1?true:false);
//            preparedStatement.setString(6,customer.getIdCard());
//            preparedStatement.setString(7,customer.getPhoneNumber());
//            preparedStatement.setString(8,customer.getEmail());
//            preparedStatement.setString(9,customer.getAddress());


            preparedStatement.setInt(1,customer.getId());
            preparedStatement.setInt(2,customer.getCustomerTypeId());
            preparedStatement.setString(3,customer.getName());
            preparedStatement.setString(4,customer.getDateOfBirth());
            preparedStatement.setInt(5,customer.getGender());
            preparedStatement.setString(6,customer.getIdCard());
            preparedStatement.setString(7,customer.getPhoneNumber());
            preparedStatement.setString(8,customer.getEmail());
            preparedStatement.setString(9,customer.getAddress());
            preparedStatement.executeUpdate();
            check =true;

        } catch (SQLException  e) {
            e.printStackTrace();
        }
        return check;

    }
}
