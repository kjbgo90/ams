package net.ourams.vo;

import java.sql.Date;

public class ReplyVo {
	private int reply;
	private int postNo;
	private int userNo;
	private Date regDate;
	private String replyContent;
	
	
	
	public ReplyVo() {
	}



	public ReplyVo(int reply, int postNo, int userNo, Date regDate, String replyContent) {
		super();
		this.reply = reply;
		this.postNo = postNo;
		this.userNo = userNo;
		this.regDate = regDate;
		this.replyContent = replyContent;
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



	public Date getRegDate() {
		return regDate;
	}



	public void setRegDate(Date regDate) {
		this.regDate = regDate;
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
				+ ", replyContent=" + replyContent + "]";
	}
		
	
	
}


