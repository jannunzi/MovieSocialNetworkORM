package edu.neu.cs5200.msn.orm.models;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Actor {
	@Id
	private Integer id;
	private String first;
	private String last;
	@Temporal(TemporalType.DATE)
	private Date dob;
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="movieId")
	private Movie movie;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getFirst() {
		return first;
	}
	public void setFirst(String first) {
		this.first = first;
	}
	public String getLast() {
		return last;
	}
	public void setLast(String last) {
		this.last = last;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public Movie getMovie() {
		return movie;
	}
	public void setMovie(Movie movie) {
		this.movie = movie;
	}
	public Actor(Integer id, String first, String last, Date dob, Movie movie) {
		super();
		this.id = id;
		this.first = first;
		this.last = last;
		this.dob = dob;
		this.movie = movie;
	}
	public Actor() {
		super();
	}
}
