package wang.miansen.roothub.common.util; 
/**
 * 随机验证码。
 随机生成十组六位字符组成的验证码。
 验证码由大小写字母、数字字符组成。
 */
 
import java.util.Random;
 
public class CreatKey {
    public static String verifyCode(){
 
        char[] c= AllCharacter.charArray();//获取包含26个字母大小写和数字的字符数组
//        System.out.println(Arrays.toString(c));
 
        Random rd = new Random();
        String code="";
        for (int k = 0; k <= 6; k++) {
            int index = rd.nextInt(c.length);//随机获取数组长度作为索引
            code+=c[index];//循环添加到字符串后面
        } 
        return code;
    }
}