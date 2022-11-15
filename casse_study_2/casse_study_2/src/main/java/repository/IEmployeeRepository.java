package repository;

import model.Employee;

import java.sql.SQLException;
import java.util.List;

public interface IEmployeeRepository {
    List<Employee> findAll();
    boolean deleteEmployee(int id) throws SQLException;
}
