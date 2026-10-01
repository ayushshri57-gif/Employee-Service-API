package com.example.emproject;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;


@RestController
public class EmpController {
     //List<Employee> employees = new ArrayList<>();
 //EmployeeService employeeService = new EmployeeServiceImp();

 //Dependency  Injection
 @Autowired 

 EmployeeService employeeService;
    
    @GetMapping("/employees")
    public List<Employee> getAllEmployees() {
        return employeeService.readEmployees();
    }

      @GetMapping("employees/{id}")
    public Employee getEmployeeById(@PathVariable Long id) {
        return employeeService.readEmployee(id);
    }

    @PostMapping("employees")
    public String createEmployee(@RequestBody Employee employee) {
        //TODO: process POST emplrequest
       // employees.add(employee);
    return employeeService.createEmployee(employee);

    }
    @DeleteMapping("employees/{id}")
    public String deleteEmployee(@PathVariable Long id){
        if(employeeService.deleteEmployee(id))
            return "Delete Successfully";
        return "Not found";

    }

    @PutMapping("employee/{id}")
public String putMethodName(@PathVariable String id, @RequestBody  Employee employee ){

    return employeeService.updateEmployee(id, employee);

} 
    
}
