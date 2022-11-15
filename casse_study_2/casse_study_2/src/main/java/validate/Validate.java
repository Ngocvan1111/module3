package validate;

import java.util.List;
import java.util.Objects;

public class Validate {
    public static  boolean identityCard(String idCard )  {
        String regex = "\\d{9}";
        if(!idCard.matches(regex)){
            return true;
        }  return false;
    }
    public static String name (String name_in){
        String regex = "^([A-ZĐ][a-záàảãạăâẩắằấầặẵẫêậéèẻẽẹếềểễệóòỏõọôốồổỗộơớờởỡợíìỉĩịđùúủũụưứửữựỷỹ]+[ ])+[A-ZĐ][a-záàảãạăâẩắằấầặẵẫậéèẻẽẹếềểễệóòêỏõọôốồổỗộơớờởỡợíìỉĩịđùúủũụưứửữựỷỹ]+$";
        if(!name_in.matches(regex)){
            return "Sai định dạng";
        }
        return null;
    }
}
