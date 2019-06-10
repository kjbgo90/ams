package net.ourams.vo;

public class NoticeVo {
	private String regDate;
	private String postTitle;
	private String postContent;
	private String category;

	public NoticeVo() {
	}

	public NoticeVo(String regDate, String postTitle, String postContent, String category) {
		this.regDate = regDate;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.category = category;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

}
