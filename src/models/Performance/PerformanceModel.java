package models.Performance;

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
import java.sql.PreparedStatement;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import views.Manager;
import data.Performance;

public class PerformanceModel extends AbstractTableModel{

    private static PerformanceModel performanceModelInstance = null;
    private final Connection DBC = DataBaseConnection.getInstanceDataBase().
                                   getDBconnection();  
    //edit or not the table
    private boolean editable;
        
    //DATA**********************************************************************
    private ArrayList <Performance> data = new ArrayList();  
        
    //HEADER********************************************************************
    //service array for original columnNames
    private ArrayList <String> enColumnNames = new ArrayList();    
    //table headers
    private String titles[] = {"ID", "Название", "Фонограмма", "Дизайн костюма", 
                               "Фото костюма", "Описание"};     
    //order like in sqlTable; then name, surname are swaped 
    private ArrayList <String> columnNames = new ArrayList();    
    //list of columns type 
    private ArrayList <Object> columnTypes = new ArrayList();     
    //**************************************************************************
    
    //constructor
    private PerformanceModel() {
        setEditable(true);      
    }
    
    //singletone, get an object link
    public static PerformanceModel getPerformanceModelInstance() {
        if (performanceModelInstance == null)
            performanceModelInstance = new PerformanceModel();
        return performanceModelInstance;
    }
    
    //editing
    public boolean isEditable() {
        return editable;
    }
    public void setEditable(boolean editable) {
        this.editable = editable;
    }   
    
    //SELECT ALL****************************************************************
    //query: select all data from db
    String selectAllFromPerformance = "SELECT * FROM PERFORMANCE";
    private ResultSet getDataFromDB() {
        Statement stmt;
        ResultSet rs = null;
        try {
            stmt = DBC.createStatement();
            rs = stmt.executeQuery(selectAllFromPerformance); 
        } catch (SQLException ex) {
            Logger.getLogger(PerformanceModel.class.getName()).
                             log(Level.SEVERE,"no executed "
                             + "query 'selectAllFromPerformance'", ex); 
        }
        return rs;
    }
    
    //CREATE VALUES|ROWS FOR TABLE**********************************************
    //get selectAllFromPerformance data from ResultSet, 
    //push it to the data storage (there:performance)
     public void setDataSource() {
        ResultSet rs = null; 
        Class type = null;
        try {
            //del prev data
            getData().clear();
            getColumnNames().clear();
            getColumnTypes().clear();
            
            rs = getDataFromDB();
            ResultSetMetaData rsmd = rs.getMetaData();
            
            //get info about columns and their types,
            //set values to Performance.class arraylist
            int columnCount = rsmd.getColumnCount();
            for (int i = 0; i < columnCount; i++) {
                //add original columnNames to serviceArray
                enColumnNames.add(rsmd.getColumnName(i+1));
                //add titles
                setColumnNames(titles[i]);
                //add columnType
                type = Class.forName(rsmd.getColumnClassName(i+1));
                setColumnTypes(type);                 
            } 
                                     
            //?something for table
            fireTableStructureChanged();
            
            //get row-data
            while (rs.next()) {
                //save a dataclass of a row
                Performance rowPerformance = new Performance();
                for (int i = 0; i < columnCount; i++) {                    
                    switch (enColumnNames.get(i)) {
                        case ("ID"):
                            rowPerformance.setId(rs.getInt(i + 1));
                            break;
                        case ("FullName"):
                            rowPerformance.setFullName(rs.getString(i + 1));
                            break;     
                        case ("Phonogram"):
                            rowPerformance.setPhonogram(rs.getString(i + 1));
                            break;
                        case ("CostumeDesign"):
                            rowPerformance.setCostumeDesign(rs.getString(i + 1));
                            break;                            
                        case ("CostumePhoto"):
                            rowPerformance.setCostumePhoto(rs.getString(i + 1));
                            break;                       
                        case ("Description"):
                            rowPerformance.setDescription(rs.getString(i + 1));
                            break;
                    }                 
                }
                synchronized (getData()) {                    
                    setData(rowPerformance);
                    //info about added row
                    fireTableRowsInserted(getData().size()-1, 
                                          getData().size()-1);
                }
            }            
        } catch (SQLException ex) {
            Logger.getLogger(PerformanceModel.class.getName()).
                             log(Level.SEVERE, 
                             "ResultSet problem", ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PerformanceModel.class.getName()).
                             log(Level.SEVERE, 
                             "not define class type of data", ex);
        }        
    } 
     
