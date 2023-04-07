package controller;

public class BloodBank {
	String bloodBankName="";
	   String hospital="";
	   String address="";
	   String contact="";
	   String email="";
	   String website="";
	   public BloodBank() {
		   
	   }
	public BloodBank(String bloodBankName, String hospital, String address, String contact, String email,
			String website) {
		super();
		this.bloodBankName = bloodBankName;
		this.hospital = hospital;
		this.address = address;
		this.contact = contact;
		this.email = email;
		this.website = website;
	}
	public String getBloodBankName() {
		return bloodBankName;
	}
	public String getHospital() {
		return hospital;
	}
	public String getAddress() {
		return address;
	}
	public String getContact() {
		return contact;
	}
	public String getEmail() {
		return email;
	}
	public String getWebsite() {
		return website;
	}
	public void setBloodBankName(String bloodBankName) {
		this.bloodBankName = bloodBankName;
	}
	public void setHospital(String hospital) {
		this.hospital = hospital;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	   
}
