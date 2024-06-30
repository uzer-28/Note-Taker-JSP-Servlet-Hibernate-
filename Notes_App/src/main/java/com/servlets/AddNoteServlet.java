package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entity.Note;
import com.helper.FactoryProvider;

@WebServlet("/addNote")
public class AddNoteServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		Note note = new Note(title, content, new Date());
		
		SessionFactory sf =(SessionFactory) new FactoryProvider().getFactory();
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		
		session.save(note);
		
		tx.commit();
		session.close();;
		
//		resp.setContentType("text/html");
//		PrintWriter out = resp.getWriter();
//		out.println("<h2>note added successfully.</h2>");
		
		HttpSession s = req.getSession();
		s.setAttribute("success", "Note added successfully.");
		resp.sendRedirect("add_notes.jsp");
				
	}

	
}
