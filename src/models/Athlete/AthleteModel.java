package models.Athlete;

import data.Athlete;
import dataBase.DataBaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.AbstractTableModel;
import models.Employee.EmployeeModel;
import views.Manager;

public class AthleteModel extends AbstractTableModel {

    private static AthleteModel athleteModelInstance = null;
    private final Connection DBC = DataBaseConnection.getInstanceDataBase().
                                   getDBconnection();
    private Athlete athlete = new Athlete();
    //service array for original columnNames
    private ArrayList <String> originalTableTitles = new ArrayList();
    //order like in sqlTable; then name, surname are swaped
    private String tableTitles[] = {"ID", "Фамилия", "Имя", "Отчество", 
                                    "ДР", "Разряд", 
                                    "Представители", "Телефон",
                                    "Адрес", 
                                    "Документ", 
                                    "Сертификат",
                                    "Страховка", "Пол"};
    //for save changed tableFields
    private HashSet <ArrayList> willUpdateFields = new HashSet<>();
    
    private AthleteModel() {
        athlete.setCellEditable(true);      
    }
    
    //get a link for other objects
    public static AthleteModel getAthleteModelInstance() {
        if (athleteModelInstance == null)
            athleteModelInstance = new AthleteModel();
        return athleteModelInstance;
    }
    
    //select all data from db
    String selectAllFromAthlete = "select * from athlete";
    private ResultSet getDataFromDB() {
        Statement stmt;
        ResultSet rs = null;
        try {
            stmt = DBC.createStatement();
            rs = stmt.executeQuery(selectAllFromAthlete); 
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeModel.class.getName()).
                             log(Level.SEVERE,"no executed "
                             + "query 'selectAllFromAthlete'", ex); 
        }
        return rs;
    }
    
    //get selectAllFromAthlete data from ResultSet, 
    //push it to the athleteDataClass(there:athletes)
     public void setDataSource() {
        ResultSet rs = null; 
        Class type = null;
        try {
            //del prev data
            athlete.getData().clear();
            athlete.getColumnNames().clear();
            athlete.getColumnTypes().clear();
            
            rs = getDataFromDB();
            ResultSetMetaData rsmd = rs.getMetaData();
            
            //get info about columns and their types,
            //set values to Employee.class arraylist
            int columnCount = rsmd.getColumnCount();
            for (int i = 0; i < columnCount; i++) {
                //add original columnNames to serviceArray
                originalTableTitles.add(rsmd.getColumnName(i+1));
                //add columnName                
                athlete.setColumnNames(tableTitles[i]);
                //add columnType
                type = Class.forName(rsmd.getColumnClassName(i+1));
                athlete.setColumnTypes(type);                 
            }     
                         
            //?something for table
            fireTableStructureChanged();
            
            //get row-data
            while (rs.next()) {
                //save a list of a row
                ArrayList row = new ArrayList();
                for (int i = 0; i < columnCount; i++) {
                    if (athlete.getColumnTypes().get(i) == String.class) {
                        row.add(rs.getString(i+1));
                    } else {
                        row.add(rs.getObject(i+1));
                    }
                }
                synchronized (athlete.getData()) {                    
                    athlete.setData(row);
                    //info about added row
                    fireTableRowsInserted(athlete.getData().size()-1, 
                                          athlete.getData().size()-1);
                }
            }            
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeModel.class.getName()).
                             log(Level.SEVERE, 
                             "ResultSet problem", ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EmployeeModel.class.getName()).
                             log(Level.SEVERE, 
                             "not define class type of data", ex);
        }        
    }
               
    //get rows number
    public int getRowCount() {
        synchronized (athlete.getData()) {
            return athlete.getData().size();
        }
    }
    //get columns number
    public int getColumnCount() {
        return athlete.getColumnNames().size();
    }
    //get cell column type
    public Class getColumnClass(int column) {
        return (Class)athlete.getColumnTypes().get(column);
    }
    //get cell name
    public String getColumnName(int column) {
        return (String)athlete.getColumnNames().get(column);
    }
    //get cell value
    public Object getValueAt(int row, int column) {
        synchronized (athlete.getData()) {
            return ((ArrayList)athlete.getData().get(row)).get(column);
        }
    }
    
    //update fields in DB
    public void updateData() {
        Iterator<ArrayList> it = willUpdateFields.iterator();
        while(it.hasNext()){
            try {
                ArrayList now = it.next();
                int row = (int)now.get(0);
                int column = (int)now.get(1);
                Object value = now.get(2);
                
                //create updateQuery 
                String query = "UPDATE " + "ATHLETE " +
                        "SET " + originalTableTitles.get(column) + " = " +
                        "'" + value + "'" + " WHERE ID = " + getValueAt(row, 0);
                                
                System.out.println(query);
                //update
                PreparedStatement pstmt = DBC.prepareStatement(query);
                pstmt.executeUpdate();  
                
            } catch (SQLException ex) {
                Logger.getLogger(EmployeeModel.class.getName()).
                             log(Level.SEVERE, "Something wrong with SQLquery,"
                                             + "no update", ex);
            }            
        }
    }  
    
    //change cell value
    public void setValueAt(Object value, int row, int column){
        //save changes
        ArrayList willUpdate = new ArrayList();
        willUpdate.add(row);
        willUpdate.add(column);
        willUpdate.add(value);
        willUpdateFields.add(willUpdate); 
        //setValue
        synchronized (athlete.getData()) {
            ((ArrayList)athlete.getData().get(row)).set(column, value);
        }
        //was changed
        System.out.println("ROW " + row);
        System.out.println("COLUMN " + column);   
   }  
 
    //can edit or not
    public boolean isCellEditable(int row, int column) {
		return athlete.getCellEditable();
    }
    
    //get a link of Employee class with set data
    public Athlete getAthleteDataLink() {
        return athlete;	 
    }
    
   public void delSelectedRow() {
       System.out.println("lolo");
        int sel = 0;
        try {             
            JTable athTable = Manager.getAthPage().getTable();
            //get selected row
            sel = athTable.getSelectedRow(); 
            System.out.println("sel " + sel);
                        
            //del a row from DB
            String query = "DELETE " + "FROM ATHLETE " +
                           "WHERE ID = " + getValueAt(sel, 0);
            System.out.println(query);
            PreparedStatement pstmt = DBC.prepareStatement(query); 
            pstmt.executeUpdate();
            this.removeRow(sel);
           
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeModel.class.getName()).log(Level.SEVERE, 
                            "Something wrong with deleting a row", ex);
        } catch (ArrayIndexOutOfBoundsException ex) {
            if (sel == -1) {    
                JOptionPane.showMessageDialog(Manager.getAthPage(),
                "Перед удалением необходимо выделить строку",
                "Ошибка", JOptionPane.WARNING_MESSAGE);
                return;
            }            
        }
    }
    
    //del a row from holderArrayList and autoRepaint table 
    private void removeRow(int sel) {      
        this.athlete.getData().remove(sel);
        fireTableRowsDeleted(sel, sel);
    }
}
    

