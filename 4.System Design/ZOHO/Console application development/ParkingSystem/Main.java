import java.util.*;

public class Main{
    static int vehType;
    public static void main(String[] args){
        Scanner sc=new Scanner(System.in);
        ParkSystem VehiclePark=new ParkSystem();
        CheckSlot check=new CheckSlot(VehiclePark);
        while(true){
            System.out.println("Press 1 and enter total parking space");
            System.out.println("Press 2 and enter vehicle Number and Type");
            System.out.println("Press 3 and enter the Vehicle Number to need to be take");
            System.out.println("Press 4 to List the Parking System");
            System.out.println("Press 5 to identify the place of the vehicle");
            System.out.println("Press 0 to Exit\n");

            System.out.print("Enter your Option: ");
            
            String input=sc.next();
            if(input.equals("1")){
                try
                {
                    VehiclePark.createSlot(80);
                    System.out.println("\n---Created a parking slot with "+ 80 + " slots---\n");
                }
                catch(Exception e)
                {
                    System.out.println("\nParking Slot already Created\n");
                }
            }
            else if(input.equals("2")){
                try
                {
                    System.out.print("Enter Vehicle Register Number: ");
                    String regNo = sc.next();
                    System.out.print("Enter Vehicle Type(2/4): ");
                    vehType=sc.nextInt();
                    if(vehType!=2 && vehType!=4){
                        System.out.print("\nSorry, Only 2 or 4 wheeler vehicles allowed\n");
                    }
                    else{
                        Vehicle vehicle=new Vehicle(regNo);
                        int allotedSlot=VehiclePark.allotSlot(vehicle);
                        if(allotedSlot == -1)
                            System.out.println("\nSorry! Parking is full\n");
                        else if(allotedSlot == -2)
                            System.out.println("\nThe Vehicle with this number already exists\n");
                        else
                        {
                            if
                        }
                    }
                }
            }
            else if(input.equals("3")){
                
            }
            else if(input.equals("4")){
                
            }
            else if(input.equals("5")){
                
            }
            else if(input.equals("0")){
                try{
                    System.exit(0);
                }
                catch(Exception e){
                    System.out.println("\nInvalid Commmand\n"+e);
                    continue;
                }
            }
            else{
                System.out.println("\nEnter a Valid option \n");
                continue;
            }
        }
    }
}