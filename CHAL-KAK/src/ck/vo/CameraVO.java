package ck.vo;

public class CameraVO {
	private int camera_seq;
	private String maker;
	private int camera_type;
	private int pixel;
	public CameraVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getCamera_seq() {
		return camera_seq;
	}
	public void setCamera_seq(int camera_seq) {
		this.camera_seq = camera_seq;
	}
	public String getMaker() {
		return maker;
	}
	public void setMaker(String maker) {
		this.maker = maker;
	}
	public int getCamera_type() {
		return camera_type;
	}
	public void setCamera_type(int camera_type) {
		this.camera_type = camera_type;
	}
	public int getPixel() {
		return pixel;
	}
	public void setPixel(int pixel) {
		this.pixel = pixel;
	}
	
	
}
