// Input: strs = ["eat","tea","tan","ate","nat","bat"]
// Output: [["bat"],["nat","tan"],["ate","eat","tea"]]

import java.util.*;

public class GroupAnagrams {

    public static List<List<String>> groupAnagrams(String[] strs){

        Map<String, List<String>> map = new HashMap<>();

        for(String str : strs){
            char[] ch = str.toCharArray();
            Arrays.sort(ch);
            String key = new String(ch);

            if(!map.containsKey(key)){
                map.put(key, new ArrayList<>());
            }
            map.get(key).add(str);
        }

        List<List<String>> res = new ArrayList<>(map.values());
        return res;
    }

    public static void main(String[] args) {
        String[] strs = {"eat","tea","tan","ate","nat","bat"};
        List<List<String>> res = groupAnagrams(strs);

        System.out.println(res);
    }
}
