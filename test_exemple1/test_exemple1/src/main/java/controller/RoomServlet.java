package controller;

import model.Room;
import model.TypePay;
import service.iplm.RoomService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "RoomServlet", urlPatterns = "/room")
public class RoomServlet extends HttpServlet {
    RoomService roomService = new RoomService();


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){


//            case "edit":
//                try {
//                    updateCustomer(request, response);
//                } catch (SQLException e) {
//                    e.printStackTrace();
//                }
//                break;
//            case "search":
//                showCustomer(request,response);
//                break;
//            case "ShowAll":
//                showCustomerPage(request,response);
//
//            case "insert":
//                insertCustomer(request, response);
//
//                break;

            default:


        }}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String action = request.getParameter("action");
            if(action == null){
                action = "";
            }
            switch (action){
//                case "insert":
//                    showNewForm(request, response);
//                    break;
//                case "edit":
//                    showEditForm(request, response);
//                    break;
                case "delete":

                    try {
                        deleteE(request,response);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    break;
                default:
                    try {
                        showRoomList(request,response);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }

            }

    }

    private void deleteE(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
//        int id = Integer.parseInt(request.getParameter("deleteId"));
        String ids = request.getParameter("deleteId");
        String[] id = ids.split(",");
        for(int i =0;i<id.length;i++){
            roomService.deleteRoom(Integer.parseInt(id[i]));
        }

        showRoomList(request,response);
    }

    private void showRoomList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Room> roomList = roomService.findAll();
        List <TypePay> typePayList = roomService.findAllTypePay();
        request.setAttribute("roomList",roomList);
        request.setAttribute("typePayList",typePayList);
        request.getRequestDispatcher("/view/list.jsp").forward(request,response);

    }
}
