/**
 * MotorButtonController.java
 * receives and process Pan (left/Right)commands from buttons on screen and those commands to arduino 
 * CSO  
 */
package controllers;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;






/**
 * Servlet implementation class MotorController
 */
@WebServlet("/MotorButtonController")
public class MotorButtonController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Ardu a;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MotorButtonController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("static-access")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String direction = request.getParameter("leftright");
		if (direction !=null)
		{
		System.out.println(direction);
		a.call_movement( direction);
		
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
