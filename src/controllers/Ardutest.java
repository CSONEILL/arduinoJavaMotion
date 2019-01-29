/**
 * Ardutest.java
 * Test code for arduino movement
 * CSO
 * 
 */
package controllers;
import arduino.*;



public class Ardutest {
static Ardu a =new Ardu();
/**
 * Main function sends instructions to arduino to test connectivity and movement
 * 	
 * @param args
 */
	public static void main(String[] args) {
		
		        Arduino obj = new Arduino("dev/ttyACM0", 9600);		        
		        obj.openConnection();
		        
		        System.out.print("\n sending U ");
		        for (int i=0 ; i <30 ;i++)
		        {
		        obj.serialWrite("U");
		        System.out.print(i);
		        }
		        System.out.print("\n sending D ");
		        for (int i=0 ; i <30 ;i++)
		        {
		        obj.serialWrite("D");
		        System.out.print(i);
		        }
		        
		        
		        System.out.print("\n sending L ");
		        for (int i=0 ; i <40;i++)
		        {
		        obj.serialWrite("L");
		        System.out.print(i+" ");
		        }
		        System.out.print("\n sending R ");
		        for (int i=0 ; i <40;i++)
		        {
		        obj.serialWrite("R");
		        System.out.print(i+" ");
		        }
		        obj.closeConnection();

		
		
		
	}

}
