package net.ourams.vo;

public class LocationVo {
	private int locationNo;
	private String businessName;
	private String address;
	private int longitude;
	private int latitude;
	
	public LocationVo() {
		
	}
	
	public LocationVo(int locationNo, String businessName, String address, int longitude, int latitude) {
		super();
		this.locationNo = locationNo;
		this.businessName = businessName;
		this.address = address;
		this.longitude = longitude;
		this.latitude = latitude;
	}

	public int getLocationNo() {
		return locationNo;
	}

	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}

	public String getBusinessName() {
		return businessName;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getLongitude() {
		return longitude;
	}

	public void setLongitude(int longitude) {
		this.longitude = longitude;
	}

	public int getLatitude() {
		return latitude;
	}

	public void setLatitude(int latitude) {
		this.latitude = latitude;
	}

	@Override
	public String toString() {
		return "LocationVo [locationNo=" + locationNo + ", businessName=" + businessName + ", address=" + address
				+ ", longitude=" + longitude + ", latitude=" + latitude + "]";
	}
	
	
	
}
