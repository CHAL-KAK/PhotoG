package ck.validate;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service("uploadFile")
public class UploadFile {
	private String filename;
	private String desc;
	private MultipartFile file;

	public UploadFile() {
		super();
	}

	public UploadFile(String filename, String desc, MultipartFile file) {
		super();
		this.filename = filename;
		this.desc = desc;
		this.file = file;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
}