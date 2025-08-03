package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.Student;
import util.DBUtil;

public class StudentDAO {

    public boolean addStudent(Student student){
        String sql = "INSERT INTO students (name, email, phone, address) VALUES (?, ?, ?, ?)";

        try(Connection conn = DBUtil.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, student.getName());
            stmt.setString(2, student.getEmail());
            stmt.setString(3, student.getPhone());
            stmt.setString(4, student.getAddress());


            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;

        } catch(SQLException e) {
            System.out.println("Error inserting student: "+e.getMessage());
            return false;
        }
    }
}