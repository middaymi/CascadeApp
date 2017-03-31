//package models;
//
//import dataBase.DataBaseConnection;
//import java.sql.Connection;
//import java.sql.ResultSet;
//import java.sql.ResultSetMetaData;
//import java.sql.SQLException;
//import java.sql.Statement;
//import java.util.ArrayList;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//import javax.swing.table.AbstractTableModel;
//import data.Employee;
//import java.sql.PreparedStatement;
//import java.util.HashSet;
//import java.util.Iterator;
//import javax.swing.JTable;
//import javax.swing.table.DefaultTableModel;
//import javax.swing.table.TableModel;
//import views.Manager;
//
//public class CommonModel extends AbstractTableModel  {
//    private final String tableName = "";
//    private final Connection DBC = DataBaseConnection.getInstanceDataBase().
//                                   getDBconnection();
//    //service array for original columnNames
//    private ArrayList <String> originalTableTitles = new ArrayList();
//    //order like in sqlTable; then name, surname are swaped
//    private String tableTitles[] = {};
//    //for save changed tableFields
//    private HashSet <ArrayList> willUpdateFields = new HashSet<>();
//    
//    //select all data from db
//    String selectAllFromTable = "select * from employee";
//    private ResultSet getDataFromDB() {
//        Statement stmt;
//        ResultSet rs = null;
//        try {
//            stmt = DBC.createStatement();
//            rs = stmt.executeQuery(selectAllFrom); 
//        } catch (SQLException ex) {
//            Logger.getLogger(EmployeeModel.class.getName()).
//                             log(Level.SEVERE,"no executed "
//                             + "query 'selectAllFromEmployee'", ex); 
//        }
//        return rs;
//    }
//    
//    //get selectAllFromEmployee data from ResultSet, 
//    //push it to the employeeDataClass(there:employee)
//     public void setDataSource() {
//        ResultSet rs = null; 
//        Class type = null;
//        try {
//            //del prev data
//            employee.getData().clear();
//            employee.getColumnNames().clear();
//            employee.getColumnTypes().clear();
//            
//            rs = getDataFromDB();
//            ResultSetMetaData rsmd = rs.getMetaData();
//            
//            //get info about columns and their types,
//            //set values to Employee.class arraylist
//            int columnCount = rsmd.getColumnCount();
//            for (int i = 0; i < columnCount; i++) {
//                //add original columnNames to serviceArray
//                originalTableTitles.add(rsmd.getColumnName(i+1));
//                //add columnName                
//                employee.setColumnNames(tableTitles[i]);
//                //add columnType
//                type = Class.forName(rsmd.getColumnClassName(i+1));
//                employee.setColumnTypes(type);                 
//            }     
//                         
//            //?something for table
//            fireTableStructureChanged();
//            
//            //get row-data
//            while (rs.next()) {
//                //save a list of a row
//                ArrayList row = new ArrayList();
//                for (int i = 0; i < columnCount; i++) {
//                    if (employee.getColumnTypes().get(i) == String.class) {
//                        row.add(rs.getString(i+1));
//                    } else {
//                        row.add(rs.getObject(i+1));
//                    }
//                }
//                synchronized (employee.getData()) {                    
//                    employee.setData(row);
//                    //info about added row
//                    fireTableRowsInserted(employee.getData().size()-1, 
//                                          employee.getData().size()-1);
//                }
//            }            
//        } catch (SQLException ex) {
//            Logger.getLogger(EmployeeModel.class.getName()).
//                             log(Level.SEVERE, 
//                             "ResultSet problem", ex);
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(EmployeeModel.class.getName()).
//                             log(Level.SEVERE, 
//                             "not define class type of data", ex);
//        }        
//    }
//               
//    //get rows number
//    public int getRowCount() {
//        synchronized (employee.getData()) {
//            return employee.getData().size();
//        }
//    }
//    //get columns number
//    public int getColumnCount() {
//        return employee.getColumnNames().size();
//    }
//    //get cell column type
//    public Class getColumnClass(int column) {
//        return (Class)employee.getColumnTypes().get(column);
//    }
//    //get cell name
//    public String getColumnName(int column) {
//        return (String)employee.getColumnNames().get(column);
//    }
//    //get cell value
//    public Object getValueAt(int row, int column) {
//        synchronized (employee.getData()) {
//            return ((ArrayList)employee.getData().get(row)).get(column);
//        }
//    }
//    
//    //update fields in DB
//    public void updateData() {
//        Iterator<ArrayList> it = willUpdateFields.iterator();
//        while(it.hasNext()){
//            try {
//                ArrayList now = it.next();
//                int row = (int)now.get(0);
//                int column = (int)now.get(1);
//                Object value = now.get(2);
//                
//                //create updateQuery 
//                String query = "UPDATE " + "EMPLOYEE " +
//                        "SET " + originalTableTitles.get(column) + " = " +
//                        "'" + value + "'" + " WHERE ID = " + getValueAt(row, 0);
//                                
//                System.out.println(query);
//                //update
//                PreparedStatement pstmt = DBC.prepareStatement(query);
//                pstmt.executeUpdate();  
//                
//            } catch (SQLException ex) {
//                Logger.getLogger(EmployeeModel.class.getName()).
//                             log(Level.SEVERE, "Something wrong with SQLquery,"
//                                             + "no update", ex);
//            }            
//        }
//    }  
//    
//    //change cell value
//    public void setValueAt(Object value, int row, int column){
//        //save changes
//        ArrayList willUpdate = new ArrayList();
//        willUpdate.add(row);
//        willUpdate.add(column);
//        willUpdate.add(value);
//        willUpdateFields.add(willUpdate); 
//        //setValue
//        synchronized (employee.getData()) {
//            ((ArrayList)employee.getData().get(row)).set(column, value);
//        }
//        //was changed
//        System.out.println("ROW " + row);
//        System.out.println("COLUMN " + column);   
//   }  
// 
//    //can edit or not
//    public boolean isCellEditable(int row, int column) {
//		return employee.getCellEditable();
//    }
//    //get a link of Employee class with set data
//    public Employee getEmployeeDataLink() {
//        return employee;	 
//    }
//    public void delSelectedRow() {
//       JTable empTable = Manager.getEmpPage().getTable();
//       int sel = empTable.getSelectedRow(); // или номер строки
//       System.out.println("sel " + sel);
//       //DefaultTableModel model = (DefaultTableModel)empTable.getModel();
//       //model.removeRow(sel);
//       //empTable.setModel(model);             
//    }
//}
//
////if (!getColumnClass(column).equals(getValueAt(row, column).getClass())) {
////            JOptionPane.showMessageDialog(Manager.getEmpPage(),
////            "Неверный тип данных",
////            "Ошибка", JOptionPane.WARNING_MESSAGE);   
//}
