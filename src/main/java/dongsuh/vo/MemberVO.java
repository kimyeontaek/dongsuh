package dongsuh.vo;

public class MemberVO {

	int rno;
	String id, pass, name, calender, cb1, cb2, email1, email2, jdate;
	String phone, phone1, phone2, ad1, ad2, ad3, ad4, ad5, agree;
	String sumAd, sumPhone, sumEmail, bd;

	public void setCalender(String calender) {
		this.calender = calender;
	}

	public void setSumAd(String sumAd) {
		this.sumAd = sumAd;
	}

	public void setSumPhone(String sumPhone) {
		this.sumPhone = sumPhone;
	}

	public void setSumEmail(String sumEmail) {
		this.sumEmail = sumEmail;
	}

	public String getBd() {
		return bd;
	}

	public void setBd(String bd) {
		this.bd = bd;
	}

	public String getJdate() {
		return jdate;
	}

	public void setJdate(String jdate) {
		this.jdate = jdate;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getCb1() {
		return cb1;
	}

	public void setCb1(String cb1) {
		this.cb1 = cb1;
	}

	public String getCb2() {
		return cb2;
	}

	public void setCb2(String cb2) {
		this.cb2 = cb2;
	}

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

	public String getCalender() {
		return calender;
	}

	public void setcalender(String calender) {
		this.calender = calender;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public String getSumEmail() {
		return this.sumEmail;
	}

	public String getTotalEmail() {
		return email1 + "@" + email2;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getTotalPhone() {
		return phone + "-" + phone1 + "-" + phone2;
	}

	public String getSumPhone() {
		return this.sumPhone;
	}

	public String getAd1() {
		return ad1;
	}

	public void setAd1(String ad1) {
		this.ad1 = ad1;
	}

	public String getAd2() {
		return ad2;
	}

	public void setAd2(String ad2) {
		this.ad2 = ad2;
	}

	public String getAd3() {
		return ad3;
	}

	public void setAd3(String ad3) {
		this.ad3 = ad3;
	}

	public String getAd4() {
		return ad4;
	}

	public void setAd4(String ad4) {
		this.ad4 = ad4;
	}

	public String getAd5() {
		return ad5;
	}

	public void setAd5(String ad5) {
		this.ad5 = ad5;
	}

	public String getSumAd() {
		return this.sumAd;
	}

	public String getTotalAd() {
		return "지번 : " + ad1 + " " + ad2 + "-" + ad3 + " 도로명 : " + ad4 + " "
				+ ad5;
	}

	public String getAgree() {
		return agree;
	}

	public void setAgree(String agree) {
		this.agree = agree;
	}

}