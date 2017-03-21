package data;

import java.util.ArrayList;

public class Employee {    
    //list of columns names
    private ArrayList columnNames = new ArrayList();    
    //list of columns type 
    private ArrayList columnTypes = new ArrayList();    
    //data from DB
    private ArrayList data = new ArrayList();    
    
    private ArrayList serviceData = new ArrayList();
    
    //edit or not rhe table
    private boolean editable;   

    public ArrayList getColumnNames() {
        return columnNames;
    }
    public ArrayList getColumnTypes() {
        return columnTypes;
    }
    public ArrayList getData() {
        return data;
    }
    public boolean isEditable() {
        return editable;
    }

    public void setColumnNames(ArrayList columnNames) {
        this.columnNames = columnNames;
    }
    public void setColumnTypes(ArrayList columnTypes) {
        this.columnTypes = columnTypes;
    }
    public void setData(ArrayList data) {
        this.data = data;
    }
    public void setEditable(boolean editable) {
        this.editable = editable;
    } 
    
    public void printArray (ArrayList ar) {
        for (int i = 0; i < ar.size(); i++) {
            System.out.println(ar.get(i));
        }
    }
}
