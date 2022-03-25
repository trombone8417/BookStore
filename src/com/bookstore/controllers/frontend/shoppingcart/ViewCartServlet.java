package com.bookstore.controllers.frontend.shoppingcart;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.BookDAO;
import com.bookstore.entity.Book;

@WebServlet("/view_cart")
public class ViewCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ViewCartServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Object cartObject = request.getSession().getAttribute("cart");
		
		if (cartObject == null) {
			ShoppingCart shoppingCart = new ShoppingCart();
			request.getSession().setAttribute("cart", shoppingCart);
			
			BookDAO bookDAO = new BookDAO();
			Book book1 = bookDAO.get(37);
			Book book2 = bookDAO.get(38);
			Book book3 = bookDAO.get(39);
			
			shoppingCart.addItem(book1);
			
			shoppingCart.addItem(book2);
			shoppingCart.addItem(book2);
			
			shoppingCart.addItem(book3);
		}
		
		String cartPage = "frontend/shopping_cart.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(cartPage);
		dispatcher.forward(request, response);
	}

}
