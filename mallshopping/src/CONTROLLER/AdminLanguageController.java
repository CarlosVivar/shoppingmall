package CONTROLLER;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminLanguageController
 */
public class AdminLanguageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		ServletContext app = getServletContext();
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

			String type = (String) request.getParameter("lang");
			if (type == null) {
				type = "3";
			}
			// System.out.println(Integer.parseInt(type));
			switch (Integer.parseInt(type)) {
			case 1:
				// cf.execute_en();
				app.setAttribute("MALL_LA", "MALL_EN");
				app.setAttribute("FLAG", "flag_en.gif");
				break;
			case 2:
				// cf.execute_kr();
				app.setAttribute("MALL_LA", "MALL_KR");
				app.setAttribute("FLAG", "flag_kr.gif");
				break;
			case 3:
				// cf.execute_vn();
				app.setAttribute("MALL_LA", "MALL_VN");
				app.setAttribute("FLAG", "flag_vn.gif");
				break;
			}
			session.removeAttribute("lastpage");
			response.sendRedirect("login.html");

		} finally {
			out.close();
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
