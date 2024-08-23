package dao;

import model.Accident;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AccidentDAO extends DBContext {

    public List<Accident> findAll() {
        List<Accident> accidentList = new ArrayList<>();
        String sql = "SELECT * FROM Accident";

        try (Connection conn = new DBContext().connection; PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Accident accident = new Accident();
                accident.setAccidentID(rs.getInt("AccidentID"));
                accident.setImage(rs.getString("Image"));
                accident.setAccidentDescription(rs.getString("AccidentDescription"));
                accident.setAccidentDate(rs.getDate("AccidentDate"));
                accident.setAccidentName(rs.getString("AccidentName"));
                accident.setCIsuranceID(rs.getInt("CIsuranceID"));
                accident.setStatus(rs.getBoolean("status"));

                accidentList.add(accident);
            }
        } catch (SQLException e) {
            System.out.println("Query Accident error: " + e.getMessage());
        }

        return accidentList;
    }

    public boolean updateStatus(int id, boolean status) {
        String sql = "UPDATE Accident SET status = ? WHERE AccidentID = ?";
        try (Connection conn = new DBContext().connection; PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setBoolean(1, status);
            ps.setInt(2, id);
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            System.out.println("Update Accident status error: " + e.getMessage());
            return false;
        }
    }
}
