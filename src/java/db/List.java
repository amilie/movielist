package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author Amilie
 */
public class List {
    private String username;
    private String movie[];
    private String note[];

    public List(String username) throws SQLException {
        Connection db = Database.open();
        
        //find out many movies are in this user's list
        PreparedStatement st = db.prepareStatement(
                "SELECT COUNT(1) FROM list WHERE username = ?");
        st.setString(1, username);
        ResultSet rs = st.executeQuery();
        int numMovies = Integer.parseInt(rs.getString(1));
        this.username = username;
        this.movie = new String[numMovies];
        this.note = new String[numMovies];
        
        rs.close();
        st.close();
        db.close();
        
        //retrieve the list of movies
        st = db.prepareStatement(
                "SELECT * FROM list WHERE username = ?");
        st.setString(1, username);
        rs = st.executeQuery();
        
        // save the query results
        for(int i = 0; i < numMovies; i++) {
            this.movie[i] = rs.getString(2);
            this.note[i] = rs.getString(3);
        }
        rs.close();
        st.close();
        db.close();
    }
    
    public String getString() {
        String outString = "";
        for(int i = 0; i < movie.length; i++) {
            outString += "<li>"
                + movie[i].replace("<", "").replace(">", ""); //make html-safe
            if(note[i].length() > 0) {
                outString += "\n<br /><span style='smalltext'>"
                    + note[i].replace("<", "").replace(">", "")
                    + "</span>\n";
            }
            outString += "</li>\n";
        }
        return outString;
    }
    
    public void addMovie(String movieName) throws SQLException {
        this.addMovie(movieName, "");
    }
    
    public void addMovie(String movieName, String note) throws SQLException {
        Connection db = Database.open();
 
        PreparedStatement st = db.prepareStatement(
                "INSERT INTO list(username, movie, note) VALUES(?, ?, ?)");
        st.setString(1, this.username);
        st.setString(2, movieName);
        st.setString(3, note);
        st.executeUpdate();
        
        st.close();
        db.close();
    }
    
    public void removeMovie(String movieName) throws SQLException {
        Connection db = Database.open();
 
        PreparedStatement st = db.prepareStatement(
                "DELETE FROM list WHERE username = ? and movie = ?");
        st.setString(1, this.username);
        st.setString(2, movieName);
        st.executeUpdate();
        
        st.close();
        db.close();
    }
}
