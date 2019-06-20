package net.ourams.vo;

import java.util.List;

public class CommunityVo {
	private int cpostNo;
	private int cpostType;
	private int userNo;
	private String regDate;
	private String cpostTitle;
	private String cpostContent;
	private int liked;
	private int rnum;
	public int pageNo;
	private List<fileUpLoadVo> fileList;
	
	public CommunityVo() {
		
	}

	public CommunityVo(int cpostNo, int cpostType, int userNo, String regDate, String cpostTitle, String cpostContent,
			int liked, int rnum, int pageNo, List<fileUpLoadVo> fileList) {
		super();
		this.cpostNo = cpostNo;
		this.cpostType = cpostType;
		this.userNo = userNo;
		this.regDate = regDate;
		this.cpostTitle = cpostTitle;
		this.cpostContent = cpostContent;
		this.liked = liked;
		this.rnum = rnum;
		this.pageNo = pageNo;
		this.fileList = fileList;
	}

	public int getCpostNo() {
		return cpostNo;
	}

	public void setCpostNo(int cpostNo) {
		this.cpostNo = cpostNo;
	}

	public int getCpostType() {
		return cpostType;
	}

	public void setCpostType(int cpostType) {
		this.cpostType = cpostType;
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

	public String getCpostTitle() {
		return cpostTitle;
	}

	public void setCpostTitle(String cpostTitle) {
		this.cpostTitle = cpostTitle;
	}

	public String getCpostContent() {
		return cpostContent;
	}

	public void setCpostContent(String cpostContent) {
		this.cpostContent = cpostContent;
	}

	public int getLiked() {
		return liked;
	}

	public void setLiked(int liked) {
		this.liked = liked;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public List<fileUpLoadVo> getFileList() {
		return fileList;
	}

	public void setFileList(List<fileUpLoadVo> fileList) {
		this.fileList = fileList;
	}

	@Override
	public String toString() {
		return "CommunityVo [cpostNo=" + cpostNo + ", cpostType=" + cpostType + ", userNo=" + userNo + ", regDate="
				+ regDate + ", cpostTitle=" + cpostTitle + ", cpostContent=" + cpostContent + ", liked=" + liked
				+ ", rnum=" + rnum + ", pageNo=" + pageNo + ", fileList=" + fileList + "]";
	}
	
	
	
	
	
	
	
	
}
