package candoit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;

public class MemberCanDoIT {
	//�̱��� �������� ������ ���������ڸ� private�� ����
	private static MemberCanDoIT instance = new MemberCanDoIT();
	
	public static MemberCanDoIT getInstance(){
		return instance;
	}
	
	//private �ܺο����� ���� ���ϵ��� ����
	private MemberCanDoIT(){
	}
	
	//Ŀ�ؼ�Ǯ�κ��� Ŀ�ؼ��� �Ҵ� �޴� �޼ҵ�
	private Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/orcl");
		
		return ds.getConnection();
	}
	
	//ȸ������
	public void insertMember(Member member)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql="";
		int cnt = 0;
		
		try{
			//Ŀ�ؼ� Ǯ�κ�ó Ŀ�ؼ� �Ҵ�
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
	
	//ȸ�� ���̵�, ��й�ȣ üũ
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
					x=1;	//���� ����
				else
					x=0;	//��й�ȣ Ʋ��
			}else
				x=-1;	//�ش� ���̵� ����
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			execClose(rs,pstmt,conn);
		}
		return x;
	}
	
	//ȸ�� �� ����
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
	
	//ȸ������ ����
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
	
	//ID �ߺ� üũ
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
				x=1;	//�ش� ���̵� ����
			else
				x=-1;	//�ش� ���̵� ����
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			execClose(rs,pstmt,conn);
		}
		return x;
	}
	
	//�ڿ� ���� �޼ҵ� Connection�� ���ؼ� PreparedStatement�� �����ϰ�
	//PreparedStatement�� ���ؼ� ResultSet�� �����ϹǷ� �����Ҷ���
	// ResultSet => PreparedStatement => Connection�� ���� ���������� �������� close�Ѵ�
	public void execClose(ResultSet rs, PreparedStatement pstmt, Connection conn)throws Exception{
		//�ڿ� ����
		if(rs != null) try{rs.close();}catch(SQLExeption sqle){}
		if(pstmt !=null) try{pstmt.close();}catch(SQLException sqle){}
		//Ŀ�ؼ� Ǯ�� �ݳ�
		if(conn !=null) try{conn.close();}catch(SQLException sqle){}
	}
}
