// given an array of integers nums and an integer k, 
// return the total number of subarrays whose sum equals to k.

import java.util.Map;
import java.util.HashMap;

public class SubarraySumEqualsK {

    public int subarraySum(int[] arr, int k){
        int count = 0;

        int prefixSum = 0;
        Map<Integer, Integer> prefixSumMap = new HashMap<>();

        for(int i=0;i<arr.length;i++){
            prefixSum += arr[i];

            if(prefixSum == k){
                count ++;
            }

            if(prefixSumMap.containsKey(prefixSum - k)){
                count += prefixSumMap.get(prefixSum - k);
            }
            prefixSumMap.put(prefixSum, prefixSumMap.getOrDefault(prefixSum, 0) + 1);
        }

        return count;
    }

    public static void main(String[] args) {
        int[] arr = {1, 2, 1, 3};
        int k = 3;

        SubarraySumEqualsK obj = new SubarraySumEqualsK(); // to call a non-static method

        System.out.println("Total number of Subarrays whose sum equals to "+ k +" is "
        +obj.subarraySum(arr, k));
    }
}
