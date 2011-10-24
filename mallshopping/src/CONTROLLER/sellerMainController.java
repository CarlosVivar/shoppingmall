package CONTROLLER; import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.GenericServlet;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BUS.NoticeBUS;
import BUS.ProductBUS;
import BUS.TypeNoticeBUS;
import BUS.UserBUS;
import POJO.Notice;
import POJO.Products;
import POJO.Typenotice;
import POJO.User;

/**
 * Servlet implementation class sellerMainController
 */
public class sellerMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sellerMainController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		try {
			/*
			 * TODO output your page here out.println("<html>");
			 * out.println("<head>");
			 * out.println("<title>Servlet logoutController</title>");
			 * out.println("</head>"); out.println("<body>");
			 * out.println("<h1>Servlet logoutController at " +
			 * request.getContextPath () + "</h1>"); out.println("</body>");
			 * out.println("</html>");
			 */
			String login = (String) session.getAttribute("username");
			if(login==null || login.isEmpty()){
				response.sendRedirect("../login.html");
			}else{
				ServletContext app=getServletContext();;
				String lang=(String)app.getAttribute("MALL_LA");
				
					User user = (User)UserBUS.getUser((String)session.getAttribute("username"),lang);
					List<Products> lst = ProductBUS.lstProduct(user,lang);
					request.setAttribute("lstProduct", lst);
					
					List<Notice> lstNotice1=NoticeBUS.lstNotice(lang);
					request.setAttribute("lstNotice1", lstNotice1);  
				
					Typenotice tn2 = TypeNoticeBUS.getTypenotice(1,lang);
					List<Notice> lstNotice2=NoticeBUS.lstNotice(tn2,lang);
					request.setAttribute("lstNotice2", lstNotice2); 
					
					Typenotice tn5 = TypeNoticeBUS.getTypenotice(4,lang);
					List<Notice> lstNotice5=NoticeBUS.lstNotice(tn5,lang);
					request.setAttribute("lstNotice5", lstNotice5);  
					
					request.getRequestDispatcher("/sale/welcome.jsp").forward(request,response);
			}
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
		processRequest(request, response);
	}

}