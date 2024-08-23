
package dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class DBCompesation extends DBContext {

    public void AddAccident(String name, String des, String image, int cid) {
        String sql = "insert into Accident("
                + "[Image]"
                + ",AccidentDescription"
                + ",AccidentDate"
                + ",AccidentName"
                + ",CIsuranceID"
                + ",[Status]) "
                + "values (?,?,?,?,?,0)";
        // Lấy ngày hiện tại
        LocalDate currentDate = LocalDate.now();
        
        // Định dạng ngày thành chuỗi theo mẫu "yyyy-MM-dd"
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDate = currentDate.format(formatter);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, image);
            st.setString(2, des);
            st.setString(3, formattedDate);
            st.setString(4, name);
            st.setInt(5, cid);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    
}