import org.junit.Test;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author Heroxin
 * @create 2022-05-21-16:56
 * @Description:
 */
public class teset {
    @Test
    public void test(){
        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date(System.currentTimeMillis());
        System.out.println(formatter.format(date));
        String d = formatter.format(date);
        System.out.println(d);
    }
}
