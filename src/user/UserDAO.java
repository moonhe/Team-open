package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;          // DB�� �����ϴ� ��ü
	private PreparedStatement pstmt; // SQL�� �غ�� ���°� ��� ��ü
	private ResultSet rs;            // �������� ������ ��� ��ü
	
	public UserDAO() { // UserDAO �����ڿ� DB���� �Է�
		try {
			String dbURL = "jdbc:mysql://localhost:3306/jdbctest";
			String dbID = "root";
			String dbPassword = "sjrnfl12";
			Class.forName("com.mysql.jdbc.Driver"); // MySQL�� �����Ҽ� �ֵ��� �Ű�ü �����ϴ� ���̺귯��
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try { // SQL Injection ����ϱ� ���� �������̵� ?�� ������ �ְ� ������
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID); 
			rs = pstmt.executeQuery(); // rs�� ������ ������(���̵�) ����
			if (rs.next()) { // ���̵� �ִ� ���
				if (rs.getString(1).equals(userPassword)) { // ���� ����� ���� ��й�ȣ�� userPassword�� �����ϴٸ�
					return 1; // �α��� ����
				} else {
					return 0; // ��й�ȣ ����ġ
				}
			}
			return -1; // ���̵� ����
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //�����ͺ��̽� ����
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return -1; // �����ͺ��̽� ����
	}
	
}
































