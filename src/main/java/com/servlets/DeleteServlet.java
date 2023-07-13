package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.note;
import com.providers.FactoryProvider;

public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{
		try
		{
			int noteID = Integer.parseInt(request.getParameter("noteID").trim());
			Session s = FactoryProvider.getFactory().openSession();
			Transaction trx = s.beginTransaction();
			note noteObject = (note) s.get(note.class, noteID);  
			s.delete(noteObject);
			trx.commit();
			s.close();
			response.sendRedirect("showNotes.jsp");
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}

}
