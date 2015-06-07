package candoit;

import java.sql.*;

import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;

import com.domain.Member;

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
	private Connection getConnection() throws Exception, SQLException{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/XE");
		
		return ds.getConnection();
	}
	
	//ȸ������
	public void insertMember(Member member)throws Exception, SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql="";
		int cnt = 0;
		
		try{
			//Ŀ�ؼ� Ǯ�κ�ó Ŀ�ؼ� �Ҵ�
			conn = getConnection();
			System.out.println(" ��� ");
			sql = "insert into MEMBER values(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(++cnt, member.getMember_id());
			pstmt.setString(++cnt, member.getMember_passwd());
			pstmt.setString(++cnt, member.getMember_name());
			pstmt.setString(++cnt, member.getMember_email());
			pstmt.executeUpdate();
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
			sql = "select member_passwd from MEMBER where member_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			rs = pstmt. executeQuery();
			
			if(rs.next()){
				dbpasswd = rs.getString("member_passwd");
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
				member.setMember_id(rs.getString("member_id"));
				member.setMember_passwd(rs.getString("member_passwd"));
				member.setMember_name(rs.getString("member_name"));
				member.setMember_email(rs.getString("member_email"));
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
			pstmt.setString(++cnt, member.getMember_passwd());
			pstmt.setString(++cnt, member.getMember_name());
			pstmt.setString(++cnt, member.getMember_email());
			pstmt.setString(++cnt, member.getMember_id());
			
			pstmt.executeUpdate();
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			execClose(null,pstmt,conn);
		}
	}
	
	//ȸ��Ż��, ȸ����������
	public void deleteMember(String member_id)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn = getConnection();
			sql = "delete from MEMBER where member_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			pstmt.executeUpdate();

		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
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
		if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt !=null) try{pstmt.close();}catch(SQLException sqle){}
		//Ŀ�ؼ� Ǯ�� �ݳ�
		if(conn !=null) try{conn.close();}catch(SQLException sqle){}
	}
}
