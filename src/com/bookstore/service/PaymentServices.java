package com.bookstore.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.BookOrder;

public class PaymentServices {
	private static final String CLIENT_ID = "";
	private static final String CLIENT_SECRET = "";
	private String mode = "sandbox";
	
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	public PaymentServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
	}
	
	public void authorizePayment(BookOrder order) {
		//get payer information
		
		//get redirect URLs
		
		//get amount details
		
		//shipping address (recipient info)
		
		//get transaction details
	}
}
