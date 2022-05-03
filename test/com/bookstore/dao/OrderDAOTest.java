package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.BookOrder;
import com.bookstore.entity.Customer;
import com.bookstore.entity.OrderDetail;
import com.bookstore.entity.OrderDetailId;

public class OrderDAOTest {
	
	private static OrderDAO orderDAO;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		orderDAO = new OrderDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		orderDAO.close();
	}
	
	@Test
	public void testCreateBookOrder2() {
		BookOrder order = new BookOrder();
		Customer customer = new Customer();
		customer.setCustomerId(12);
		
		order.setCustomer(customer);
		order.setFirstname("Nam Ha Minh");
		order.setPhone("123456789");
		order.setAddressLine1("123 South Street, New York, USA");
		
		Set<OrderDetail> orderDetails = new HashSet<>();
		OrderDetail orderDetail1 = new OrderDetail();
		
		Book book1 = new Book(37);
		orderDetail1.setBook(book1);
		orderDetail1.setQuantity(2);
		orderDetail1.setSubtotal(50.5f);
		orderDetail1.setBookOrder(order);
		
		orderDetails.add(orderDetail1);

		Book book2 = new Book(38);
		OrderDetail orderDetail2 = new OrderDetail();
		orderDetail2.setBook(book2);
		orderDetail2.setQuantity(1);
		orderDetail2.setSubtotal(40.5f);
		orderDetail2.setBookOrder(order);
		
		orderDetails.add(orderDetail2);
		
		order.setOrderDetails(orderDetails);
		
		orderDAO.create(order);
		
		assertTrue(order.getOrderId() > 0 && order.getOrderDetails().size() == 2);
	}

	@Test
	public void testCreateBookOrder() {
		BookOrder order = new BookOrder();
		Customer customer = new Customer();
		customer.setCustomerId(12);
		
		order.setCustomer(customer);
		order.setFirstname("Nam");
		order.setLastname("Ha Minh");
		order.setPhone("123456789");
		order.setAddressLine1("123 South Street");
		order.setAddressLine2("Clifton Park");
		order.setCity("New York");
		order.setState("New York");
		order.setCountry("US");
		order.setPaymentMethod("paypal");
		order.setZipcode("123456");
		
		Set<OrderDetail> orderDetails = new HashSet<>();
		OrderDetail orderDetail = new OrderDetail();
		
		Book book = new Book(37);
		orderDetail.setBook(book);
		orderDetail.setQuantity(2);
		orderDetail.setSubtotal(60.5f);
		orderDetail.setBookOrder(order);
		
		orderDetails.add(orderDetail);
		
		order.setOrderDetails(orderDetails);
		order.setTax(6.8f);
		order.setShippingFee(2.0f);
		order.setSubtotal(68.0f);
		order.setTotal(76.8f);
		
		orderDAO.create(order);
		
		assertTrue(order.getOrderId() > 0);
	}

	@Test
	public void testUpdateBookOrder() {
		fail("Not yet implemented");
	}
	
	@Test
	public void testUpdateBookOrderShippingAddress() {
		Integer orderId = 23;
		BookOrder order = orderDAO.get(orderId);
		order.setAddressLine1("New Shipping Address");
		
		orderDAO.update(order);
		
		BookOrder updateOrder = orderDAO.get(orderId);
		
		assertEquals(order.getAddressLine1(), updateOrder.getAddressLine1());
	}

	@Test
	public void testUpdateBookOrderDetail() {
		Integer orderId = 33;
		BookOrder order = orderDAO.get(orderId);
		
		Iterator<OrderDetail> iterator = order.getOrderDetails().iterator();
		
		while (iterator.hasNext()) {
			OrderDetail orderDetail = iterator.next();
			if (orderDetail.getBook().getBookId() == 37) {
				orderDetail.setQuantity(3);
				orderDetail.setSubtotal(120);
			}
		}
		
		orderDAO.update(order);
		
		BookOrder updateOrder = orderDAO.get(orderId);
				
		iterator = order.getOrderDetails().iterator();
		
		int expectedQuantity =3;
		float expectedSubtotal = 120;
		int actualQuantity = 0;
		float actualSubtotal = 0;
		
		while (iterator.hasNext()) {
			OrderDetail orderDetail = iterator.next();
			if (orderDetail.getBook().getBookId() == 37) {
				actualQuantity = orderDetail.getQuantity();
				actualSubtotal = orderDetail.getSubtotal();
			}
		}
		
		assertEquals(expectedQuantity,actualQuantity);
		assertEquals(expectedSubtotal, actualSubtotal, 0.0f);
	}

	@Test
	public void testGet() {
		Integer orderId = 33;
		BookOrder order = orderDAO.get(orderId);
		System.out.println(order.getFirstname());
		System.out.println(order.getLastname());
		System.out.println(order.getPhone());
		System.out.println(order.getAddressLine1());
		System.out.println(order.getAddressLine2());
		System.out.println(order.getCity());
		System.out.println(order.getState());
		System.out.println(order.getCountry());
		System.out.println(order.getZipcode());
		System.out.println(order.getStatus());
		System.out.println(order.getSubtotal());
		System.out.println(order.getShippingFee());
		System.out.println(order.getTax());
		System.out.println(order.getTotal());
		System.out.println(order.getPaymentMethod());
		
		assertEquals(1, order.getOrderDetails().size());
	}
	
	@Test
	public void testGetByIdAndCustomerNull() {
		Integer orderId = 10;
		Integer customerId = 99;
		
		BookOrder order = orderDAO.get(orderId,customerId);
		
		assertNull(order);
	}

	@Test
	public void testGetByIdAndCustomerNotNull() {
		Integer orderId = 25;
		Integer customerId = 12;
		
		BookOrder order = orderDAO.get(orderId,customerId);
		
		assertNotNull(order);
	}
	
	@Test
	public void testDeleteOrder() {
		int orderId = 27;
		orderDAO.delete(orderId);
		
		BookOrder order = orderDAO.get(orderId);
		
		assertNull(order);
	}

	@Test
	public void testListAll() {
		List<BookOrder> listOrders = orderDAO.listAll();
		
		for (BookOrder order : listOrders) {
			System.out.println(order.getOrderId() + " - " + order.getCustomer().getFirstname()
					+ " - " + order.getTotal() + " - " + order.getStatus());
			for (OrderDetail detail : order.getOrderDetails()) {
				Book book = detail.getBook();
				int quantity = detail.getQuantity();
				float subtotal = detail.getSubtotal();
				System.out.println("\t" + book.getTitle() + " - " + quantity + " - " +subtotal);
			}
		}
		
		assertTrue(listOrders.size() > 0);
	}
	
	@Test
	public void testListByCustomerNoOrders() {
		Integer customerId = 99;
		List<BookOrder> listOrders = orderDAO.listByCustomer(customerId);
		
		assertTrue(listOrders.isEmpty());
	}
	
	@Test
	public void testListByCustomerHaveOrders() {
		Integer customerId = 12;
		List<BookOrder> listOrders = orderDAO.listByCustomer(customerId);
		
		assertTrue(listOrders.size() > 0);
	}

	@Test
	public void testCount() {
		long totalOrders = orderDAO.count();
		assertEquals(6, totalOrders);
	}
	
	@Test
	public void listMostRecentSales() {
		List<BookOrder> recentOrders = orderDAO.listMostRecentSales();
		
		assertEquals(3, recentOrders.size());
	}

}