    //GET_VALUE*****************************************************************
    public Object getValueAt(int row, int column) {        
        Performance perLink;        
        perLink = (Performance)getData().get(row);        
        String colName = enColumnNames.get(column);
        Object returnField = null;

        switch (colName) {
            case ("ID"): 
                returnField = perLink.getId();
                break;
            case ("FullName"):
                returnField = perLink.getFullName();
                break;     
            case ("Phonogram"):
                returnField = perLink.getPhonogram();
                break;
            case ("CostumeDesign"):
                returnField = perLink.getCostumeDesign();
                break;                            
            case ("CostumePhoto"):
                returnField = perLink.getCostumePhoto();
                break;                       
            case ("Description"):
                returnField = perLink.getDescription();
                break;      
        }                   
        return returnField;        
    }  
    
    //CATCH CHANGE CELL VALUE***************************************************
    public void setValueAt(Object value, int row, int column) {                        
        //will get an edited class
        Performance setClass;        
        //Performance row-exemplar
        setClass = getDataByIndex(row);         
                            
        switch (getEnColumnNames().get(column)) {                 
            case ("FullName"):                        
                setClass.setFullName(((String)value).trim());
                break;                            
            case ("Phonogram"):
                setClass.setPhonogram(((String)value).trim());
                break;
            case ("CostumeDesign"):
                setClass.setCostumeDesign(((String)value).trim());
                break;                            
            case ("CostumePhoto"):
                setClass.setCostumePhoto(((String)value).trim());
                break;                       
            case ("Description"):
                setClass.setDescription(((String)value).trim());
                break; 
        }             
        updateData(row, column, value);      
   }  
       
    //UPDATE FIELDS IN DB AFTER EDIT TABLE CELL*********************************
    public void updateData(int row, int column, Object value) {                
        try { 
            //create updateQuery 
            String query = "UPDATE " + "PERFORMANCE " +
                    "SET " + enColumnNames.get(column) + " = " +
                    "'" + value + "'" + " WHERE ID = " + getValueAt(row, 0);
            System.out.println(query);
            //update
            PreparedStatement pstmt = DBC.prepareStatement(query);
            pstmt.executeUpdate(); 
        } catch (SQLException ex) {
            Logger.getLogger(PerformanceModel.class.getName()).
                         log(Level.SEVERE, "Something wrong with SQLquery,"
                                         + "no update", ex);
        } 
    }
    
   //DELETE_ROW*****************************************************************  
   public void delSelectedRow() {
        int sel = 0;
        try {             
            JTable perTable = Manager.getPerPage().getTable();
            //get selected row
            sel = perTable.getSelectedRow(); 
            System.out.println("sel " + sel);
                        
            //del a row from DB
            String query = "DELETE " + "FROM PERFORMANCE " +
                           "WHERE ID = " + getValueAt(sel, 0);
            System.out.println(query);
            PreparedStatement pstmt = DBC.prepareStatement(query); 
            pstmt.executeUpdate();
            this.removeRow(sel);
           
        } catch (SQLException ex) {
            Logger.getLogger(PerformanceModel.class.getName()).log(Level.SEVERE, 
                            "Something wrong with deleting a row", ex);
        } catch (ArrayIndexOutOfBoundsException ex) {
            if (sel == -1) {    
                JOptionPane.showMessageDialog(Manager.getPerPage(),
                "Перед удалением необходимо выделить строку",
                "Ошибка", JOptionPane.WARNING_MESSAGE);
                return;
            }            
        }
    }
    //del a row from holderArrayList and autoRepaint table 
    private void removeRow(int sel) {      
        getData().remove(sel);
        fireTableRowsDeleted(sel, sel);
    } 
    
