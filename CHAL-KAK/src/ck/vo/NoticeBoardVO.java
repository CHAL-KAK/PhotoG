package ck.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class NoticeBoardVO {
	private int brd_seq;
	private String p_id;
	@DateTimeFormat(iso = ISO.DATE)
	private Date day;
	private String start_time;
	private String end_time;
	private String place;
	private int concept;
	private int max;
	private int progress;
	private String title;
	private String content;

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

	public Date getDay() {
		return day;
	}

	public void setDay(Date day) {
		this.day = day;
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

	public NoticeBoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "NoticeBoardVO [brd_seq=" + brd_seq + ", p_id=" + p_id + ", day=" + day + ", start_time=" + start_time
				+ ", end_time=" + end_time + ", place=" + place + ", concept=" + concept + ", max=" + max
				+ ", progress=" + progress + "]";
	}

}
