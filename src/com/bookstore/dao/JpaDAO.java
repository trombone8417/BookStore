package com.bookstore.dao;

import javax.persistence.EntityManager;

public class JpaDAO<T> {
	protected EntityManager entityManager;

	public JpaDAO(EntityManager entityManager) {
		super();
		this.entityManager = entityManager;
	}
	
	public T create(T t) {
		entityManager.getTransaction().begin();
		
		entityManager.persist(t);
		entityManager.flush();
		entityManager.refresh(t);
		
		entityManager.getTransaction().commit();
		
		return t;
	}
}
