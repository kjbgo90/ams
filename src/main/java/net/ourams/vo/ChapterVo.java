package net.ourams.vo;

public class ChapterVo {

	private int chapterNo;
	private String chapterContent;
	private int subjectNo;

	public ChapterVo() {
	}

	public ChapterVo(int chapterNo, String chapterContent, int subjectNo) {
		this.chapterNo = chapterNo;
		this.chapterContent = chapterContent;
		this.subjectNo = subjectNo;
	}

	public int getChapterNo() {
		return chapterNo;
	}

	public void setChapterNo(int chapterNo) {
		this.chapterNo = chapterNo;
	}

	public String getChapterContent() {
		return chapterContent;
	}

	public void setChapterContent(String chapterContent) {
		this.chapterContent = chapterContent;
	}

	public int getSubjectNo() {
		return subjectNo;
	}

	public void setSubjectNo(int subjectNo) {
		this.subjectNo = subjectNo;
	}

	@Override
	public String toString() {
		return "ChapterVo [chapterNo=" + chapterNo + ", chapterContent=" + chapterContent + ", subjectNo=" + subjectNo
				+ "]";
	}

}
