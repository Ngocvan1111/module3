package controller;

import model.Employee;
import service.EmployeeService;
import service.IEmployeeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FuramaServlet",urlPatterns = "/furama-home")
public class FuramaServlet extends HttpServlet {
    IEmployeeService employeeService = new EmployeeService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "employee":
                showEmployeePage(request,response);
                break;
            case "customer":
                showCustomerPage(request,response);
                break;
            case "service":
                showServicePage(request,response);
                break;
            case "contract":
                showContractPage(request,response);
                break;
            default:

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.getRequestDispatcher("/view/customer/customerList.jsp").forward(request,response);
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "employee":
                showEmployeePage(request,response);
                break;
            case "customer":
                showCustomerPage(request,response);
                break;
            case "service":
                showServicePage(request,response);
                break;
            case "contract":
                showContractPage(request,response);
                break;
            default:
                showHomePage(request,response);

        }

    }

    private void showContractPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/contract/contractList.jsp").forward(request,response);

    }

    private void showServicePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/service/serviceList.jsp").forward(request,response);

    }

    private void showCustomerPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/customer/customerList.jsp").forward(request,response);


    }

    private void showHomePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/main.jsp").forward(request,response);
    }
//    private void showHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.getRequestDispatcher("/view/main.jsp").forward(request,response);
//    }

    private void showEmployeePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Employee> employeeList = employeeService.findAll();
        request.setAttribute("employeeList",employeeList);
        request.getRequestDispatcher("/view/employee/employeeList.jsp").forward(request,response);

    }
}
