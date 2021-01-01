package com.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.entities.Product;

public class ProductDao {
	private SessionFactory sessionFactory;

	public ProductDao(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}
	
	public List<Product> getProduct()
	{
		List<Product> product = null;
		try 
		{
			Session s = this.sessionFactory.openSession();
			Query query = s.createQuery("from Product");
			product = query.list();
			s.close();
		} 
		catch (Exception e) {
			e.printStackTrace();
		} 
		return product;
	}
//	get product by category
	public List<Product> getProductByCategory(int catId)
	{
		List<Product> product = null;
		try 
		{
			Session s = this.sessionFactory.openSession();
			Query query = s.createQuery("from Product as p where p.category.cId =: id");
			query.setParameter("id", catId);
			product = query.list();
			s.close();
		} 
		catch (Exception e) {
			e.printStackTrace();
		} 
		return product;
	}
}
