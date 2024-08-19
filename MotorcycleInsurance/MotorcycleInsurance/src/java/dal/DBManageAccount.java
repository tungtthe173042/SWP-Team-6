/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;

/**
 *
 * @author nitro5
 */
public class DBManageAccount extends DBContext{
     public void deleteAnAccountById(int idAcc) {
        String sql = "DELETE FROM [dbo].[Users]"
                + "      WHERE user_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, idAcc);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
public User getUserById(int idAcc) {
        String sql = "SELECT * FROM [dbo].[Users]"
                + "      WHERE user_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, idAcc);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6),
                        rs.getInt(7), rs.getString(8), rs.getInt(9));
            }
        } catch (SQLException e) {
        }
        return null;
    }
    public void updateAccount(User user) {
        String sql = "UPDATE [dbo].[Users]"
                + "   SET [username] = ?"
                + "      ,[password] = ?"
                + "      ,[full_name] = ?"
                + "      ,[phone_number] = ?"
                + "      ,[address] = ?"
                + "      ,[Role] = ?"
                + "      ,[gmail] = ?"
                + "      ,[status] = ?"
                + " WHERE [user_id] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user.getU_name());
            ps.setString(2, user.getPass());
            ps.setString(3, user.getF_name());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getAddr());
            ps.setInt(6, user.getRole());
            ps.setString(7, user.getMail());
            ps.setInt(8, user.getStatus());
            ps.setInt(9, user.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public List<User> getAllUser() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM USERS";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6),
                        rs.getInt(7), rs.getString(8), rs.getInt(9)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }
}
