package com.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.entities.Product;
import com.entities.User;

public class UserDao {
	private SessionFactory sessionFactory;

	public UserDao(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}

	public List<User> getUser() {
		List<User> userList = null;
		try {
			Session s = this.sessionFactory.openSession();
			Query query = s.createQuery("from User");
			userList = query.list();
			s.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userList;
	}
}
