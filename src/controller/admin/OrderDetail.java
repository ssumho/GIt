package controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AdminDao;
import dao.MyShopDao;
import model.CartItem;
import model.Order;

@WebServlet("/admin/detail")
public class OrderDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public OrderDetail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid = Integer.parseInt(request.getParameter("or_uid"));
		int cart_uid = Integer.parseInt(request.getParameter("cart_uid"));
		
		AdminDao dao = new AdminDao();
		
		Order o = dao.adminorderView(uid);
		Order s = dao.adminorderStatus(cart_uid);
		
		List<CartItem> list = dao.adminorderItemList(uid);
		
		request.setAttribute("order", o);
		request.setAttribute("status", s);
		request.setAttribute("list", list);

		RequestDispatcher dis = request.getRequestDispatcher("detail.jsp");
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
