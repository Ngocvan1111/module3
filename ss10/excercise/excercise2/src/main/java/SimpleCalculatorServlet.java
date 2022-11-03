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
        double number1 = 0;
        String operation = "";
        double number2 = 0;
        double result =0;


        try {
             number1 = Double.parseDouble(request.getParameter("number1"));
             operation = request.getParameter("operation");
             number2 = Double.parseDouble(request.getParameter("number2"));
             result = Calculator.calculate(number1,number2,operation);

        }catch (NumberFormatException | ArithmeticException e){
            request.setAttribute("error",e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }


        request.setAttribute("number1",number1);
        request.setAttribute("number2",number2);
        request.setAttribute("operation",operation);
        request.setAttribute("result",result);

        request.getRequestDispatcher("result.jsp").forward(request,response);

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
