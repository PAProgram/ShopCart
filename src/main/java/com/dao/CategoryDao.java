package com.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.entities.Category;

public class CategoryDao {
	private SessionFactory sessionFactory;

	public CategoryDao(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}
	public List<Category> getCategories()
	{
		Session s = sessionFactory.openSession();
		Query query = s.createQuery("from Category");
		List<Category> categories = query.list();
		s.close();
		
		return categories;
	}
}
