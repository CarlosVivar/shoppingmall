package CONTROLLER;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import UTIL.ResourcesDefault;

/**
 * Servlet implementation class supportcontroller
 */
public class supportcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public supportcontroller() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void process(HttpServletRequest request,HttpServletResponse response){
    	String lang=(String) getServletContext().getAttribute("MALL_LA");
    	HttpSession session=request.getSession();
    	String name="",email="",phone="",message="";
    	name=request.getParameter("name");
    	email=request.getParameter("email");
    	phone=request.getParameter("phone");
    	message=request.getParameter("message");
    	
    	//save mail to supportemail
    	String content="",receiver="luanle19@gmail.com",receiverName="Luan",subject="Contact from the customer";
    	content="Your have a contact from the customer on the khongmac.com !" +
    			"<br>CustomerName:&nbsp;"+name+" <br>" +
    			"<br>Customer's email:&nbsp;"+email+" <br>" +
    			"<br>Customer's phone:&nbsp;"+phone+" <br>" +
    			"<br>Customer's message: <br>";
    	content+=message;
    	try {
			ResourcesDefault.sendSimpleEMail(receiver, receiverName, content, subject, lang);
			session.setAttribute("message", "message");
			response.sendRedirect("support.html");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

}
