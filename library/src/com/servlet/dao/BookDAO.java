package com.servlet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.model.DBConnection;
import com.servlet.dto.BookDTO;

public class BookDAO {

	private static BookDAO instance;
	private BookDAO() {}
	
	public static BookDAO getInstance() {
		if(instance == null) instance = new BookDAO();
		return instance;
	}
	
	public ArrayList<BookDTO> select() {
		ArrayList<BookDTO> list = new ArrayList<BookDTO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet res = null;
		
		try {
			con = DBConnection.getConnection();
			String sql = "SELECT * FROM book";
			pstmt = con.prepareStatement(sql);
			res = pstmt.executeQuery();
			
			while(res.next()) {
				int bookId = res.getInt("book_id");
				String bookName = res.getString("book_name");
				int bookCost = res.getInt("book_cost");
				
				BookDTO bookDTO = new BookDTO(bookId, bookName, bookCost);
				list.add(bookDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(res != null) res.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return list;
	}
	
	public void insert(int bookId, String bookName, int bookCost) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DBConnection.getConnection();
			String sql = "INSERT INTO book VALUES (?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bookId);
			pstmt.setString(2, bookName);
			pstmt.setInt(3, bookCost);
			
			if(pstmt.executeUpdate() != 0) {
				System.out.println("등록 성공.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	public void delete(int bookId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DBConnection.getConnection();
			String sql = "DELETE FROM book WHERE book_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bookId);
			
			if(pstmt.executeUpdate() != 0) {
				System.out.println("제거 성공.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}
