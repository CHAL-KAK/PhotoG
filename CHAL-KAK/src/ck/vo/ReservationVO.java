package ck.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class ReservationVO {
	private int rev_seq;
	private int brd_seq;
	private String m_id;
	private int concept;
	private String start_time;
	private String end_time;
	private int progress;
	private int people_num;
	@DateTimeFormat(iso = ISO.DATE)
	private Date day;

	public ReservationVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getRev_seq() {
		return rev_seq;
	}

	public void setRev_seq(int rev_seq) {
		this.rev_seq = rev_seq;
	}

	public int getBrd_seq() {
		return brd_seq;
	}

	public void setBrd_seq(int brd_seq) {
		this.brd_seq = brd_seq;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getConcept() {
		return concept;
	}

	public void setConcept(int concept) {
		this.concept = concept;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	public int getProgress() {
		return progress;
	}

	public void setProgress(int progress) {
		this.progress = progress;
	}

	public Date getDay() {
		return day;
	}

	public void setDay(Date day) {
		this.day = day;
	}

	public int getPeople_num() {
		return people_num;
	}

	public void setPeople_num(int people_num) {
		this.people_num = people_num;
	}
	
	

	
}
