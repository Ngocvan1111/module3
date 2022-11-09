package repository;

import model.Employee;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    private String jdbcURL = "jdbc:mysql://localhost:3306/database_of_furama_resort";
    private String jdbcUsername = "root";
    private String jdbcPassWord = "Ngocvan1";

    private static final String SELECT_ALL_EMPLOYEE = "select*from employee";

    public EmployeeRepository() {
    }

    protected Connection getConnection(){
        Connection connection = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL,jdbcUsername,jdbcPassWord);
        }catch (SQLException e){
            e.printStackTrace();
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public List<Employee> findAll() {
        List<Employee> employeeList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEE)) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String date_of_birth = rs.getString("date_of_birth");
                String id_card = rs.getString("id_card");
                double salary = rs.getDouble("salary");
                String phone_number = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");
                int position_id = rs.getInt("position_id");
                int education_degree_id = rs.getInt("education_degree_id");
                int division_id = rs.getInt("division_id");
                String username = rs.getString("username");
                employeeList.add(new Employee(id,name,date_of_birth,id_card,salary,phone_number,email,address,position_id,education_degree_id,division_id,username));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employeeList;
    }
}
