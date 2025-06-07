// two sum in sorted arrays
import java.util.Arrays;

public class TwoSumII{

    public static boolean twoSum(int[] arr, int target){
        Arrays.sort(arr);

        int n = arr.length;

        int left = 0, right = n-1;

        int currentSum = 0;

        while(left < right){
            currentSum = arr[left] + arr[right];

            if(currentSum == target){
                return true;
            } else if(currentSum < target){
                left++;
            } else{
                right--;
            }
        }
        return false;
    }

    public static void main(String[] args){
        int[] arr = {-8, 1, 4, 6, 10, 45};
        int target = 16;

        System.out.println("Two sum found: "+ twoSum(arr, target));

    }
}