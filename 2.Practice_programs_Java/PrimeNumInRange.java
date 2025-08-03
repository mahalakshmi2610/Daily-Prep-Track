import java.util.Scanner;

public class PrimeNumInRange {

	public static boolean isPrime(int n) {
		
		if(n<=1) {
			return false;
		}
		for(int i=2;i<=Math.sqrt(n);i++) {
			if(n%i==0) {
				return false;
			}
		}
		return true;
	}
	
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.print("Enter a number to print prime numbers from 1 to number you enter: ");
		int n = sc.nextInt();
		
		for(int i=1;i<=n;i++) {
			if(isPrime(i)) {
				System.out.println(i+ " - prime");
			}
			else {
				System.out.println(i+ " - not prime");
			}
		}
		sc.close();
	}
	
}
