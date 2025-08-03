public class SortedArrayOrNot {

	static boolean isSorted(int arr[], int n) {
		for(int i=1;i<n;i++) {
			if(arr[i]<arr[i-1]) {
				return false;
			}
		}
		return true;
	}
	
	public static void main(String[] args) {
		int arr[]= {2, 3, 4, 5, 1};
		int n=arr.length;
		
		System.out.println(isSorted(arr, n));
	}

}
