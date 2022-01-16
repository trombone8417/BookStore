package com.bookstore.entity;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.bookstore.entity.Category;

public class CategoryTest {

	public static void main(String[] args) {
		Category newCat = new Category("Advanced Java");
		
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("BookStore");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		
		entityManager.getTransaction().begin();
		
		entityManager.persist(newCat);
		
		entityManager.getTransaction().commit();
		entityManager.clear();
		entityManagerFactory.close();
		
		System.out.println("A Category object was persisted");

	}

}
