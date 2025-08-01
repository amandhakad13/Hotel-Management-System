package model;

public class Room {
	
	private int r_id;
	private String r_type;
	private int r_price;
	private int r_status;
	
	public Room() {
		
	}

	public Room(int r_id, String r_type, int r_price, int r_status) {
		super();
		this.r_id = r_id;
		this.r_type = r_type;
		this.r_price = r_price;
		this.r_status = r_status;
	}

	public int getR_id() {
		return r_id;
	}

	public void setR_id(int r_id) {
		this.r_id = r_id;
	}

	public String getR_type() {
		return r_type;
	}

	public void setR_type(String r_type) {
		this.r_type = r_type;
	}

	public int getR_price() {
		return r_price;
	}

	public void setR_price(int r_price) {
		this.r_price = r_price;
	}

	public int getR_status() {
		return r_status;
	}

	public void setR_status(int r_status) {
		this.r_status = r_status;
	}

	@Override
	public String toString() {
		return "Hotel [r_id=" + r_id + ", r_type=" + r_type + ", r_price=" + r_price + ", r_status=" + r_status + "]";
	}
}
