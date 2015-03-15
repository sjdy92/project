package vo.user;

public class User 
{
	private String id;
	private String pass;
	private String name;
	private String jumin1;
	private String jumin2;
	private String tel1;
	private String tel2;
	private String tel3;
	private String mobile1;
	private String mobile2;
	private String mobile3;
	private String zipcode1;
	private String zipcode2;
	private String addr1;
	private String addr2;
	private String email;
	private String sms_Yn;
	private String news_Yn;
	private String gender;
	private String reg_Date;
	private String useYn;
	private String adminYn;
	private String loveList;
	public User()
	{}
	/**
	public User(String id, String pass, String name, String reg_Date)
	{
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.reg_Date = reg_Date;
		System.out.println("User(id, pass, name, date)" + "����");
	}
	*/
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getReg_Date() {
		return reg_Date;
	}

	public void setReg_Date(String reg_Date) {
		this.reg_Date = reg_Date;
	}
	public String getJumin1() {
		return jumin1;
	}
	public void setJumin1(String jumin1) {
		this.jumin1 = jumin1;
	}
	public String getJumin2() {
		return jumin2;
	}
	public void setJumin2(String jumin2) {
		this.jumin2 = jumin2;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getAdminYn() {
		return adminYn;
	}
	public void setAdminYn(String adminYn) {
		this.adminYn = adminYn;
	}
	
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	
	public String getMobile1() {
		return mobile1;
	}
	public void setMobile1(String mobile1) {
		this.mobile1 = mobile1;
	}
	public String getMobile2() {
		return mobile2;
	}
	public void setMobile2(String mobile2) {
		this.mobile2 = mobile2;
	}
	public String getMobile3() {
		return mobile3;
	}
	public void setMobile3(String mobile3) {
		this. mobile3 = mobile3;
	}
	
	public String getZipcode1() {
		return zipcode1;
	}
	public void setZipcode1(String zipcode1) {
		this.zipcode1 = zipcode1;
	}
	public String getZipcode2() {
		return zipcode2;
	}
	public void setZipcode2(String zipcode2) {
		this.zipcode2 = zipcode2;
	}
	
	public String getSmsYn() {
		return sms_Yn;
	}
	public void setSmsYn(String smsYn) {
		this.sms_Yn = sms_Yn;
	}
	
	public String getNewsYn() {
		return news_Yn;
	}
	public void setNewsYn(String newsYn) {
		this.news_Yn = news_Yn;
	}

	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getLoveList() {
		return loveList;
	}
	public void setLoveList(String loveList) {
		this.loveList = loveList;
	}
	
	
	/**
	public String toString() {
		return "ID = " + id + ", PASS = " + pass + ", NAME = " + name;
	}
	*/

}
