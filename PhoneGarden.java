package JDBC;

import java.sql.*;
import java.util.LinkedList;
import java.util.List;

public class PhoneGarden {
	// JDBC driver name and database URL
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost/PhoneGarden";
	// Database credentials
	static final String USER = "root";
	static final String PASS = "password";

	// INSERT NEW RECORD
	public void insertUser(String username, String password, String email, String name, String DOB) {
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = conn.createStatement();
			String sql = "INSERT INTO Account " + "VALUES ( '" + username + "', '" + password + "', '" + email + "', '"
					+ name + "', '" + DOB + "', " +     false      + ")";
			stmt.executeUpdate(sql);
		} catch (Exception e) {
		} finally {
		}
	}

	// INSERT NEW RECORD
	public void insertPhone(String phoneName, String brandName, String picture, String description, int price,
			int quantity) {
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = conn.createStatement();
			String sql = "INSERT INTO Phone " + "VALUES ( '" + phoneName + "', '" + brandName + "', '" + picture
					+ "', '" + description + "'," + price + ", " + quantity + ")";
			stmt.executeUpdate(sql);
		} catch (Exception e) {
		} finally {
		}
	}

	// User Exist
	public boolean existUser(String username) {
		Connection conn = null;
		Statement stmt = null;
		boolean exist = false;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = conn.createStatement();
			String sql;
			sql = "SELECT * FROM Account " + "WHERE " + "Username = '" + username + "'";
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.absolute(1)) {
				exist = true;
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
		} finally {
		}
		return exist;
	}

	// Login
	public boolean login(String username, String password, String table) {
		Connection conn = null;
		Statement stmt = null;
		boolean exist = false;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = conn.createStatement();
			String sql;
			sql = "SELECT * FROM " + table + " WHERE " + "Username = '" + username + "' AND Pass = '" + password + "'";
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.absolute(1)) {
				exist = true;
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
		} finally {
		}
		return exist;
	}
	public List<String> get(String username) {
		Connection conn = null;
		Statement stmt = null;
		List<String> result = new LinkedList<>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = conn.createStatement();
			String sql;
			sql = "SELECT * FROM Account " + "WHERE " + "Username = '" + username + "'";
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String name = rs.getString("RealName");
				String DOB = rs.getString("DOB");
				result.add("User's name: " + name);
				result.add("/n");
				result.add("Date of Birth: " + DOB);
			} 
			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
		} finally {
		}
		return result;
	}
	public void edit(String username, String name, String email, String DOB) {
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = conn.createStatement();
			String sql;
			sql = "UPDATE Account " + "SET " + "RealName = '" + name + "', DOB = '" + DOB  + "', Email = '" + email + "' " +
					" WHERE Username = '" + username + "';";
			stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
		}catch (Exception e) {
		} finally {
		}
	}
	public void activate(String username) {
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = conn.createStatement();
			String sql;
			sql = "UPDATE Account " + "SET " + "Activated = " + true +
					" WHERE Username = '" + username + "';";
			stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
		}catch (Exception e) {
		} finally {
		}
	}
	
	public static byte[] encrypt(String x) throws Exception {
		java.security.MessageDigest d = null;
		d = java.security.MessageDigest.getInstance("SHA-1");
		d.reset();
		d.update(x.getBytes());
		return d.digest();
	}
}
