import java.util.Arrays;

public class MoveZeros {

	public static void moveZeros(int[] arr) {
		int count = 0;
		for(int i=0;i<arr.length;i++) {
			if(arr[i]!=0) {
				int temp=arr[i];
				arr[i]=arr[count];
				arr[count]=temp;
				
				count++;
			}
		}
	}
	
	public static void main(String[] args) {
		int[] arr = {0, 1, 0, 3, 12};
		moveZeros(arr);
		
		System.out.print(Arrays.toString(arr));
	}

}
