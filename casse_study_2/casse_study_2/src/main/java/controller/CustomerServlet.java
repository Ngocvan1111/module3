package controller;

import model.Customer;
import model.CustomerType;
import model.Employee;
import service.ICustomerService;
import service.IEmployeeService;
import service.impl.CustomerService;
import service.impl.EmployeeService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    ICustomerService customerService = new CustomerService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){


            case "edit":
                try {
                    updateCustomer(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "search":
                showCustomer(request,response);
                break;
            case "ShowAll":
                showCustomerPage(request,response);

            case "insert":
                insertCustomer(request, response);

                break;

            default:


        }

    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<CustomerType> customerTypeList = customerService.findAllCustomerType();
        request.setAttribute("customerTypeList",customerTypeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/Insert.jsp");
        dispatcher.forward(request, response);
    }

    private void insertCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy list customer type //
        List<CustomerType> customerTypeList = customerService.findAllCustomerType();

        int id = Integer.parseInt(request.getParameter("id"));
        String customerTypeName  = request.getParameter("customerTypeName") ;
        // Lấy customer type id //
        int customerTypeId = 0;
        for(int i =0; i<customerTypeList.size();i++){
            if(customerTypeList.get(i).getCustomerTypeName().equals(customerTypeName)){
                customerTypeId = customerTypeList.get(i).getId();
                break;
            }
        }
        String name = request.getParameter("name");
        String dateOfBirth = request.getParameter("dateOfBirth");
        int gender = Integer.parseInt(request.getParameter("gender")) ;
        String idCard = request.getParameter("idCard");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        Customer book = new Customer(id, customerTypeId, name, dateOfBirth,gender,idCard,phoneNumber,email,address);
//        userDAO.updateUser(book);
        Map<String,String> errorMaps = customerService.insertCustomer(book);
        String mess = " Thêm mới thành công";
        if(!errorMaps.isEmpty()){
             mess = " Thêm mới không thành công";
             request.setAttribute("errorMaps",errorMaps);
             request.setAttribute("id",id);
             request.setAttribute("customerTypeName",customerTypeName);
             request.setAttribute("name",name);
             request.setAttribute("dateOfBirth",dateOfBirth);
             request.setAttribute("gender",gender);
             request.setAttribute("idCard",idCard);
             request.setAttribute("phoneNumber",phoneNumber);
             request.setAttribute("email",email);
             request.setAttribute("address",address);
            showNewForm(request,response);


        }
        showNewForm(request,response);
        request.setAttribute("mess",mess);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/Insert.jsp");
        dispatcher.forward(request, response);
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<CustomerType> customerTypeList = customerService.findAllCustomerType();
        int id = Integer.parseInt(request.getParameter("id"));
        String customerTypeName  = request.getParameter("customerTypeName") ;
        // Lấy customer type id //
        int customerTypeId = 0;
        for(int i =0; i<customerTypeList.size();i++){
            if(customerTypeList.get(i).getCustomerTypeName().equals(customerTypeName)){
                customerTypeId = customerTypeList.get(i).getId();
            }
        }
        String name = request.getParameter("name");
        String dateOfBirth = request.getParameter("dateOfBirth");
        int gender = Integer.parseInt(request.getParameter("gender")) ;
        String idCard = request.getParameter("idCard");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        Customer book = new Customer(id, customerTypeId, name, dateOfBirth,gender,idCard,phoneNumber,email,address);
//        userDAO.updateUser(book);
        customerService.editCustomer(book);
        showCustomerPage(request,response);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/List.jsp");
//        dispatcher.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "insert":
                showNewForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":

                try {
                    deleteE(request,response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
//            case "search":
//                showCustomer(request,response);
//                break;
            default:
                showCustomerPage(request,response);

        }


    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<CustomerType> customerTypeList = customerService.findAllCustomerType();
        request.setAttribute("customerTypeList",customerTypeList);
        int id = Integer.parseInt(request.getParameter("id"));
//        User existingUser = userDAO.selectUser(id);
        Customer existingUser = customerService.selectCustomer(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/edit.jsp");
        request.setAttribute("customer", existingUser);
        dispatcher.forward(request, response);
    }

    private void showCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customers= customerService.findAll();
        List<Customer> outPutCustomers = new ArrayList<>();
        String search_customer = request.getParameter("search_customer");
        for (int i=0; i < customers.size();i++){
            if(Integer.toString(customers.get(i).getId()).equals(search_customer) || customers.get(i).getName().contains(search_customer)){
             outPutCustomers.add(customers.get(i));
            }
        }
        customers = outPutCustomers;
        request.setAttribute("customerList",customers);
        request.getRequestDispatcher("view/customer/List.jsp").forward(request,response);
    }

    private void deleteE(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("deleteId"));
        customerService.deleteCustomer(id);
        showCustomerPage(request,response);
    }

    private void showCustomerPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = customerService.findAll();
        request.setAttribute("customerList",customerList);
        request.getRequestDispatcher("/view/customer/List.jsp").forward(request,response);
    }
}

