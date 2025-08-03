package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.Customer;
import util.DBUtil;

public class CustomerDAO {
    
    public boolean addCustomer(Customer customer) {
        String sql = "INSERT INTO customers (name, email, phone, address) VALUES (?, ?, ?, ?)";

        try(Connection conn = DBUtil.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {

                stmt.setString(1, customer.getName());
                stmt.setString(2, customer.getEmail());
                stmt.setString(3, customer.getPhone());
                stmt.setString(4, customer.getAddress());

                int rowsInserted = stmt.executeUpdate();
                return rowsInserted > 0;

        } catch (SQLException e) {
            System.out.println("Error inserting customer: "+ e.getMessage());
            return false;
        }
    }
}