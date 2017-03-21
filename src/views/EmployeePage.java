package views;

import data.Employee;
import java.awt.Color;
import java.util.Enumeration;
import javax.swing.BorderFactory;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.TableColumn;
import javax.swing.table.TableColumnModel;
import models.EmployeeModel;

public class EmployeePage extends JPanel {
    
    private Employee empData;
    private EmployeeModel empModel;
    private JScrollPane scrlPane;
    private JTable table;
    private TableColumnModel columnModel;
    
    public EmployeePage() { 
        CommonSettings.panelSettings(this); 
        empModel = EmployeeModel.getOrganizationModelInstance();        
        
        //table settings
        table = new JTable(empModel);
        table.setVisible(true);
        table.setOpaque(true);
        table.setRowHeight(50);
        table.setAutoResizeMode(JTable.AUTO_RESIZE_LAST_COLUMN);
        CommonSettings.settingFont30(table.getTableHeader());
        CommonSettings.settingFont30(table);     

        //scroll pane settings
        scrlPane = new JScrollPane(table);        
        scrlPane.setVisible(true);
        scrlPane.setOpaque(false);
        scrlPane.setViewportBorder(BorderFactory.createLineBorder(Color.YELLOW));
        scrlPane.setSize(2000, 1180);
        scrlPane.setLocation(584, 230);
        
        this.add(scrlPane);
             
        //display the result
        empModel.setDataSource();
        
         //table columns  settings
        columnModel = table.getColumnModel();
        Enumeration e = columnModel.getColumns();
        while (e.hasMoreElements()) {            
            TableColumn column = (TableColumn)e.nextElement();
            column.setResizable(true);
            if (column.getModelIndex() == 5) {
                column.setWidth(30);
                column.setPreferredWidth(30);
            }                                  
        }
    } 
}
