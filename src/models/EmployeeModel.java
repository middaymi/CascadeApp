package models;

import dataBase.DataBaseConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.table.AbstractTableModel;
import data.Employee;

public class EmployeeModel extends AbstractTableModel{

    private static EmployeeModel employeeModelInstance = null;
    private final Connection DBC = DataBaseConnection.getInstanceDataBase().
                                   getDBconnection();
    private Employee employee = new Employee();
    private String tableTitles[] = {"Фамилия", "Имя", "Отчество", 
                                    "Дата рождения", "Опыт", "Образование"};
    
    private EmployeeModel() {}
    
    //get a link for other objects
    public static EmployeeModel getOrganizationModelInstance() {
        if (employeeModelInstance == null)
            employeeModelInstance = new EmployeeModel();
        return employeeModelInstance;
    }
    
    //select all data from db
    //String selectAllFromEmployee = "select * from employee";
    String selectAllFromEmployee = "select surname, name, middleName, birthday, "
                                 + "experience, education from employee;";
    private ResultSet getEmployeeData() {
        Statement stmt;
        ResultSet rs = null;
        try {
            stmt = DBC.createStatement();
            rs = stmt.executeQuery(selectAllFromEmployee); 
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeModel.class.getName()).
                             log(Level.SEVERE,"no executed "
                             + "query 'selectAllFromEmployee'", ex); 
        }
        return rs;
    }
    
    //get selectAllFromEmployee from ResultSet 
    public Employee setDataSource() {
        ResultSet rs = null; 
        try {
            //del prev data
            employee.getData().clear();
            employee.getColumnNames().clear();
            employee.getColumnTypes().clear();
            
            rs = getEmployeeData();
            ResultSetMetaData rsmd = rs.getMetaData();
            
            //get info about columns and their types
            //and set values to Employee.class arraylist
            int columnCount = rsmd.getColumnCount();
            for ( int i = 0; i < columnCount; i++) {
                //add columnName
                //employee.getColumnNames().add(rsmd.getColumnName(i+1));
                employee.getColumnNames().add(tableTitles[i]);
                //column type
                Class type = Class.forName(rsmd.getColumnClassName(i+1));
                employee.getColumnTypes().add(type);
            }

            //check results
            employee.printArray(employee.getColumnNames());
            System.out.println();
            employee.printArray(employee.getColumnTypes());
            
            //data is changed
            fireTableStructureChanged();
            
            //get row-data
            while (rs.next()) {
                //save a list of a row
                ArrayList row = new ArrayList();
                for (int i = 0; i < columnCount; i++) {
                    if (employee.getColumnTypes().get(i) == String.class)
                        row.add(rs.getString(i+1));
                    else
                        row.add(rs.getObject(i+1));
                }
                synchronized (employee.getData()) {
                    employee.getData().add(row);
                    //info about added row
                    fireTableRowsInserted(employee.getData().size()-1, employee.getData().size()-1);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeModel.class.getName()).
                             log(Level.SEVERE, 
                             "ResultSet problem", ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EmployeeModel.class.getName()).
                             log(Level.SEVERE, 
                             "not defina class type of data", ex);
        }
        return employee;
    }
           
    //get rows number
    public int getRowCount() {
        synchronized (employee.getData()) {
            return employee.getData().size();
        }
    }
    //get columns number
    public int getColumnCount() {
        return employee.getColumnNames().size();
    }
    //get cell column type
    public Class getColumnClass(int column) {
        return (Class)employee.getColumnTypes().get(column);
    }
    //get cell name
    public String getColumnName(int column) {
        return (String)employee.getColumnNames().get(column);
    }
    //get cell value
    public Object getValueAt(int row, int column) {
        synchronized (employee.getData()) {
            return ((ArrayList)employee.getData().get(row)).get(column);
        }
    }
    //change cell value
    public void setValueAt(Object value, int row, int column){
        synchronized (employee.getData()) {
            ((ArrayList)employee.getData().get(row)).set(column, value);
        }
    }
    
}
