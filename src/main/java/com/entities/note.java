package com.entities;

import java.util.Date;
import java.util.Random;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class note {
	
	@Id
	@Column(name = "ID")
	private int id;
	
	@Column(name = "Title")
	private String noteTitle;
	
	@Column(name = "Contents",length = 1500)
	private String noteContent;
	
	@Column(name = "TimeStamp")
	@Temporal(TemporalType.DATE)
	private Date addedDate;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNoteTitle() {
		return noteTitle;
	}

	public void setNoteTitle(String noteTitle) {
		this.noteTitle = noteTitle;
	}

	public String getNoteContent() {
		return noteContent;
	}

	public void setNoteContent(String noteContent) {
		this.noteContent = noteContent;
	}

	public Date getAddedDate() {
		return addedDate;
	}

	public void setAddedDate(Date addedDate) {
		this.addedDate = addedDate;
	}

	public note(String noteTitle, String noteContent, Date addedDate) {
		super();
		this.id = new Random().nextInt(10000);
		this.noteTitle = noteTitle;
		this.noteContent = noteContent;
		this.addedDate = addedDate;
	}

	public note() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
