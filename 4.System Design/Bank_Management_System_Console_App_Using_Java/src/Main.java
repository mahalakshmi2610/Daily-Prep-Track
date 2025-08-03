import java.util.Scanner;
import model.Customer;
import service.CustomerDAO;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        CustomerDAO dao = new CustomerDAO();

        System.out.print("Enter Customer Name: ");
        String name = sc.nextLine();

        System.out.print("Enter email: ");
        String email = sc.nextLine();

        System.out.print("Enter phone: ");
        String phone = sc.nextLine();

        System.out.print("Enter address: ");
        String address = sc.nextLine();

        Customer newCustomer = new Customer(name, email, phone, address);
        
        boolean result = dao.addCustomer(newCustomer);
        if(result) {
            System.out.println("Customer added successfully!");
        } else {
            System.out.println("Failed to add customer.");
        }

        sc.close();
    }
}