import java.util.Arrays;
import java.util.HashMap;

public class TwoSum {

	public static int[] findTwoSum(int[] arr, int target) {
		
		HashMap<Integer, Integer> hmap = new HashMap<>();
		
		for(int i=0;i<arr.length;i++) {
			int complement = target - arr[i];
			
			if(hmap.containsKey(complement)) {
				return new int[] {hmap.get(complement), i};
			}
			hmap.put(arr[i], i);
		}
		return new int[] {};
		
	}
	
	public static void main(String[] args) {
		int arr[]= {3, 2, 7, 1};
		int target = 9;
		
		int[] twoIndices = findTwoSum(arr, target);
		System.out.println(Arrays.toString(twoIndices));
	}
	
}
