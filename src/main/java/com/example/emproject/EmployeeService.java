package com.example.emproject;
import java.util.List;

public interface EmployeeService {
   String createEmployee(Employee employee);
   List<Employee> readEmployees();
   boolean deleteEmployee(Long id);
   String updateEmployee(String id, Employee employee);
 Employee readEmployee(Long id);

}

