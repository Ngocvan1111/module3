package service;

import model.Employee;

import java.sql.SQLException;
import java.util.List;

public interface IEmployeeService {
    List<Employee> findAll();
    boolean deleteEmployee(int id) throws SQLException;
}
