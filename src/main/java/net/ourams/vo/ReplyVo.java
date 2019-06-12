package net.ourams.vo;


public class ReplyVo {
	private int reply;
	private int postNo;
	private int userNo;
	private String regDate;
	private String replyContent;
	private String userName;
	private String logoPath;
	
	
	public ReplyVo() {
	}




	public ReplyVo(int reply, int postNo, int userNo, String regDate, String replyContent, String userName,
			String logoPath) {
		super();
		this.reply = reply;
		this.postNo = postNo;
		this.userNo = userNo;
		this.regDate = regDate;
		this.replyContent = replyContent;
		this.userName = userName;
		this.logoPath = logoPath;
	}




	public int getReply() {
		return reply;
	}



	public void setReply(int reply) {
		this.reply = reply;
	}



	public int getPostNo() {
		return postNo;
	}



	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}



	public int getUserNo() {
		return userNo;
	}



	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}



	public String getRegDate() {
		return regDate;
	}



	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	
	


	public String getUserName() {
		return userName;
	}




	public void setUserName(String userName) {
		this.userName = userName;
	}




	public String getLogoPath() {
		return logoPath;
	}




	public void setLogoPath(String logoPath) {
		this.logoPath = logoPath;
	}




	public String getReplyContent() {
		return replyContent;
	}



	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}




	@Override
	public String toString() {
		return "ReplyVo [reply=" + reply + ", postNo=" + postNo + ", userNo=" + userNo + ", regDate=" + regDate
				+ ", replyContent=" + replyContent + ", userName=" + userName + ", logoPath=" + logoPath + "]";
	}



	
}


