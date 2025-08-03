public class LeftRotateArrayOnePlace {

	static void leftRotate(int arr[], int n) {
		int temp=arr[0];
		for(int i=1;i<n;i++) {
			arr[i-1]=arr[i];
		}
		arr[n-1]=temp;
		for(int i=0;i<n;i++) {
			System.out.print(arr[i]+" ");
		}
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int arr[]= {1, 2, 3, 4, 5, 6};
		int n=arr.length;
		
		leftRotate(arr, n);
	}

}
