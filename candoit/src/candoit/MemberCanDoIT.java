package candoit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;

public class MemberCanDoIT {
	//싱글턴 패턴으로 생성자 접근지정자를 private로 지정
	private static MemberCanDoIT instance = new MemberCanDoIT();
	
	public static MemberCanDoIT getInstance(){
		return instance;
	}
	
	//private 외부에서는 생성 못하도록 막음
	private MemberCanDoIT(){
	}
	
	//커넥션풀로부터 커넥션을 할당 받는 메소드
	private Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/orcl");
		
		return ds.getConnection();
	}
	
	//회원가입
	public void insertMember(Member member)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql="";
		int cnt = 0;
		
		try{
			//커넥션 풀로붙처 커넥션 할당
			conn = getConnection();
			sql = "insert into MEMBER values(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(++cnt, member.getId());
			pstmt.setString(++cnt, member.getPasswd());
			pstmt.setString(++cnt, member.getName());
			pstmt.setString(++cnt, member.getEmail());
			pstmt.executeLargeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			execClose(null,pstmt,conn);
		}
	}
	
	//회원 아이디, 비밀번호 체크
	public int userCheck(String member_id, String member_passwd)throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		String dbpasswd = "";
		int x = -1;
		
		try{
			conn = getConnection();
			sql = "select passwd from MEMBER where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			rs = pstmt. executeQuery();
			
			if(rs.next()){
				dbpasswd = rs.getString("passwd");
				if(dbpasswd.equals(member_passwd))
					x=1;	//인증 성공
				else
					x=0;	//비밀번호 틀림
			}else
				x=-1;	//해당 아이디 없음
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			execClose(rs,pstmt,conn);
		}
		return x;
	}
	
	//회원 상세 정보
	public Member getMember(String member_id)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member member = null;
		String sql = "";
		try{
			conn = getConnection();
			sql = "select * from MEMBER where member_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				member = new Member();
				member.setId(rs.getString("member_id"));
				member.setPasswd(rs.getString("member_passwd"));
				member.setName(rs.getString("member_name"));
				member.setEmail(rs.getString("member_email"));
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			execClose(rs,pstmt,conn);
		}
		return member;
	}
	
	//회원정보 수정
	public void updateMember(Member member)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int cnt = 0;
		try{
			conn = getConnection();
			sql = "update MEMBER set member_passwd=?, member_name=?, member_email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(++cnt, member.getPasswd());
			pstmt.setString(++cnt, member.getName());
			pstmt.setString(++cnt, member.getEmail());
			pstmt.setString(++cnt, member.getId());
			
			pstmt.excuteUpdate();
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			execClose(null,pstmt,conn);
		}
	}
	
	//ID 중복 체크
	public int confirmId(String member_id)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int x = -1;
		try{
			conn = getConnection();
			sql = "select * from MEMBER where member_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();
			
			if(rs.next())
				x=1;	//해당 아이디 존재
			else
				x=-1;	//해당 아이디 없음
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			execClose(rs,pstmt,conn);
		}
		return x;
	}
	
	//자원 정리 메소드 Connection을 통해서 PreparedStatement를 생성하고
	//PreparedStatement를 통해서 ResultSet를 생성하므로 종료할때는
	// ResultSet => PreparedStatement => Connection와 같이 생성순서의 역순으로 close한다
	public void execClose(ResultSet rs, PreparedStatement pstmt, Connection conn)throws Exception{
		//자원 정리
		if(rs != null) try{rs.close();}catch(SQLExeption sqle){}
		if(pstmt !=null) try{pstmt.close();}catch(SQLException sqle){}
		//커넥션 풀로 반납
		if(conn !=null) try{conn.close();}catch(SQLException sqle){}
	}
}
