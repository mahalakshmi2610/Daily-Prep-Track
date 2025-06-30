// day 10
// input: nums1 = [4, 1, 2], nums2 = [1, 3, 4, 2]
// output = [-1, 3, -1]
// explanation : for each number in nums1, find next greater element that appear in nums2.
// for eg. for nums1[0] = 4, there is no next greater element in nums2 after 4, so output[0] = -1
//         for nums1[1] = 1, the next greater element of 1 in nums2 is 3, so output[1] = 3
//         for nums1[2] = 2, there is no next greater element in nums2, so output[2] = -1

import java.util.Map;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Stack;

class NextGreaterElement{

    static int[] findNextGreaterElement(int[] nums1, int[] nums2){

        Map<Integer, Integer> map = new HashMap<>();
        Stack<Integer> stack = new Stack<>();

        for(int n : nums2) {
            while(!stack.isEmpty() && n > stack.peek()) {
                map.put(stack.pop(), n);
            }
            stack.push(n);
        }

        int[] res = new int[nums1.length];

        for(int i = 0; i < nums1.length; i++) {
            res[i] = map.getOrDefault(nums1[i], -1);
        }

        return res;
    }

    public static void main(String[] args) {
        int[] nums1 = {4, 1, 2};
        int[] nums2 = {1, 3, 4, 2};

        int[] result = findNextGreaterElement(nums1, nums2);
        
        // for(int n : result){
        //     System.out.print(n+" ");
        // }

        System.out.println(Arrays.toString(result));
    }
}