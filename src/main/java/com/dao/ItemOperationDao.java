package com.dao;

import java.util.List;

import javax.servlet.Servlet;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entities.Category;
import com.entities.Product;

public class ItemOperationDao {
	private SessionFactory sessionFactory;

	public ItemOperationDao(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}
	
	public int setCategory(Category category)
	{
		try {
			Session s = this.sessionFactory.openSession();
			Transaction tx = s.beginTransaction();
			int catId = (Integer) s.save(category);
			tx.commit();
			s.close();
			
			return catId;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public List<Category> getCategories()
	{
		Session s = sessionFactory.openSession();
		Query query = s.createQuery("from Category");
		List<Category> categories = query.list();
		s.close();
		
		return categories;
	}
	
	public Category getProductCategory(int pCategoryId)
	{
		Category category = null;
		try 
		{
			Session s = this.sessionFactory.openSession();
			Transaction tx = s.beginTransaction();
			category = (Category) s.get(Category.class, pCategoryId);
			tx.commit();
			s.close();		
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return category;
	}
	
	public int setProduct(Product  product)
	{
		try {
			Session s = this.sessionFactory.openSession();
			Transaction tx = s.beginTransaction();
			int pId = (Integer) s.save(product);
			tx.commit();
			s.close();
			
			return pId;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

}
