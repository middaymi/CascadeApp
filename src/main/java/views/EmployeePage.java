/************************************
WARNING! CHANGE HANDLEWRITTEN SIZE
         NUMBERS

* setTableColumnsSettings() move to 
employeeModel?
************************************/

package views;

import java.awt.Color;
import java.util.ArrayList;
import java.util.Date;
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

    private int w = Manager.getWidthWithInsets();
    private int h = Manager.getHeightWithInsets();
       
    public EmployeePage() { 
        CommonSettings.panelSettings(this); 
        empModel = EmployeeModel.getEmployeeModelInstance(); 
        empData = empModel.getEmployeeDataLink();
        setTableSettings();       
        setScrlPaneSettings();             
        empModel.setDataSource(); 
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
        table.setRowHeight(h/10);
        table.setAutoResizeMode(JTable.AUTO_RESIZE_ALL_COLUMNS);
        table.setEnabled(false);
        CommonSettings.settingFontBold30(table.getTableHeader());
        CommonSettings.settingFont30(table);
        table.setRowSorter(new TableRowSorter(empModel));
        table.setDefaultEditor(Date.class, new DateCellEditor());
        table.setDefaultRenderer(String.class, new MultiLineCell());
        //table.setRowSelectionAllowed(true);        
    } 
    public JTable getTable() {
        return this.table;
    }
    
    //SCROLL_PANE***************************************************************
    //scroll pane settings
    private void setScrlPaneSettings() {
        scrlPane = new JScrollPane(table); 
        scrlPane.setVisible(true);
        
        //Color newColor = new Color(80, 80, 80, 30);        
        //scrlPane.setBackground(newColor);
        //scrlPane.getViewport().setBackground(newColor);
                
        scrlPane.setSize(5*w/8, 59*h/90);
        scrlPane.setLocation(73*w/400, 23*h/180);
        this.add(scrlPane);
    }
    
    //BUTTONS*******************************************************************
    private void setChangeBtnSettings() {
        changeBtn = new JButton("Изменить");        
        changeBtn.setBackground(Color.LIGHT_GRAY);
        changeBtn.setSize(5*w/64, h/18);
        changeBtn.setLocation(1167*w/1600, 4*h/5);
        CommonSettings.settingFont30(changeBtn);
        this.add(changeBtn);
        changeBtn.addActionListener(new controllers.EmployeePage.
                                        EmpChangeBtnListener());
    }    
    private void setDelBtnSettings() {
        delBtn = new JButton("Удалить");        
        delBtn.setBackground(Color.LIGHT_GRAY);
        delBtn.setSize(5*w/64, h/18);
        delBtn.setLocation(1027*w/1600, 4*h/5);
        delBtn.setVisible(false);
        CommonSettings.settingFont30(delBtn);
        this.add(delBtn);
        delBtn.addActionListener(new controllers.EmployeePage.
                                     DelBtnListener());
    }     
    private void setAddBtnSettings() {
        addBtn = new JButton("Добавить");        
        addBtn.setBackground(Color.LIGHT_GRAY);
        addBtn.setSize(5*w/64, h/18);
        addBtn.setLocation(887*w/1600, 4*h/5);
        addBtn.setVisible(false);
        CommonSettings.settingFont30(addBtn);
        this.add(addBtn);
        addBtn.addActionListener(new controllers.EmployeePage.
                                     AddBtnListener());
    }     
    public void setBtnsMode(boolean mode) {
        //editable or not regime
        if (mode == true) {changeBtn.setText("Выйти");}
        else {changeBtn.setText("Изменить");}
        delBtn.setVisible(mode);
        addBtn.setVisible(mode);
        table.setEnabled(mode); 
    }
}
