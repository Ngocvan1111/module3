package servler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "abcServlet")
public class abcServlet extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();
    static {
        customerList.add(new Customer("Lại Văn Ngọc","06/12/1994","130 Hồ Xuân Hương","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKtpndScLaxvhI7rkm0zCe1v14oTwk3moPew&usqp=CAU"));
        customerList.add(new Customer("Lại Văn Ngọc","06/12/1994","130 Hồ Xuân Hương","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKtpndScLaxvhI7rkm0zCe1v14oTwk3moPew&usqp=CAU"));
        customerList.add(new Customer("Lại Văn Ngọc","06/12/1994","130 Hồ Xuân Hương","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKtpndScLaxvhI7rkm0zCe1v14oTwk3moPew&usqp=CAU"));
    }




    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.setAttribute("customerList",customerList);
        request.getRequestDispatcher("list.jsp").forward(request,response);
    }
}
