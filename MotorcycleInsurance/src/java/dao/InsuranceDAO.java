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


public class InsuranceDAO extends DBContext {

    
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

   
}
