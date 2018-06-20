package dongsuh.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class CsBoardVO {
	String gubun, name, email1, email2, phone1, phone2, phone3, content, fname, rfname, bdate, no, rno, checked;
	String file_check, file_check2, reply, rdate;
	String []csBoard_checkbox;
	CommonsMultipartFile file;

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public String getReply() {
		
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply.replaceAll("\r\n", "<br>");
	}

	public String getFile_check2() {
		return file_check2;
	}

	public void setFile_check2(String file_check2) {
		this.file_check2 = file_check2;
	}

	public String getFile_check() {
		return file_check;
	}

	public void setFile_check(String file_check) {
		this.file_check = file_check;
	}

	public CommonsMultipartFile getFile() {
		return file;
	}

	public void setFile(CommonsMultipartFile file) {
		this.file = file;
	}

	public String[] getCsBoard_checkbox() {		
		return csBoard_checkbox;
	}

	public void setCsBoard_checkbox(String[] csBoard_checkbox) {
		System.out.println("0");
		this.csBoard_checkbox = csBoard_checkbox;
	}

	public String getNo() {
		return no;
	}

	public String getChecked() {
		return checked;
	}

	public void setChecked(String checked) {
		this.checked = checked;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getRno() {
		return rno;
	}

	public void setRno(String rno) {
		this.rno = rno;
	}

	public String getBdate() {
		return bdate;
	}

	public void setBdate(String bdate) {
		this.bdate = bdate;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getRfname() {
		return rfname;
	}

	public void setRfname(String rfname) {
		this.rfname = rfname;
	}

	public String getPhone(){
		return phone1 + "-" + phone2 + "-" + phone3;
	}
	
	public String getEmail(){
		return email1 + "@" + email2;
	}
		
	
	public String getGubun() {
		return gubun;
	}

	public void setGubun(String gubun) {
		this.gubun = gubun;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

	public String getContent() {
			
		return content.replaceAll("\r\n","<br>");
	}

	public void setContent(String content) {

			this.content = content;	
	}


	
	//file
}
