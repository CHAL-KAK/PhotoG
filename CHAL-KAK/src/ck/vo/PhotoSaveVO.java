package ck.vo;

public class PhotoSaveVO {
	private int map_seq;
	private double lat;
	private double lon;
	private String path;
	private String p_id;

	public PhotoSaveVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getMap_seq() {
		return map_seq;
	}

	public void setMap_seq(int map_seq) {
		this.map_seq = map_seq;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLon() {
		return lon;
	}

	public void setLon(double lon) {
		this.lon = lon;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
}