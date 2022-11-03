
import org.w3c.dom.ls.LSOutput;

public class Calculator {
    public static double calculate(double number1, double number2, String operation ) throws Exception {
        switch (operation){
            case "+":
                return number1+number2;
            case "-":
                return number1-number2;
            case "*":
                return number1*number2;
            case "/":
                try {
                    return number1/number2;
                }catch (ArithmeticException e){
                    throw new ArithmeticException("Mẫu số bằng 0");
                }
            default:
                throw new Exception("Lỗi nhập");

        }
    }
}
