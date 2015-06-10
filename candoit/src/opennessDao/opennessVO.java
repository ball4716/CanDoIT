package opennessDao;

import com.domain.Member;
import servlet1.opennessInsertServlet;
public class opennessVO {

	String no;
	String title;
	String contents;
	String writer;
	String nowDate;
	
	opennessVO(String no,String title, String contents,String writer, String nowDate){
		this.no = no;
		this.title = title;
		this.contents = contents;
		this.writer = writer;
		this.nowDate = nowDate;
	}
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getNowDate() {
		return nowDate;
	}
	public void setNowDate(String nowDate) {
		this.nowDate = nowDate;
	}
	
}
