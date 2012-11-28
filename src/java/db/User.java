package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author Amilie
 */
public class User {
    private String username;
    private String password;

    public User() {
        
    }
  
    public static boolean exists(String username) throws SQLException {
        boolean isFound = false;
        
        Connection db = Database.open();
 
        PreparedStatement st = db.prepareStatement(
                "SELECT COUNT(1) FROM user WHERE username == ?");
        st.setString(1, username);
        ResultSet rs = st.executeQuery();
        
        int matches = Integer.parseInt(rs.getString(1));
        if(matches == 1) {
            isFound = true;
        }
        
        st.close();
        db.close();
        
        return isFound;
    }
    
    public static boolean valid(String username, String password) throws SQLException {
        boolean isValid = false;
        
        Connection db = Database.open();
 
        PreparedStatement st = db.prepareStatement(
                "SELECT COUNT(1) FROM user WHERE username == ? AND password"
                + " == ?");
        st.setString(1, username);
        st.setString(2, password);
        ResultSet rs = st.executeQuery();
        
        int matches = Integer.parseInt(rs.getString(1));
        if(matches == 1) {
            isValid = true;
        }
        
        st.close();
        db.close();
        
        return isValid;
    }
}
