import java.util.Scanner;
import model.Student;
import service.StudentDAO;

public class Main{
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter Student name: ");
        String name = sc.nextLine();

        System.out.print("Enter email: ");
        String email = sc.nextLine();

        System.out.print("Enter phone: ");
        String phone = sc.nextLine();

        System.out.print("Enter address: ");
        String address = sc.nextLine();

        Student newStudent = new Student(name, email, phone, address);
        StudentDAO dao = new StudentDAO();
        boolean result = dao.addStudent(newStudent);

        if(result){
            System.out.println("Student added succesfully!");
        } else{
            System.out.println("Failed to add student.");
        }

        sc.close();
    }
}