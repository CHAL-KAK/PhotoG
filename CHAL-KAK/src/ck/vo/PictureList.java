package ck.vo;

import org.springframework.stereotype.Service;

@Service("pictureList")
public class PictureList {
	private String filename;
	private String filepath;

	public PictureList() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PictureList(String filename, String filepath) {
		super();
		this.filename = filename;
		this.filepath = filepath;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

}
