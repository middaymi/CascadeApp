package models.Employee;

import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
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
import java.sql.Date;
import java.sql.PreparedStatement;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import views.Manager;

public class EmployeeModel extends AbstractTableModel{

    private static EmployeeModel employeeModelInstance = null;
    private final Connection DBC = DataBaseConnection.getInstanceDataBase().
                                   getDBconnection();  
    //edit or not the table
    private boolean editable;
        
    //DATA**********************************************************************
    private ArrayList <Employee> data = new ArrayList();  
        
    //HEADER********************************************************************
    //service array for original columnNames
    private ArrayList <String> enColumnNames = new ArrayList();    
    //table headers
    private String titles[] = {"ID", "Имя", "Фамилия", "Отчество", "ДР", 
                               "Опыт", "Образование"};     
    //order like in sqlTable; then name, surname are swaped 
    private ArrayList <String> columnNames = new ArrayList();    
    //list of columns type 
    private ArrayList <Object> columnTypes = new ArrayList();     
    //**************************************************************************
    
    //constructor
    private EmployeeModel() {
        setEditable(true);      
    }
    
    //singletone, get an object link
    public static EmployeeModel getEmployeeModelInstance() {
        if (employeeModelInstance == null)
            employeeModelInstance = new EmployeeModel();
        return employeeModelInstance;
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
    String selectAllFromEmployee = "select * from employee";
    private ResultSet getDataFromDB() {
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
    
    //CREATE VALUES|ROWS FOR TABLE**********************************************
    //get selectAllFromEmployee data from ResultSet, 
    //push it to the data storage (there:employee)
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
            //set values to Employee.class arraylist
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
                Employee rowEmployee = new Employee();
                for (int i = 0; i < columnCount; i++) {                    
                    switch (enColumnNames.get(i)) {
                        case ("ID"):
                            rowEmployee.setId(rs.getInt(i + 1));
                            break;
                        case ("Name"):
                            rowEmployee.setName(rs.getString(i + 1));
                            break;                            
                        case ("Surname"):
                            rowEmployee.setSurname(rs.getString(i + 1));
                            break;                            
                        case ("Middlename"):
                            rowEmployee.setMiddlename(rs.getString(i + 1));
                            break;
                        case ("Birthday"):
                            rowEmployee.setBirthday(rs.getDate(i + 1));
                            break;
                        case ("Experience"):
                            rowEmployee.setExperience(rs.getInt(i + 1));
                            break;
                        case ("Education"):
                            rowEmployee.setEducation(rs.getString(i + 1));
                            break;
                    }                 
                }
                synchronized (getData()) {                    
                    setData(rowEmployee);
                    //info about added row
                    fireTableRowsInserted(getData().size()-1, 
                                          getData().size()-1);
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
     
    //GET_VALUE*****************************************************************
    public Object getValueAt(int row, int column) {        
        Employee empLink;        
        empLink = (Employee)getData().get(row);        
        String colName = enColumnNames.get(column);
        Object returnField = null;

        switch (colName) {
            case ("ID"): 
                returnField = empLink.getId();
                break;
            case ("Name"):
                returnField = empLink.getName(); 
                break;
            case ("Surname"):
                returnField = empLink.getSurname();                                                    
                break;
            case ("Middlename"):
                returnField = empLink.getMiddlename();                        
                break;
            case ("Birthday"):
                returnField = empLink.getBirthday();
                break;
            case ("Experience"):
                returnField = empLink.getExperience();                        
                break;
            case ("Education"):                        
                returnField = empLink.getEducation();
                break;
        }                   
        return returnField;        
    }  
    
    //CATCH CHANGE CELL VALUE***************************************************
    public void setValueAt(Object value, int row, int column) {                        
        //will get an edited class
        Employee setClass;        
        //Employee row-exemplar
        setClass = getDataByIndex(row);         
                            
        switch (getEnColumnNames().get(column)) {                 
            case ("Name"):                        
                setClass.setName(((String)value).trim());
                break;                            
            case ("Surname"):                        
                setClass.setSurname(((String)value).trim());
                break;                            
            case ("Middlename"):
                setClass.setMiddlename(((String)value).trim());
                break;
            case ("Birthday"):
                setClass.setBirthday((Date)value);                        
                break;
            case ("Experience"):
                setClass.setExperience((Integer)value);
                break;
            case ("Education"):
                setClass.setEducation(((String)value).trim());                        
                break;
        }                 
        updateData(row, column, value);      
   }  
       
    //UPDATE FIELDS IN DB AFTER EDIT TABLE CELL*********************************
    public void updateData(int row, int column, Object value) {                
        try { 
            //create updateQuery 
            String query = "UPDATE " + "EMPLOYEE " +
                    "SET " + enColumnNames.get(column) + " = " +
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
    
   //DELETE_ROW*****************************************************************  
   public void delSelectedRow() {
        int sel = 0;
        try {             
            JTable empTable = Manager.getEmpPage().getTable();
            //get selected row
            sel = empTable.getSelectedRow(); 
            System.out.println("sel " + sel);
                        
            //del a row from DB
            String query = "DELETE " + "FROM EMPLOYEE " +
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
                JOptionPane.showMessageDialog(Manager.getEmpPage(),
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
    public void addEmployee() {
        //get the least index, bottom add
        int rowIndex = getData().size();
        //create empty data class
        Employee newRow = new Employee();        
        newRow.setName("");
        newRow.setSurname("");
        newRow.setMiddlename("");
        //newRow.setBirthday();
        newRow.setExperience(0);
        newRow.setEducation("");
        setData(newRow);        
        //change table view
        fireTableRowsInserted(rowIndex, rowIndex);
        //insert into db
        insertRowIntoTable(newRow);
    }
    
    private void insertRowIntoTable (Employee employee)  {        
        try {
            //add empty row
            String query = "INSERT INTO EMPLOYEE "
                         + "VALUES ('', '', '', NULL, 0, '')";
            System.out.println(query);
            PreparedStatement pstmt = DBC.prepareStatement(query);
            pstmt.execute();
            
            //get ID added empty row
            String selectID = "SELECT IDENT_CURRENT('EMPLOYEE')";
            Statement stmt = DBC.createStatement();
            ResultSet rs = stmt.executeQuery(selectID);
            while (rs.next()) {
                employee.setId(rs.getInt(1));
            }       
          
        pstmt.close();
        stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeModel.class.getName()).log(Level.SEVERE,
                       "Not insert a new row into DB or not get row ID", ex);
        }        
    }
    
    //DEL_EMPTY_ROWS************************************************************
    public void delEmptyRows() {
        //delete from table
        try {            
            String query = "SELECT ID FROM EMPLOYEE "
                         + "WHERE Name = '' AND Surname = '' AND "
                         + "Middlename = '';";
            System.out.println(query);
            Statement stmt = DBC.createStatement();
            ResultSet rs = stmt.executeQuery(query); 
                        
            //get id rows for del
            int i = 1;
            
            //if not empty rows
            if (!rs.next()) {return;}
            
            //if there are empty rows
            while (rs.next()) {                  
                for (int j = 0; j < getData().size(); j++) {
                    System.out.println("RS: " + rs.getInt(i));
                    System.out.println(((Employee) getDataByIndex(j)).getId());
                    if (((Employee) getDataByIndex(j)).getId() == rs.getInt(i)) {
                        removeRow(j);  
                    }
                }                
            }
            //say user message
            JOptionPane.showMessageDialog(Manager.getEmpPage(),
            "Пустые строки были удалены",
            "Информирование", JOptionPane.INFORMATION_MESSAGE);
        } catch (SQLException ex) {
        Logger.getLogger(EmployeeModel.class.getName()).log(Level.SEVERE, 
                         "Cannot select empty rows", ex);
        }
        
        //delete from db
        try{           
            String queryDelDB = "DELETE FROM EMPLOYEE "
                    + "WHERE Name = '' AND Surname = '' AND Middlename = '';";
            System.out.println(queryDelDB);
            PreparedStatement pstmt = DBC.prepareStatement(queryDelDB);
            pstmt.execute();          
            
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeModel.class.getName()).log(Level.SEVERE, 
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
    public Employee getDataByIndex(int i) {
        return (Employee)data.get(i);
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
    public void setData(Employee data) {
        this.data.add(data);
    }
}