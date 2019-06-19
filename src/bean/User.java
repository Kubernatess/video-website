package bean;

public class User {
	private String username;
	private String password;
	private String email;
	private String phone;
	private boolean VIP;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public boolean isVIP() {
		return VIP;
	}
	public void setVIP(boolean vIP) {
		VIP = vIP;
	}
}
