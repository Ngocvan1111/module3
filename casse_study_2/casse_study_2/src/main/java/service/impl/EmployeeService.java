package service.impl;

import model.Employee;
import repository.impl.EmployeeRepository;
import repository.IEmployeeRepository;
import service.IEmployeeService;

import java.sql.SQLException;
import java.util.List;

public class EmployeeService implements IEmployeeService {
    IEmployeeRepository employeeRepository = new EmployeeRepository();
    @Override
    public List<Employee> findAll() {
        return employeeRepository.findAll() ;
    }

    @Override
    public boolean deleteEmployee(int id) throws SQLException {
        return employeeRepository.deleteEmployee(id);
    }
}
