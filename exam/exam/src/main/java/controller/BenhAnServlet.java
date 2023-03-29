package controller;

import model.BenhAn;
import service.BenhAnService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "BenhAnServlet", urlPatterns = "/home")
public class BenhAnServlet extends HttpServlet {
    BenhAnService benhAnService = new BenhAnService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
//            case "delete":
//                break;
            default:

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "delete":
                try {
                    xoaBenhAn(request,response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            default:
                try {
                    showList(request,response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
        }
    }

    private void xoaBenhAn(HttpServletRequest request, HttpServletResponse response) throws ServletException, SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("deleteId")) ;
        benhAnService.deleteBenhAn(id);
        showList(request,response);
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<BenhAn> benhAnList = benhAnService.findAll();
        request.setAttribute("benhAnList",benhAnList);
        request.getRequestDispatcher("/view/list.jsp").forward(request,response);

    }
}
