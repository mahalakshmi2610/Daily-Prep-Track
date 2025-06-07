// Input: arr = [2, 1, 5, 1, 3, 2], k = 3
// Output: 9
// Explanation: Subarray [5,1,3] has the maximum sum = 9

public class MaxSumSubarrayK {

    public static int findMaxSum(int[] arr, int k){
        if(arr == null || arr.length < k){
            return 0;    
        }
        int maxSum = 0;
        int windowSum = 0;

        for(int i=0;i<k;i++){
            windowSum += arr[i];
        }
        maxSum = windowSum;
        
        //System.out.println("Window sum at index " + (k-1) + " is " + windowSum);

        for(int i=k;i<arr.length;i++){
            windowSum += arr[i] - arr[i-k];
            //System.out.println("Window sum at index " + i + " is " + windowSum);
            maxSum = Math.max(maxSum, windowSum);
        }

        return maxSum;
    }

    public static void main(String[] args){
        int[] arr = {2, 1, 5, 1, 3, 2};
        int k=3;
        System.out.println(findMaxSum(arr, k));
    }
}
