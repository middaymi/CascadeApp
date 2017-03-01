package dataBase;

import com.microsoft.sqlserver.jdbc.SQLServerDriver;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DataBaseConnection {
    
    private static DataBaseConnection DataBaseInstance = null;
    private Connection conn;
    
    private DataBaseConnection() { 
        try {
            DriverManager.registerDriver(new SQLServerDriver());
        } catch (SQLException ex) {
            Logger.getLogger(DataBaseConnection.class.getName()).
                             log(Level.SEVERE, null, ex);
        }
        String dbURl = "jdbc:sqlserver://localhost;instanceName=MSSQLSERVER;databaseName=TestDB;integratedSecurity=true;";
        try {
            conn = DriverManager.getConnection(dbURl);
            if (conn != null) {
                System.out.println("connected");
                //String str = "select * from sportsman";
                //Statement stmt = conn.createStatement();
                //ResultSet rs = stmt.executeQuery(str);
                
                //while (rs.next()){
                  //  System.out.println(rs.getString(2));
                //}
            }
        } catch (SQLException ex) {
            Logger.getLogger(DataBaseConnection.class.getName()).log(Level.SEVERE, null, ex);   
        }
        
    }    
    public static DataBaseConnection getInstanceDataBase() {
        if (DataBaseInstance == null)
            DataBaseInstance = new DataBaseConnection();
        return DataBaseInstance;           
    }
}
