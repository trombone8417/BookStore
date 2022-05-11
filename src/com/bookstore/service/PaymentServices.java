package com.bookstore.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.Book;
import com.bookstore.entity.BookOrder;
import com.bookstore.entity.Customer;
import com.bookstore.entity.OrderDetail;
import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.ShippingAddress;
import com.paypal.api.payments.Transaction;

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
		Payer payer = getPayerInformation(order);
		RedirectUrls redirectUrls = getRedirectURLs();
		Amount amount = getAmountDetails(order);
		
		//shipping address (recipient info)
		
		//get transaction details
		
		// request payment
		
		// get approval link
		
		// redirect to Paypal's payment page
	}
	
	private ShippingAddress getRecipientInformation(BookOrder order) {
		ShippingAddress shippingAddress = new ShippingAddress();
		String recipientName = order.getFirstname() + " " + order.getLastname();
		shippingAddress.setRecipientName(recipientName)
						.setPhone(order.getPhone())
						.setLine1(order.getAddressLine1())
						.setLine2(order.getAddressLine2())
						.setCity(order.getCity())
						.setState(order.getState())
						.setCountryCode(order.getCountry())
						.setPostalCode(order.getZipcode());
		
		return shippingAddress;
	}
	
	private List<Transaction> getTransactionInformation(BookOrder order) {
		Transaction transaction = new Transaction();
		transaction.setDescription("Books ordered on Evergreen Books");
		Amount amount = getAmountDetails(order);
		transaction.setAmount(amount);
		
		ItemList itemList = new ItemList();
		ShippingAddress shippingAddress = getRecipientInformation(order);
		itemList.setShippingAddress(shippingAddress);
		
		List<Item> paypalItems = new ArrayList<>();
		Iterator<OrderDetail> iterator = order.getOrderDetails().iterator();
		
		while (iterator.hasNext()) {
			OrderDetail orderDetail = iterator.next();
			Book book = orderDetail.getBook();
			Integer quantity = orderDetail.getQuantity();
			
			Item paypalItem = new Item();
			paypalItem.setCurrency("USD")
						.setName(book.getTitle())
						.setQuantity(String.valueOf(quantity))
						.setPrice(String.valueOf(book.getPrice()));
			paypalItems.add(paypalItem);
		}
		
		itemList.setItems(paypalItems);
		transaction.setItemList(itemList);
		
		List<Transaction> listTransation = new ArrayList<>();
		listTransation.add(transaction);
		
		return listTransation;
	}
	
	private Payer getPayerInformation(BookOrder order) {
		Payer payer = new Payer();
		payer.setPaymentMethod("paypal");
		
		Customer customer = order.getCustomer();
		
		PayerInfo payerInfo = new PayerInfo();
		payerInfo.setFirstName(customer.getFirstname());
		payerInfo.setLastName(customer.getLastname());
		payerInfo.setEmail(customer.getEmail());
		payer.setPayerInfo(payerInfo);
				
		return payer;
	}
	
	private RedirectUrls getRedirectURLs() {
		String requestURL = request.getRequestURI().toString();
		String requestURI = request.getRequestURI();
		String baseURL = requestURL.replace(requestURI, "").concat(request.getContextPath());
		
		RedirectUrls redirectUrls = new RedirectUrls();
		String cancelUrl = baseURL.concat("/view_cart");
		String returnUrl = baseURL.concat("/review_payment");
		
		redirectUrls.setCancelUrl(cancelUrl);
		redirectUrls.setReturnUrl(returnUrl);
		
		return redirectUrls;
	}
	
	private Amount getAmountDetails(BookOrder order) {
		Details details = new Details();
		details.setShipping(String.valueOf(order.getShippingFee()));
		details.setTax(String.valueOf(order.getTax()));
		details.setSubtotal(String.valueOf(order.getSubtotal()));
		
		Amount amount = new Amount();
		amount.setCurrency("USD");
		amount.setDetails(details);
		amount.setTotal(String.valueOf(order.getSubtotal()));
		
		return amount;
	}
}
