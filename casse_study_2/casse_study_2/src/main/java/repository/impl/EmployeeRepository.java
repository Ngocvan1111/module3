package repository.impl;

import model.Employee;
import repository.BaseRepository;
import repository.IEmployeeRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    BaseRepository baseRepository = new BaseRepository();

    private static final String SELECT_ALL_EMPLOYEE = "select*from employee";

    public EmployeeRepository() {
    }



    @Override
    public List<Employee> findAll() {
        List<Employee> employeeList = new ArrayList<>();
        try (Connection connection =baseRepository.getConnection();
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

    @Override
    public boolean deleteEmployee(int id) throws SQLException {
        boolean rowDeleted;
        String query = "DELETE from employee where id = ?";
        try (Connection connection =baseRepository.getConnection(); PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
}
