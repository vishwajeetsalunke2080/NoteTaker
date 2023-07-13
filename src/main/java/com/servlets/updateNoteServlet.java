package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.note;
import com.providers.FactoryProvider;

public class updateNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public updateNoteServlet() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Session s = FactoryProvider.getFactory().openSession();
			Transaction trx = s.beginTransaction();
			int noteID = Integer.parseInt(request.getParameter("noteID").trim());
			String noteTitle = request.getParameter("title");
			String noteContent = request.getParameter("content");
			note noteObject = new note();
			noteObject.setId(noteID);
			noteObject.setNoteTitle(noteTitle);
			noteObject.setNoteContent(noteContent);
			noteObject.setAddedDate(new Date());
			s.update(noteObject);
			trx.commit();
			s.close();
			response.sendRedirect("showNotes.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
