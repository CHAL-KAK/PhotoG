package ck.vo;

import java.util.Date;

public class ModelVO {
	private int model_seq;
	private String m_id;
	private String m_password;
	private String m_name;
	private String m_gender;
	private Date m_bday;
	private String m_ka_id;

	public ModelVO() {
		super();
	}

	public int getModel_seq() {
		return model_seq;
	}

	public void setModel_seq(int model_seq) {
		this.model_seq = model_seq;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_password() {
		return m_password;
	}

	public void setM_password(String m_password) {
		this.m_password = m_password;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_gender() {
		return m_gender;
	}

	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}

	public Date getM_bday() {
		return m_bday;
	}

	public void setM_bday(Date m_bday) {
		this.m_bday = m_bday;
	}

	public String getM_ka_id() {
		return m_ka_id;
	}

	public void setM_ka_id(String m_ka_id) {
		this.m_ka_id = m_ka_id;
	}

}
