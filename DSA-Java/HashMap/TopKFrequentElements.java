// Input: nums = [1,1,1,2,2,3], k = 2  
// Output: [1,2]
import java.util.Map;
import java.util.HashMap;
import java.util.PriorityQueue;

public class TopKFrequentElements {

    public static int[] topKFrequentElements(int[] nums, int k){

        Map<Integer, Integer> freqMap = new HashMap<>();

        for(int num : nums){
            freqMap.put(num, freqMap.getOrDefault(num, 0) + 1);
        }
        // freqMap contains : {1:3, 2:2, 3:1}  -> key=number:value=frequency

        PriorityQueue<Map.Entry<Integer, Integer>> minHeap = new PriorityQueue<>(
            (a, b) -> a.getValue() - b.getValue()
        ); 
        
        for(Map.Entry<Integer, Integer> entry: freqMap.entrySet()){
            minHeap.offer(entry);
            if(minHeap.size() > k){
                minHeap.poll();
            }
        }
        // minHeap contains : {2:2, 1:3}

        int[] res=new int[k];
        int i=0;

        for(Map.Entry<Integer, Integer> entry: minHeap){
            res[i++] = entry.getKey();
        }

        return res;
    }

    public static void main(String[] args) {
        int[] nums = {1, 1, 1, 2, 2, 3};
        int k = 2;

        int[] res = topKFrequentElements(nums, k);
        
        for(int num : res){
            System.out.print(num + " ");
        }
    }
}
