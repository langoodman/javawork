package wang.miansen.roothub.common.util; 
/**
 * 包含了二十六个字母和十个数字的字符数组
 */
public class AllCharacter {
    public static char[] charArray(){
        int i = 1234567890;
        String s ="qwertyuiopasdfghjklzxcvbnm";
        String S=s.toUpperCase();
        String word=s+S+i;
        char[] c=word.toCharArray();
 
        return c;
    }
}