public class HasElementInArray {

	static int FindIndex(int arr[], int num, int n) {
		int res=-1;
		for(int i=0;i<n;i++) {
			if(arr[i]==num) {
				res=i;
				break;
			}
		}
		return res;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int arr[]= {1, 2, 3, 4, 5};
		int num = 6;
		
		int n=arr.length;
		int res=FindIndex(arr, num, n);
		if(res!=-1) {
			System.out.println("The element "+num + " is present at index "+res);
		}
		else {
			System.out.println("There is no element "+num+ " in the array");
		}

	}

}
