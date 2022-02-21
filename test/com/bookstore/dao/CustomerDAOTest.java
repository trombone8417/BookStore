package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Customer;

public class CustomerDAOTest {
	private static CustomerDAO customerDao;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		customerDao = new CustomerDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		customerDao.close();
	}

	@Test
	public void testCreateCustomer() {
		Customer customer = new Customer();
		customer.setEmail("tom@gmail.com");
		customer.setFullname("tom@gmail.com");
		customer.setCity("New York");
		customer.setCountry("United States");
		customer.setAddress("100 North Avenue");
		customer.setPassword("secret");
		customer.setPhone("18001900");
		customer.setZipcode("100000");
		
		Customer savedCustomer = customerDao.create(customer);
		
		assertTrue(savedCustomer.getCustomerId() > 0);
	}

	@Test
	public void testGet() {
		Integer customerId = 11;
		Customer customer = customerDao.get(customerId);
		
		assertNotNull(customer);
	}
	
	@Test
	public void testUpdateCustomer() {
		Customer customer = customerDao.get(11);
		String fullName = "Tom Tom Tom";
		customer.setFullname(fullName);
		
		Customer updatedCustomer  = customerDao.update(customer);
		
		assertTrue(updatedCustomer.getFullname().equals(fullName));
	}

	@Test
	public void testDeleteObject() {
		Integer customerId = 11;
		customerDao.delete(customerId);
		Customer customer = customerDao.get(11);
		
		assertNull(customer);
	}
	
	@Test
	public void testListAll() {
		List<Customer> listCustomers = customerDao.listAll();
		
		for (Customer customer : listCustomers) {
			System.out.println(customer.getFullname());
		}
		
		assertFalse(listCustomers.isEmpty());
	}

	@Test
	public void testCount() {
		long totalCustomers = customerDao.count();
		
		assertEquals(1, totalCustomers);
	}
}











