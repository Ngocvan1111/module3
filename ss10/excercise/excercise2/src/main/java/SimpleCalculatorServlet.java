import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SimpleCalculatorServlet", urlPatterns = "/calculate")
public class SimpleCalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String error ="";
        double first_number = 0;
        String operation = "";
        double second_number = 0;
        double result =0;


        try {
            first_number = Double.parseDouble(request.getParameter("first_number"));
             operation = request.getParameter("operation");
            second_number = Double.parseDouble(request.getParameter("second_number"));
             result = Calculator.calculate(first_number,second_number,operation);

        }catch (NumberFormatException | ArithmeticException e){
            request.setAttribute("error",e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }


        request.setAttribute("first_number",first_number);
        request.setAttribute("second_number",second_number);
        request.setAttribute("operation",operation);
        request.setAttribute("result",result);

        request.getRequestDispatcher("result.jsp").forward(request,response);

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