    //INSERT_ROW****************************************************************
    public void addPerformance() {
        //get the least index, bottom add
        int rowIndex = getData().size();
        //create empty data class
        Performance newRow = new Performance();        
        newRow.setFullName("");
        newRow.setPhonogram("");
        newRow.setCostumeDesign("");
        newRow.setCostumePhoto("");
        newRow.setDescription("");        
        setData(newRow);        
        //change table view
        fireTableRowsInserted(rowIndex, rowIndex);
        //insert into db
        insertRowIntoTable(newRow, rowIndex);
    }
    //change tempFullName!!!!
    private void insertRowIntoTable (Performance performance, int rowIndex)  {        
        try {     
            int tempID = 0;
            //get ID added empty row
            String selectID = "SELECT IDENT_CURRENT('PERFORMANCE')";
            Statement stmt = DBC.createStatement();
            ResultSet rs = stmt.executeQuery(selectID);
            while (rs.next()) {
                tempID = rs.getInt(1)+ 1;
                performance.setId(tempID);
            }
            
            //add empty row
            String query = "INSERT INTO PERFORMANCE "
                         + "VALUES (" + tempID + ", '', '', '', '')";
            System.out.println(query);
            PreparedStatement pstmt = DBC.prepareStatement(query);
            pstmt.execute();                
          
        pstmt.close();
        stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(PerformanceModel.class.getName()).log(Level.SEVERE,
                       "Not insert a new row into DB or not get row ID", ex);
        }        
    }
    
    //DEL_EMPTY_ROWS************************************************************
    public void delEmptyRows() {        
        try { 
            //for delete from data
            //what ID will del
            String query = "SELECT ID FROM PERFORMANCE "
                         + "WHERE FullName = CAST(ID AS varchar(10));";
            System.out.println(query);
            Statement stmt = DBC.createStatement();
            ResultSet rs = stmt.executeQuery(query); 
                        
            //get id rows for del
            int i = 1;
                        
            //if there are empty rows
            while (rs.next()) {     
                System.out.println("EMPTY ROWS ID: " + rs.getInt(i));
                for (int j = 0; j < getData().size(); j++) {
                    if (((Performance) getDataByIndex(j)).getId() == rs.getInt(i)) {
                        //delete rows from data and table
                        removeRow(j);  
                    }
                }                
            }
            //say user message
            JOptionPane.showMessageDialog(Manager.getPerPage(),
            "Пустые строки были удалены",
            "Информирование", JOptionPane.INFORMATION_MESSAGE);
        } catch (SQLException ex) {
        Logger.getLogger(PerformanceModel.class.getName()).log(Level.SEVERE, 
                         "Cannot select empty rows", ex);
        }
        
        //delete from db
        try{           
            String queryDelDB = "DELETE FROM PERFORMANCE "
                              + "WHERE FullName = CAST(ID AS varchar(10));";
            System.out.println(queryDelDB);
            PreparedStatement pstmt = DBC.prepareStatement(queryDelDB);
            pstmt.execute();          
            
        } catch (SQLException ex) {
            Logger.getLogger(PerformanceModel.class.getName()).log(Level.SEVERE, 
                             "Cannot delete empty rows", ex);
        }
    }
      
    //GETTERS*******************************************************************
    //can edit or not
    public boolean isCellEditable(int row, int column) {
		return getCellEditable();
    }    
    //get a link of Employee class with set data
    public ArrayList getEmployeeDataLink() {
        return data;	 
    }
    //get rows number
    public int getRowCount() {
        synchronized (getData()) {
            return getData().size();
        }
    }        
    public ArrayList getColumnNames() {
        return columnNames;
    }
    public ArrayList <String> getEnColumnNames() {
        return enColumnNames;
    }
    public ArrayList getColumnTypes() {
        return columnTypes;
    }
    public Performance getDataByIndex(int i) {
        return (Performance)data.get(i);
    }
    public ArrayList getData() {
        return data;
    }    
    public boolean getCellEditable() {
        return editable;
    }

    //get columns number
    public int getColumnCount() {
        return getColumnNames().size();
    }
    //get cell column type
    public Class getColumnClass(int column) {
        return (Class)getColumnTypes().get(column);
    }
    //get cell name
    public String getColumnName(int column) {
        return (String)getColumnNames().get(column);
    } 
    
    //SETTERS*******************************************************************
    public void setColumnNames(String str) {
        this.columnNames.add(str);
    }
    public void setColumnTypes(Class cls) {
        this.columnTypes.add(cls);
    }
    public void setData(Performance data) {
        this.data.add(data);
    }
}
