// reverse a string using two pointers
public class ReverseString {

    public static String reverseString(String s){
        int left = 0, right = s.length()-1;
        StringBuilder res = new StringBuilder(s);

        while(left<right){
            char temp = res.charAt(left);
            res.setCharAt(left, res.charAt(right));
            res.setCharAt(right, temp);
            left++;
            right--;
        }

        return res.toString();
    }

    public static void main(String[] args) {
        String reverseMe = "Hello World!";
        System.out.println("Reversed String: "+ reverseString(reverseMe));
    }
}