/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Insurance;

/**
 * Data Access Object (DAO) class for the Insurance entity. Provides methods to
 * interact with the Insurance database table.
 */
public class InsuranceDAO extends DBContext {

    /**
     * Retrieves all the Insurance records from the database.
     *
     * @return a list of Insurance objects representing the retrieved records
     * @throws SQLException if there is an error executing the database query
     */
    public List<Insurance> findAll() {
        List<Insurance> insuranceList = new ArrayList<>();
        String sql = "SELECT * FROM Insurance";

        try {
            Connection connection = new DBContext().connection;
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Insurance insurance = new Insurance();
                insurance.setInsuranceID(resultSet.getInt("InsuranceID"));
                insurance.setInsuranceName(resultSet.getString("InsuranceName"));
                insurance.setInsuranceDescription(resultSet.getString("InsuranceDescreption"));
                insurance.setInsurancePrice(resultSet.getInt("InsurancePrice"));
                insurance.setStatus(resultSet.getInt("Status"));
                insuranceList.add(insurance);
            }
        } catch (SQLException ex) {
            Logger.getLogger(InsuranceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return insuranceList;
    }

    /**
     * Updates an existing Insurance record in the database.
     *
     * @param insurance the Insurance object containing the updated information
     * @return true if the update was successful, false otherwise
     */
    public boolean update(Insurance insurance) {
        String sql = "UPDATE Insurance SET InsuranceName = ?,"
                + " InsuranceDescreption = ?, InsurancePrice = ?, Status = ? WHERE InsuranceID = ?";

        try {
            Connection connection = new DBContext().connection;
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, insurance.getInsuranceName());
            statement.setString(2, insurance.getInsuranceDescription());
            statement.setInt(3, insurance.getInsurancePrice());
            statement.setInt(4, insurance.getStatus());
            statement.setInt(5, insurance.getInsuranceID());
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            Logger.getLogger(InsuranceDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    /**
     * Deletes an Insurance record from the database based on the provided
     * InsuranceID.
     *
     * @param insuranceID the ID of the Insurance record to be deleted
     * @return true if the deletion was successful, false otherwise
     */
    public boolean delete(int insuranceID) {
        String sql = "DELETE FROM Insurance WHERE InsuranceID = ?";

        try {
            Connection connection = new DBContext().connection;
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, insuranceID);
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException ex) {
            Logger.getLogger(InsuranceDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    /**
     * Adds a new Insurance record to the database.
     *
     * @param insurance the Insurance object to be added
     * @return the ID of the newly added Insurance record, or -1 if the addition
     * failed
     */
    public int add(Insurance insurance) {
        String sql = "INSERT INTO Insurance (InsuranceName, InsuranceDescreption, InsurancePrice, Status) VALUES (?, ?, ?, ?)";

        try {
            Connection connection = new DBContext().connection;
            PreparedStatement statement = connection.prepareStatement(sql,
                    Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, insurance.getInsuranceName());
            statement.setString(2, insurance.getInsuranceDescription());
            statement.setInt(3, insurance.getInsurancePrice());
            statement.setInt(4, insurance.getStatus());
            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                ResultSet generatedKeys = statement.getGeneratedKeys();
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(InsuranceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public Insurance findById(int id) {
        String sql = "SELECT * FROM Insurance WHERE InsuranceID = ?";
        try {
            Connection connection = new DBContext().connection;
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                Insurance insurance = new Insurance();
                insurance.setInsuranceID(resultSet.getInt("InsuranceID"));
                insurance.setInsuranceName(resultSet.getString("InsuranceName"));
                insurance.setInsuranceDescription(resultSet.getString("InsuranceDescreption"));
                insurance.setInsurancePrice(resultSet.getInt("InsurancePrice"));
                insurance.setStatus(resultSet.getInt("Status"));
                return insurance;
            }
        } catch (SQLException ex) {
            Logger.getLogger(InsuranceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public boolean hide(int insuranceID) {
        String sql = "UPDATE Insurance SET Status = 0 WHERE InsuranceID = ?";

        try {
            Connection connection = new DBContext().connection;
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, insuranceID);
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            Logger.getLogger(InsuranceDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
}
