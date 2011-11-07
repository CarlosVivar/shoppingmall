package CONTROLLER.OrderManager;

import java.io.IOException;
import java.util.List;

import javax.servlet.GenericServlet;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BUS.ProductorderdetailBUS;
import POJO.Productorderdetail;
import UTIL.NavigationInfo;

/**
 * Servlet implementation class ManageReturnExchangeOrderController
 */
public class ManageReturnExchangeOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NavigationInfo navInfo = new NavigationInfo();

	public NavigationInfo getNavInfo() {
		return navInfo;
	}

	public void setNavInfo(NavigationInfo navInfo) {

		this.navInfo = navInfo;
	}

	private int item = 7;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManageReturnExchangeOrderController() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		ServletContext app = getServletContext();
		String user = (String) session.getAttribute("username");
		String lang = (String) app.getAttribute("MALL_LA");

		String fromDate = request.getParameter("fromDate");
		String toDate = request.getParameter("toDate");

		// setting the paging
		navInfo.setPageSize(item);
		navInfo.setMaxIndices(5);
		String page = (String) request.getParameter("page");
		if (null == page)
			navInfo.setCurrentPage(0);
		else
			navInfo.setCurrentPage(Integer.parseInt(page));
		// setting the paging
		List<Productorderdetail>[] arrays = ProductorderdetailBUS
				.getListPODetailReturnExchangeByBuyer(user, lang, fromDate,
						toDate, navInfo.getCurrentPage(), navInfo.getPageSize());

		navInfo.setRowCount(arrays[0] != null ? arrays[0].size() : 0);
		request.setAttribute("pagedcust", navInfo);
		request.setAttribute("listOrderReturnExchange", arrays[1]);
		request.getRequestDispatcher("/returnexchangeorder.html").forward(
				request, response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

}