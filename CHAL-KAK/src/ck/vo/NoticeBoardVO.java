package ck.vo;

import java.util.Date;

public class NoticeBoardVO {
	private int brd_seq;
	private String p_id;
	private Date start_time;
	private Date end_time;
	private String place;
	private int concept;
	private int max;
	private int progress;

	public NoticeBoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getBrd_seq() {
		return brd_seq;
	}

	public void setBrd_seq(int brd_seq) {
		this.brd_seq = brd_seq;
	}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	public Date getStart_time() {
		return start_time;
	}

	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}

	public Date getEnd_time() {
		return end_time;
	}

	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public int getConcept() {
		return concept;
	}

	public void setConcept(int concept) {
		this.concept = concept;
	}

	public int getMax() {
		return max;
	}

	public void setMax(int max) {
		this.max = max;
	}

	public int getProgress() {
		return progress;
	}

	public void setProgress(int progress) {
		this.progress = progress;
	}

}
