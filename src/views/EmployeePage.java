/************************************
WARNING! CHANGE HANDLEWRITTEN SIZE
         NUMBERS

* setTableColumnsSettings() move to 
employeeModel?
************************************/

package views;

import java.awt.Color;
import java.awt.Dimension;
import java.sql.Date;
import java.util.ArrayList;
import javax.swing.JButton;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.TableRowSorter;
import models.Employee.EmployeeColumnModel;
import models.Employee.EmployeeModel;
import models.Employee.DateCellEditor;
import models.MultiLineCell;

public class EmployeePage extends JPanel {
    
    private ArrayList empData;
    private EmployeeModel empModel;
    private JScrollPane scrlPane;
    private JTable table;
    private EmployeeColumnModel ecm;
    private JButton changeBtn;
    private JButton delBtn;
    private JButton addBtn;
       
    public EmployeePage() { 
        CommonSettings.panelSettings(this); 
        empModel = EmployeeModel.getEmployeeModelInstance(); 
        empData = empModel.getEmployeeDataLink();
        setTableSettings();       
        setScrlPaneSettings();             
        empModel.setDataSource(); //display the result
        ecm = new EmployeeColumnModel(table);
        ecm.setTableColumnsSettings();
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
        table.setRowHeight(180);
        table.setAutoResizeMode(JTable.AUTO_RESIZE_ALL_COLUMNS);
        table.setEnabled(false);
        CommonSettings.settingFontBold30(table.getTableHeader());
        CommonSettings.settingFont30(table);
        table.setRowSorter(new TableRowSorter(empModel));
        table.setDefaultEditor(java.sql.Date.class, new DateCellEditor());
        table.setDefaultRenderer(String.class, new MultiLineCell());
        table.setRowSelectionAllowed(true);        
    } 
    public JTable getTable() {
        return this.table;
    }
    
    //SCROLL_PANE***************************************************************
    //scroll pane settings
    private void setScrlPaneSettings() {
        scrlPane = new JScrollPane(table); 
        scrlPane.setVisible(true);
        
        scrlPane.setBackground(new Color(80, 80, 80, 30));
        scrlPane.getViewport().setBackground(new Color(80, 80, 80, 30));
                
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
        CommonSettings.settingFont30(changeBtn);
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
        CommonSettings.settingFont30(delBtn);
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
        CommonSettings.settingFont30(addBtn);
        this.add(addBtn);
        addBtn.addActionListener(new controllers.EmployeePage.AddBtnListener());
    } 
    
    public void setBtnsMode(boolean mode) {
        //text for changeBtn
        //can change
        if (mode == true) {
            changeBtn.setText("Выйти");
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
