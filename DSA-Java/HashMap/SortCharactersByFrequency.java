import java.util.Map;
import java.util.HashMap;
import java.util.PriorityQueue;

public class SortCharactersByFrequency {

    public static String frequencySort(String s){
        Map<Character, Integer> freqMap = new HashMap<>();

        for(char ch: s.toCharArray()){
            freqMap.put(ch, freqMap.getOrDefault(ch, 0)+1);
        }

        PriorityQueue<Map.Entry<Character, Integer>> maxHeap = new PriorityQueue<>(
            (a, b)->b.getValue() - a.getValue()
        );

        for(Map.Entry<Character, Integer> entry: freqMap.entrySet()){
            maxHeap.offer(entry);
        }

        StringBuilder sb = new StringBuilder();
        
        while(!maxHeap.isEmpty()){
            Map.Entry<Character, Integer> entry = maxHeap.poll();
            for(int i=0;i<entry.getValue();i++){
                sb.append(entry.getKey());
            }
        }
        
        return sb.toString();

    }

    public static void main(String[] args) {
        String s = "tree";
        System.out.println("Sorted characters by frequency: "+ frequencySort(s));
    }
}
