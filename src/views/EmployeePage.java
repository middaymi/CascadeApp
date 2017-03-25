/************************************
WARNING! CHANGE HANDLEWRITTEN SIZE
         NUMBERS

* setTableColumnsSettings() move to 
employeeModel?
************************************/

package views;

import data.Employee;
import java.awt.Color;
import java.util.Enumeration;
import javax.swing.BorderFactory;
import javax.swing.DefaultCellEditor;
import javax.swing.JButton;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.event.TableModelEvent;
import javax.swing.event.TableModelListener;
import javax.swing.table.TableColumn;
import javax.swing.table.TableColumnModel;
import models.EmployeeModel;

public class EmployeePage extends JPanel {
    
    private Employee empData;
    private EmployeeModel empModel;
    private JScrollPane scrlPane;
    private JTable table;
    private TableColumnModel columnModel;
    private JButton changeBtn;
    private JButton delBtn;
    private JButton addBtn;
       
    public EmployeePage() { 
        CommonSettings.panelSettings(this); 
        empModel = EmployeeModel.getOrganizationModelInstance(); 
        empData = empModel.getEmployeeDataLink();
        setTableSettings();       
        setScrlPaneSettings();             
        empModel.setDataSource(); //display the result
        setTableColumnsSettings(); //delete 0 column, exchange 0/1
        setChangeBtnSettings();
        setDelBtnSettings();
        setAddBtnSettings();        
    }
    //TABLE*********************************************************************
    //table settings
    private void setTableSettings() {
        table = new JTable(empModel);
        table.setVisible(true);
        table.setOpaque(true);
        table.setRowHeight(50);
        table.setAutoResizeMode(JTable.AUTO_RESIZE_ALL_COLUMNS);
        table.setEnabled(false);
        CommonSettings.settingFontBold30(table.getTableHeader());
        CommonSettings.settingFont30(table);
    } 
    //table columns settings (setWidth, remove ID column, moveColumn 0/1)
    private void setTableColumnsSettings() {
        columnModel = (table.getColumnModel());
        Enumeration e = columnModel.getColumns();
        //del ID column
        columnModel.removeColumn((TableColumn)columnModel.getColumn(0));
        //change columns surname, name
        columnModel.moveColumn(0, 1);
        while (e.hasMoreElements()) {            
            TableColumn column = (TableColumn)e.nextElement();
            column.setResizable(true);
            column.setPreferredWidth(scrlPane.getWidth()/table.getColumnCount());
        }
        table.setColumnModel(columnModel);
    }
    public JTable getTable() {
        return this.table;
    }
    
    //SCROLL_PANE***************************************************************
    //scroll pane settings
    private void setScrlPaneSettings() {
        scrlPane = new JScrollPane(table);        
        scrlPane.setVisible(true);
        scrlPane.setOpaque(false);
        scrlPane.setViewportBorder(BorderFactory.createLineBorder(Color.YELLOW));
        scrlPane.setSize(2000, 1180);
        scrlPane.setLocation(584, 230);
        this.add(scrlPane);
    }  
    
    //BUTTONS*******************************************************************
    private void setChangeBtnSettings() {
        changeBtn = new JButton("Изменить");        
        changeBtn.setBackground(Color.LIGHT_GRAY);
        changeBtn.setSize(250, 100);
        changeBtn.setLocation(2334, 1440);
        this.add(changeBtn);
        changeBtn.addActionListener(new controllers.EmployeePage.
                                        EmpChangeBtnListener());
    }    
    private void setDelBtnSettings() {
        delBtn = new JButton("Удалить");        
        delBtn.setBackground(Color.LIGHT_GRAY);
        delBtn.setSize(250, 100);
        delBtn.setLocation(2054, 1440);
        delBtn.setVisible(false);
        this.add(delBtn);
        delBtn.addActionListener(new controllers.EmployeePage.
                                     DelBtnListener());
    }     
    private void setAddBtnSettings() {
        addBtn = new JButton("Добавить");        
        addBtn.setBackground(Color.LIGHT_GRAY);
        addBtn.setSize(250, 100);
        addBtn.setLocation(1774, 1440);
        addBtn.setVisible(false);
        this.add(addBtn);
        //delBtn.addActionListener(new controllers.EmployeePage.
        //                             EmpChangeBtnListener());
    } 
    
    public void setBtnsMode(boolean mode) {
        //text for changeBtn
        //can change
        if (mode == true) {
            changeBtn.setText("Сохранить");
            delBtn.setVisible(true);
            addBtn.setVisible(true);
            table.setEnabled(true);            
        }
        else {
            changeBtn.setText("Изменить");
            delBtn.setVisible(false);
            addBtn.setVisible(false);
            table.setEnabled(false);
        }
    }
}
