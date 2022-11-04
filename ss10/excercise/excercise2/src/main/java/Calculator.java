
import org.w3c.dom.ls.LSOutput;

public class Calculator {
    public static double calculate(double first_number, double second_number, String operation ) throws Exception {
        switch (operation){
            case "+":
                return first_number+second_number;
            case "-":
                return first_number-second_number;
            case "*":
                return first_number*second_number;
            case "/":
                try {
                    return first_number/second_number;
                }catch (ArithmeticException e){
                    throw new ArithmeticException("Mẫu số bằng 0");
                }
            default:
                throw new Exception("Lỗi nhập");

        }
    }
}
