package service;

import model.Employee;
import repository.EmployeeRepository;
import repository.IEmployeeRepository;

import java.util.List;

public class EmployeeService implements IEmployeeService {
    IEmployeeRepository employeeRepository = new EmployeeRepository();
    @Override
    public List<Employee> findAll() {
        return employeeRepository.findAll() ;
    }
}
