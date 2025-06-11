import java.util.Set;
import java.util.HashSet;

public class LongestSubstringDistinctChar{

    public static int lengthOfLongestSubstring(String s){

        if(s.length() == 0 || s.length() == 1)
            return s.length();
        
        int left = 0, right = 0, maxLen = 0;

        // // method 1: using boolean array of length 128 for all ascii characters
        // boolean[] visited = new boolean[128];
        // while(right < s.length()){
        //     while(visited[s.charAt(right)] == true){
        //         visited[s.charAt(left)] = false;
        //         left++;
        //     }
        //     visited[s.charAt(right)] = true;
        //     maxLen = Math.max(maxLen, (right - left + 1));
        //     right++;
        // }

        // method 2: using HashSet to keep track of current window characters
        Set<Character> set = new HashSet<>();
        
        while(right < s.length()){
            char ch = s.charAt(right);
            if(!set.contains(ch)){
                set.add(ch);
                maxLen = Math.max(maxLen, (right - left + 1));
                right++;
            } else{
                set.remove(s.charAt(left));
                left++;
            }
        }


        return maxLen;
    }

    public static void main(String[] args) {
        String s = "abcabcbb";
        System.out.println("Length of longest substring without repeating characters is: "+
        lengthOfLongestSubstring(s));
    }
}