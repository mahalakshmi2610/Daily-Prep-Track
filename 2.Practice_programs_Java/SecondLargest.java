public class SecondLargest {
	public static void main(String[] args) {
		
		int arr[]= {1, 1, 2, 3, 4, 5};
		
		int small=Integer.MAX_VALUE;
		int second_small=Integer.MAX_VALUE;
		
		int large=Integer.MIN_VALUE;
		int second_large=Integer.MIN_VALUE;
		
		for(int i=0;i<arr.length;i++) {
			if(arr[i]<small) {
				second_small=small;
				small=arr[i];
			}
			else if(arr[i]<second_small && arr[i]!=small) {
				second_small=arr[i];
			}
			if(arr[i]>large) {
				second_large=large;
				large=arr[i];
			}
			else if(arr[i]>second_large && arr[i]!=large) {
				second_large=arr[i];
			}
		}

		System.out.println("small:"+small);
		System.out.println("second small:"+second_small);
		System.out.println("second large:"+second_large);
		System.out.println("large:"+large);
		
	}
}
