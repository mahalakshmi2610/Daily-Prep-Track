public class Demo {
	// maximum element in an array
	public static void main(String[] args) {

		int arr1[]= {2, 15, 13, 5, 0};
		
		int max = arr1[0];
		for(int i=1;i<arr1.length;i++) {
			if(arr1[i]>max)
				max=arr1[i];
		}
		System.out.println(max);
	}
	
//	static int sort(int[] arr) {
//		Arrays.sort(arr);
//		return arr[arr.length - 1];
//	}
	
}
