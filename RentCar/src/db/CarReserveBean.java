package db;

public class CarReserveBean {
	
	private int reserveNo;
	private int no;
	private String id;
	private int quantity;
	private int rentDuration;
	private String rentDate;//date 타입으로 받았을경우 데이터가 안들어감.
	private int insurance;
	private int Wifi;
	private int Navigation;
	private int BabySheet;
	
	
	public int getReserveNo() {
		return reserveNo;
	}
	public void setReserveNo(int reserveNo) {
		this.reserveNo = reserveNo;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getRentDuration() {
		return rentDuration;
	}
	public void setRentDuration(int rentDuration) {
		this.rentDuration = rentDuration;
	}
	public String getRentDate() {
		return rentDate;
	}
	public void setRentDate(String rentDate) {
		this.rentDate = rentDate;
	}
	public int getInsurance() {
		return insurance;
	}
	public void setInsurance(int insurance) {
		this.insurance = insurance;
	}
	public int getWifi() {
		return Wifi;
	}
	public void setWifi(int wifi) {
		Wifi = wifi;
	}
	public int getNavigation() {
		return Navigation;
	}
	public void setNavigation(int navigation) {
		Navigation = navigation;
	}
	public int getBabySheet() {
		return BabySheet;
	}
	public void setBabySheet(int babySheet) {
		BabySheet = babySheet;
	}
	
	
	
	
	
}
