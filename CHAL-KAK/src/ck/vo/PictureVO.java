package ck.vo;

public class PictureVO {
	private int pic_seq;
	private String p_id;
	private String file_path;
	private String file_name;

	public PictureVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getPic_seq() {
		return pic_seq;
	}

	public void setPic_seq(int pic_seq) {
		this.pic_seq = pic_seq;
	}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

}
