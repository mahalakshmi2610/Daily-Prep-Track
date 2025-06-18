import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;

public class FrequencySortBucket{

    public static String freqSort(String s){

        Map<Character, Integer> map = new HashMap<>();

        for(char c:s.toCharArray()){
            map.put(c, map.getOrDefault(c, 0)+1);
        }

        // System.out.println(map); //{r=1, t=1, e=2}

        @SuppressWarnings("unchecked")
        List<Character>[] buckets = new ArrayList[s.length() + 1];

        for(Map.Entry<Character, Integer> entry: map.entrySet()){
            int freq = entry.getValue();
            if(buckets[freq] == null){
                buckets[freq] = new ArrayList<>();
            }
            buckets[freq].add(entry.getKey());
        }

        // for(List<Character> l:buckets)
        // {
        //     System.out.println(l);
        // }

        // buckets -> array of lists -> where index=freq and values=character(s) with that freq
        // [null, [r,t], [e], null, null]  -> if input string is "tree"
        // [  ^ ,   ^  ,  ^ ,   ^ ,  ^  ]
        // [  | ,   |  ,  | ,   | ,  |  ]
        // [  0 ,   1  ,  2 ,   3 ,  4  ]

        StringBuilder sb = new StringBuilder();

        for(int i=buckets.length-1;i>=0;i--){
            if(buckets[i]!=null){
                for(char c:buckets[i]){
                    sb.append(String.valueOf(c).repeat(i));
                }
            }
        }

        return sb.toString();
    }

    public static void main(String[] args) {
        String s = "tree";
        System.out.println("Sorted String: " + freqSort(s));
    }
}