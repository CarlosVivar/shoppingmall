package CONTROLLER; import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BUS.*;
import DAO.ProductorderDAO;
import DAO.ProductorderdetailDAO;
import POJO.*;
import UTIL.NavigationInfo;

/**
 * Servlet implementation class manageOrderController
 */
public class manageOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int item = 12;
	private NavigationInfo navInfo = new NavigationInfo();
	   
    public NavigationInfo getNavInfo() {
        return navInfo;
    }
    public void setNavInfo(NavigationInfo navInfo) {
        
        this.navInfo = navInfo;
    }
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public manageOrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
       HttpSession session = request.getSession();
        
        
        ServletContext app=getServletContext();
        try {
        	String url = "";
        	if(session.getAttribute("username") == null || !session.getAttribute("Role").equals("Admin")){
        		request.setAttribute("Message","Please login to access system !");
        		url = "/admin/login.html";
        	}else{
        	String status=request.getParameter("status");
            
            if(status==null){
            	status="1";
            }
            System.out.println("status:"+status);
        	
        	ArrayList<Productorderdetail> lstOrders1=ProductorderdetailDAO.getOrder1(status,(String) app.getAttribute("MALL_LA"));
        	request.setAttribute("lstOrders1", lstOrders1);
          	
				if (lstOrders1 == null || lstOrders1.size() == 0) {
					request.setAttribute("Message", "Product not exist");
				
				request.getRequestDispatcher("admin/order.html").forward(
						request, response);
			} else {
				request.getRequestDispatcher("admin/order.jsp").forward(
						request, response);
			}
        	
        	
        	}
            
        	
        	
        }catch(Exception ex){
             out.println(ex.getMessage() );
        } finally {
            out.close();
        }
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
