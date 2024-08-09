



package dal;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {
    
    protected Connection connection;
    
    public DBContext() {        
        try {
            String user = "sa";
            String pass = "123";
            String url = "jdbc:sqlserver://localhost\\SQLEXPRESS:1433;databaseName=Insurance";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public int findUser(String user) throws SQLException {
        String sql = "select * from Users where Users.username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return 0;
            }
        } catch (SQLException e) {

        }
        return 1;
    }
    public int findEmail(String mail) throws SQLException {
        String sql = "select * from Users where Users.gmail = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, mail);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return 0;
            }
        } catch (SQLException e) {

        }
        return 1;
    }
    public void Signup(String name, String pass, String phone, String email, String address, String full_name) throws SQLException {
        String sql = "insert into Users( username, password, phone_number, gmail, Role, status, address, full_name) "
                + "values(?,?,?,?,2,1,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, pass);
            st.setString(3, phone);
            st.setString(4, email);
            st.setString(5, address);
            st.setString(6, full_name);
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }
    public static void main(String[] args) {
        DBContext db = new DBContext();
    }
}
