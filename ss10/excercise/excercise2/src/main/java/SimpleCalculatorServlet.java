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
        double firstNumber = 0;
        String operation = "";
        double secondNumber = 0;
        double result =0;


        try {
            firstNumber = Double.parseDouble(request.getParameter("firstNumber"));
             operation = request.getParameter("operation");
            secondNumber = Double.parseDouble(request.getParameter("secondNumber"));
             result = Calculator.calculate(firstNumber,secondNumber,operation);

        }catch (NumberFormatException | ArithmeticException e){
            request.setAttribute("error",e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }


        request.setAttribute("firstNumber",firstNumber);
        request.setAttribute("secondNumber",secondNumber);
        request.setAttribute("operation",operation);
        request.setAttribute("result",result);

        request.getRequestDispatcher("result.jsp").forward(request,response);

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
