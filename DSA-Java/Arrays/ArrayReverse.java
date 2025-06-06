import java.util.Scanner;
import java.util.Arrays;

public class ArrayReverse {
	
	public static void reverseArray(int arr[]) {
        int n=arr.length;
        
        for(int i=0;i<n/2;i++){
            int t = arr[i];
            arr[i] = arr[n-1-i];
            arr[n-1-i] = t;
        }
    }

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.print("Enter array size: ");
		int n = sc.nextInt();
		
		System.out.print("Enter " + n + " elements seperated by space: ");
		int[] arr = new int[n];
		
		for(int i=0;i<n;i++) {
			arr[i] = sc.nextInt();
		}
		
		reverseArray(arr);
		System.out.print("Reversed Array: " + Arrays.toString(arr));
		
		sc.close();
	}
}