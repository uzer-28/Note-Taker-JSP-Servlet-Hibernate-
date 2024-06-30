package com.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.entity.Note;

public class FactoryProvider {
	
	private static SessionFactory sf;
	
	public static SessionFactory getFactory() {
		
		if(sf == null) {
			sf = new Configuration().configure().addAnnotatedClass(Note.class)
					.buildSessionFactory();
		}
		
		return sf;
	}
	
	public void closeFactory() {
		
		if(sf.isOpen()) {
			sf.close(); 
		}
	}

}
