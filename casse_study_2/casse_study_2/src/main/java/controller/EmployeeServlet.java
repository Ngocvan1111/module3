package controller;

import model.Employee;
import service.impl.EmployeeService;
import service.IEmployeeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", urlPatterns = "/employees")
public class EmployeeServlet extends HttpServlet {
    IEmployeeService employeeService = new EmployeeService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "add":
                break;
            case "edit":
                break;
            default:


        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "add":
                break;
            case "edit":
                break;
            case "delete":

                    try {
                        deleteE(request,response);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    break;
            default:
                showEmployeePage(request,response);

        }


    }

    private void deleteE(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("deleteId"));
         employeeService.deleteEmployee(id);
        showEmployeePage(request,response);
    }

    private void showEmployeePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Employee> employeeList = employeeService.findAll();
        request.setAttribute("employeeList",employeeList);
        request.getRequestDispatcher("/view/employee/employeeList.jsp").forward(request,response);
    }
}
