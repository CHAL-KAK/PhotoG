package ck.vo;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service("pictureVO")
public class PictureVO {
	private int pic_seq;
	private String p_id;
	private String file_path01;
	private String file_path02;
	private MultipartFile file;


	public PictureVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getPic_seq() {
		return pic_seq;
	}

	public PictureVO(String file_path01, String file_path02, MultipartFile file) {
		super();
		this.file_path01 = file_path01;
		this.file_path02 = file_path02;
		this.file = file;
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

	public String getFile_path01() {
		return file_path01;
	}

	public void setFile_path01(String file_path01) {
		this.file_path01 = file_path01;
	}
	public String getFile_path02() {
		return file_path02;
	}
	
	public void setFile_path02(String file_path02) {
		this.file_path02 = file_path02;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
}
