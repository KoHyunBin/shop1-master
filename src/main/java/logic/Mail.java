package logic;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Mail {
	private String naverid;
	private String naverpw;
	private String recipient;
	private String title;
	private String mtype;
	private List<MultipartFile> file1; //메일 전송시 첨부파일 2개가능
	private String contents;
	//setter, getter, toString
	public String getNaverid() {
		return naverid;
	}
	public void setNaverid(String naverid) {
		this.naverid = naverid;
	}
	public String getNaverpw() {
		return naverpw;
	}
	public void setNaverpw(String naverpw) {
		this.naverpw = naverpw;
	}
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMtype() {
		return mtype;
	}
	public void setMtype(String mtype) {
		this.mtype = mtype;
	}
	public List<MultipartFile> getFile1() {
		return file1;
	}
	public void setFile1(List<MultipartFile> file1) {
		this.file1 = file1;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	@Override
	public String toString() {
		return "Mail [naverid=" + naverid + ", naverpw=" + naverpw + ", recipient=" + recipient + ", title=" + title
				+ ", mtype=" + mtype + ", file1=" + file1 + ", contents=" + contents + "]";
	}
}
