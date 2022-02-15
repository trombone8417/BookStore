package com.bookstore.controllers.frontend;

import com.bookstore.controllers.BaseServlet;
import com.bookstore.service.BookServices;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/search")
public class SearchBookServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

    public SearchBookServlet() {
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookServices bookServices = new BookServices(entityManager, request, response);
		bookServices.search();
	}
    
    

}
