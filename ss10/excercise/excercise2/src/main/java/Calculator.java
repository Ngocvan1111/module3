
import org.w3c.dom.ls.LSOutput;

public class Calculator {
    public static double calculate(double firstNumber, double secondNumber, String operation ) throws Exception {
        switch (operation){
            case "+":
                return firstNumber+secondNumber;
            case "-":
                return firstNumber-secondNumber;
            case "*":
                return firstNumber*secondNumber;
            case "/":
                try {
                    return firstNumber/secondNumber;
                }catch (ArithmeticException e){
                    throw new ArithmeticException("Mẫu số bằng 0");
                }
            default:
                throw new Exception("Lỗi nhập");

        }
    }
}
