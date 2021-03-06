package dataBase;

import com.microsoft.sqlserver.jdbc.SQLServerDriver;
import lombok.extern.slf4j.Slf4j;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

@Slf4j
public class DataBaseConnection {

    private static DataBaseConnection DataBaseInstance = null;
    private String dbURL = "jdbc:sqlserver://localhost:1401;databaseName=DB;integratedSecurity=false;user=SA;password=Sqldata123";
    private Connection DBconnection;

    private DataBaseConnection() {
        //register sql driver
        try {
            DriverManager.registerDriver(new SQLServerDriver());
        } catch (SQLException ex) {
            log.debug("no register driver", ex);
        }
        //connect to database
        try {
            DBconnection = DriverManager.getConnection(dbURL);
            //if (DBconnection != null) System.out.println("connected");
        } catch (SQLException ex) {
            log.debug("no connection to database", ex);
        }
    }

    public static DataBaseConnection getInstanceDataBase() {
        if (DataBaseInstance == null)
            DataBaseInstance = new DataBaseConnection();
        return DataBaseInstance;
    }

    public Connection getDBconnection() {
        return DBconnection;
    }
}
