package dao;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.CustomerInsurrance;

public class CustomerInsurranceDAO extends DBContext {

    public List<CustomerInsurrance> findAll() {
        List<CustomerInsurrance> customerInsuranceList = new ArrayList<>();
        String sql = "SELECT * FROM CustomerInsurance WHERE isDelete = 0 OR isDelete IS NULL";

        try (Connection connection = new DBContext().connection; PreparedStatement statement = connection.prepareStatement(sql); ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                CustomerInsurrance customerInsurance = mapResultSetToCustomerInsurrance(resultSet);
                customerInsuranceList.add(customerInsurance);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerInsurranceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return customerInsuranceList;
    }

    public int add(CustomerInsurrance customerInsurance) {
        String sql = "INSERT INTO CustomerInsurance (UserID, InsuranceName, StartDate, EndDate, OwnerName, "
                + "LicensePlates, EngineNumber, ChassisNumber, VehicleRegistrationAddress, PassengerAccident, isDelete) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = new DBContext().connection; PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            setStatementParameters(statement, customerInsurance);
            statement.setBoolean(11, false); // Set isDelete to false for new records

            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        return generatedKeys.getInt(1);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerInsurranceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public CustomerInsurrance findById(int id) {
        String sql = "SELECT * FROM CustomerInsurance WHERE CIsuranceID = ? AND (isDelete = 0 OR isDelete IS NULL)";

        try (Connection connection = new DBContext().connection; PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return mapResultSetToCustomerInsurrance(resultSet);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerInsurranceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public boolean update(CustomerInsurrance customerInsurance) {
        String sql = "UPDATE CustomerInsurance SET UserID = ?, InsuranceName = ?, StartDate = ?, EndDate = ?, "
                + "OwnerName = ?, LicensePlates = ?, EngineNumber = ?, ChassisNumber = ?, "
                + "VehicleRegistrationAddress = ?, PassengerAccident = ?, isDelete = ? WHERE CIsuranceID = ?";

        try (Connection connection = new DBContext().connection; PreparedStatement statement = connection.prepareStatement(sql)) {

            setStatementParameters(statement, customerInsurance);
            statement.setBoolean(11, customerInsurance.getIsDelete());
            statement.setInt(12, customerInsurance.getCIsuranceID());

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

    private CustomerInsurrance mapResultSetToCustomerInsurrance(ResultSet resultSet) throws SQLException {
        CustomerInsurrance customerInsurance = new CustomerInsurrance();
        customerInsurance.setCIsuranceID(resultSet.getInt("CIsuranceID"));
        customerInsurance.setUserID(resultSet.getInt("UserID"));
        customerInsurance.setInsuranceName(resultSet.getString("InsuranceName"));
        customerInsurance.setStartDate(resultSet.getDate("StartDate") != null ? resultSet.getDate("StartDate").toLocalDate() : null);
        customerInsurance.setEndDate(resultSet.getDate("EndDate") != null ? resultSet.getDate("EndDate").toLocalDate() : null);
        customerInsurance.setOwnerName(resultSet.getString("OwnerName"));
        customerInsurance.setLicensePlates(resultSet.getString("LicensePlates"));
        customerInsurance.setEngineNumber(resultSet.getString("EngineNumber"));
        customerInsurance.setChassisNumber(resultSet.getString("ChassisNumber"));
        customerInsurance.setVehicleRegistrationAddress(resultSet.getString("VehicleRegistrationAddress"));
        customerInsurance.setPassengerAccident(resultSet.getString("PassengerAccident"));
        customerInsurance.setIsDelete(resultSet.getBoolean("isDelete"));
        return customerInsurance;
    }

    private void setStatementParameters(PreparedStatement statement, CustomerInsurrance customerInsurance) throws SQLException {
        statement.setInt(1, customerInsurance.getUserID());
        statement.setString(2, customerInsurance.getInsuranceName());
        statement.setDate(3, customerInsurance.getStartDate() != null ? java.sql.Date.valueOf(customerInsurance.getStartDate()) : null);
        statement.setDate(4, customerInsurance.getEndDate() != null ? java.sql.Date.valueOf(customerInsurance.getEndDate()) : null);
        statement.setString(5, customerInsurance.getOwnerName());
        statement.setString(6, customerInsurance.getLicensePlates());
        statement.setString(7, customerInsurance.getEngineNumber());
        statement.setString(8, customerInsurance.getChassisNumber());
        statement.setString(9, customerInsurance.getVehicleRegistrationAddress());
        statement.setString(10, customerInsurance.getPassengerAccident());
    }

    public static void main(String[] args) {
        new CustomerInsurranceDAO().findAll().stream().forEach(item -> System.out.println(item));
    }
}
