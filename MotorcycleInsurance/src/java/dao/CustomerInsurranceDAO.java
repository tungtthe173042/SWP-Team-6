package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.CustomerInsurrance;

/**
 * Data Access Object (DAO) class for the CustomerInsurance entity. Provides
 * methods to interact with the CustomerInsurance database table.
 */
public class CustomerInsurranceDAO extends DBContext {

    /**
     * Retrieves all the CustomerInsurance records from the database.
     *
     * @return a list of CustomerInsurance objects representing the retrieved
     * records
     * @throws SQLException if there is an error executing the database query
     */
    public List<CustomerInsurrance> findAll() {
        List<CustomerInsurrance> customerInsuranceList = new ArrayList<>();
        String sql = "SELECT * FROM CustomerInsurance";

        try {
            Connection connection = new DBContext().connection;
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                CustomerInsurrance customerInsurance = new CustomerInsurrance();
                customerInsurance.setCIsuranceID(resultSet.getInt("CIsuranceID"));
                customerInsurance.setUserID(resultSet.getInt("UserID"));
                customerInsurance.setInsuranceName(resultSet.getString("InsuranceName"));
                customerInsurance.setStartDate(resultSet.getDate("StartDate"));
                customerInsurance.setEndDate(resultSet.getDate("EndDate"));
                customerInsurance.setOwnerName(resultSet.getString("OwnerName"));
                customerInsurance.setLicensePlates(resultSet.getString("LicensePlates"));
                customerInsurance.setEngineNumber(resultSet.getString("EngineNumber"));
                customerInsurance.setChassisNumber(resultSet.getString("ChassisNumber"));
                customerInsuranceList.add(customerInsurance);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerInsurranceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return customerInsuranceList;
    }

    /**
     * Adds a new CustomerInsurance record to the database.
     *
     * @param customerInsurance the CustomerInsurance object to be added
     * @return the ID of the newly added CustomerInsurance record, or -1 if the
     * addition failed
     */
    public int add(CustomerInsurrance customerInsurance) {
        String sql = "INSERT INTO CustomerInsurance (UserID, InsuranceName, StartDate, EndDate, OwnerName, LicensePlates, EngineNumber, ChassisNumber) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            Connection connection = new DBContext().connection;
            PreparedStatement statement = connection.prepareStatement(sql,
                    Statement.RETURN_GENERATED_KEYS);
            statement.setInt(1, customerInsurance.getUserID());
            statement.setString(2, customerInsurance.getInsuranceName());
            statement.setDate(3, new java.sql.Date(customerInsurance.getStartDate().getTime()));
            statement.setDate(4, new java.sql.Date(customerInsurance.getEndDate().getTime()));
            statement.setString(5, customerInsurance.getOwnerName());
            statement.setString(6, customerInsurance.getLicensePlates());
            statement.setString(7, customerInsurance.getEngineNumber());
            statement.setString(8, customerInsurance.getChassisNumber());
            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                ResultSet generatedKeys = statement.getGeneratedKeys();
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerInsurranceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    /**
     * Retrieves a CustomerInsurance record from the database based on the
     * provided ID.
     *
     * @param id the ID of the CustomerInsurance record to retrieve
     * @return the CustomerInsurance object representing the retrieved record,
     * or null if no record is found
     */
    public CustomerInsurrance findById(int id) {
        String sql = "SELECT * FROM CustomerInsurance WHERE CIsuranceID = ?";

        try {
            Connection connection = new DBContext().connection;
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                CustomerInsurrance customerInsurance = new CustomerInsurrance();
                customerInsurance.setCIsuranceID(resultSet.getInt("CIsuranceID"));
                customerInsurance.setUserID(resultSet.getInt("UserID"));
                customerInsurance.setInsuranceName(resultSet.getString("InsuranceName"));
                customerInsurance.setStartDate(resultSet.getDate("StartDate"));
                customerInsurance.setEndDate(resultSet.getDate("EndDate"));
                customerInsurance.setOwnerName(resultSet.getString("OwnerName"));
                customerInsurance.setLicensePlates(resultSet.getString("LicensePlates"));
                customerInsurance.setEngineNumber(resultSet.getString("EngineNumber"));
                customerInsurance.setChassisNumber(resultSet.getString("ChassisNumber"));
                return customerInsurance;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerInsurranceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

  
    /**
     * Updates an existing CustomerInsurance record in the database.
     *
     * @param customerInsurance the CustomerInsurance object with the updated
     * information
     * @return true if the update was successful, false otherwise
     */
    public boolean update(CustomerInsurrance customerInsurance) {
        String sql = "UPDATE CustomerInsurance SET UserID = ?, InsuranceName = ?, StartDate = ?, EndDate = ?, OwnerName = ?, LicensePlates = ?, EngineNumber = ?, ChassisNumber = ? WHERE CIsuranceID = ?";

        try {
            Connection connection = new DBContext().connection;
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, customerInsurance.getUserID());
            statement.setString(2, customerInsurance.getInsuranceName());
            statement.setDate(3, new java.sql.Date(customerInsurance.getStartDate().getTime()));
            statement.setDate(4, new java.sql.Date(customerInsurance.getEndDate().getTime()));
            statement.setString(5, customerInsurance.getOwnerName());
            statement.setString(6, customerInsurance.getLicensePlates());
            statement.setString(7, customerInsurance.getEngineNumber());
            statement.setString(8, customerInsurance.getChassisNumber());
            statement.setInt(9, customerInsurance.getCIsuranceID());
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            Logger.getLogger(CustomerInsurranceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }
    
    public boolean softDelete(int id) {
        String sql = "UPDATE CustomerInsurance SET isDelete = 1 WHERE CIsuranceID = ?";

        try (Connection connection = new DBContext().connection; PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            Logger.getLogger(CustomerInsurranceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }
}
