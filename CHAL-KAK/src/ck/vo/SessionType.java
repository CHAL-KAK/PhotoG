package ck.vo;

public class SessionType {
	private String id;
	private String type;

	public SessionType() {
		super();
	}

	public SessionType(String id, String type) {
		super();
		this.id = id;
		this.type = type;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "SessionType [id=" + id + ", type=" + type + "]";
	}

}
