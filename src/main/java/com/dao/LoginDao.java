package com.dao;
import com.entities.*;
import com.helper.FactoryProvider;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class LoginDao {
private SessionFactory factory;

public LoginDao(SessionFactory factory) {
	super();
	this.factory = factory;
}

public User getUserByEmailAndPassword(String umail, String upass)
{
	User user = null;
	try {
		String query = "from User where uMail =: m and uPass =: p";
		Session session = this.factory.openSession();
		Query q = session.createQuery(query);
		q.setParameter("m", umail);
		q.setParameter("p", upass);
		user = (User) q.uniqueResult();
		session.close();
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	return user;
}

}
