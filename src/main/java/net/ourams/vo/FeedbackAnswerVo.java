package net.ourams.vo;

public class FeedbackAnswerVo {
	private int fbaNo;
	private int fbaType;
	private int fbqNo;
	private int userNo;
	private String userName;
	private String logoPath;

	public FeedbackAnswerVo() {
	}

	public FeedbackAnswerVo(int fbaNo, int fbaType, int fbqNo, int userNo, String userName, String logoPath) {
		this.fbaNo = fbaNo;
		this.fbaType = fbaType;
		this.fbqNo = fbqNo;
		this.userNo = userNo;
		this.userName = userName;
		this.logoPath = logoPath;
	}

	public int getFbaNo() {
		return fbaNo;
	}

	public void setFbaNo(int fbaNo) {
		this.fbaNo = fbaNo;
	}

	public int getFbaType() {
		return fbaType;
	}

	public void setFbaType(int fbaType) {
		this.fbaType = fbaType;
	}

	public int getFbqNo() {
		return fbqNo;
	}

	public void setFbqNo(int fbqNo) {
		this.fbqNo = fbqNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getLogoPath() {
		return logoPath;
	}

	public void setLogoPath(String logoPath) {
		this.logoPath = logoPath;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "FeedbackAnswerVo [fbaNo=" + fbaNo + ", fbaType=" + fbaType + ", fbqNo=" + fbqNo + ", userNo=" + userNo
				+ ", userName=" + userName + ", logoPath=" + logoPath + "]";
	}

}
