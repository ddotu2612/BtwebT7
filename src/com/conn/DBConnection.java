package com.conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBConnection {
	public static Connection getConnection(){
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_26", "root", "");
			System.out.println("Ket noi thanh cong");
		} catch (Exception e) {
			System.out.println("ket noi khong thanh cong");
			e.printStackTrace();
		}
		return connection;
	}
}