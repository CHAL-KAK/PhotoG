package ck.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class PhotographerVO {
	private int photog_seq;
	private String p_id;
	private String p_password;
	private String p_name;
	private String p_gender;
	@DateTimeFormat(iso = ISO.DATE)
	private Date p_bday;
	private String p_ka_id;
	private int camera_seq;
	private int concept;
	private String career;
	private String url;

	public PhotographerVO() {
		super();
	}

	public PhotographerVO(String p_id, String p_password) {
		super();
		this.p_id = p_id;
		this.p_password = p_password;
	}

	public int getPhotog_seq() {
		return photog_seq;
	}

	public void setPhotog_seq(int photog_seq) {
		this.photog_seq = photog_seq;
	}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	public String getP_password() {
		return p_password;
	}

	public void setP_password(String p_password) {
		this.p_password = p_password;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_gender() {
		return p_gender;
	}

	public void setP_gender(String p_gender) {
		this.p_gender = p_gender;
	}

	public Date getP_bday() {
		return p_bday;
	}

	public void setP_bday(Date p_bday) {
		this.p_bday = p_bday;
	}

	public String getP_ka_id() {
		return p_ka_id;
	}

	public void setP_ka_id(String p_ka_id) {
		this.p_ka_id = p_ka_id;
	}

	public int getCamera_seq() {
		return camera_seq;
	}

	public void setCamera_seq(int camera_seq) {
		this.camera_seq = camera_seq;
	}

	public int getConcept() {
		return concept;
	}

	public void setConcept(int concept) {
		this.concept = concept;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "PhotographerVO [photog_seq=" + photog_seq + ", p_id=" + p_id + ", p_password=" + p_password
				+ ", p_name=" + p_name + ", p_gender=" + p_gender + ", p_bday=" + p_bday + ", p_ka_id=" + p_ka_id
				+ ", camera_seq=" + camera_seq + ", concept=" + concept + ", career=" + career + ", url=" + url + "]";
	}
	
	
	
	

}
