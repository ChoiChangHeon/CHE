package kr.co.wonderland.mvc.dto;

public class StudyCommDTO {

	private int scnum;
	private int stcode;
	private String scpurpose;
	private String scwriter;
	private String scstatus;
	private String scdate;
	private int rownum;

	public int getScnum() {
		return scnum;
	}

	public void setScnum(int scnum) {
		this.scnum = scnum;
	}

	public int getStcode() {
		return stcode;
	}

	public void setStcode(int stcode) {
		this.stcode = stcode;
	}

	public String getScpurpose() {
		return scpurpose;
	}

	public void setScpurpose(String scpurpose) {
		this.scpurpose = scpurpose;
	}

	public String getScwriter() {
		return scwriter;
	}

	public void setScwriter(String scwriter) {
		this.scwriter = scwriter;
	}

	public String getScstatus() {
		return scstatus;
	}

	public void setScstatus(String scstatus) {
		this.scstatus = scstatus;
	}

	public String getScdate() {
		return scdate;
	}

	public void setScdate(String scdate) {
		this.scdate = scdate;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
}
