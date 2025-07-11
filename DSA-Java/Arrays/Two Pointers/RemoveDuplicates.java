// remove duplicates from sorted array

public class RemoveDuplicates {

    public static int removeDuplicates(int[] arr){

        int n = arr.length;
        if(n <= 1){
            return n;
        }

        int idx = 1; // idx holds the index of next distinct item

        for(int i=1;i<n;i++){
            if(arr[i] != arr[i-1]){
                arr[idx++] = arr[i];
            }
        }

        return idx;
    }

    public static void main(String[] args) {
        int[] arr = {1, 2, 2, 3, 4, 4, 5, 5};
        int newSize = removeDuplicates(arr);

        for(int i=0;i<newSize;i++){
            System.out.print(arr[i]+" ");
        }
    }
}