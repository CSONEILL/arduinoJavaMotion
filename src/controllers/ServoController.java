/**
 * ServoController.java
 * receives and process Tilt(up/right) commands from browser/javascript 
 * when the user is working with a touchscreen and those commands are send  to arduino 
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
 * Servlet implementation class ServoController
 */
@WebServlet("/ServoController")
public class ServoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static Ardu a =new Ardu();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServoController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings("static-access")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String updown = request.getParameter("updown");	
		
		if (updown !=null)
		{
		System.out.println(updown);
		a.call_movement(updown);
		}   
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
