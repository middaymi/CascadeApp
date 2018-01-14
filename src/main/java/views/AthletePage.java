package views;

import models.Athlete.AthleteColumnModel;
import models.Athlete.AthleteModel;
import java.awt.Color;
import java.util.ArrayList;
import javax.swing.JButton;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.TableRowSorter;
import models.MultiLineCell;

public class AthletePage extends JPanel {
    
    private ArrayList athData;
    private AthleteModel athModel;
    private JScrollPane scrlPane;
    private JTable table;
    private JButton changeBtn;
    private JButton delBtn;
    private JButton addBtn;
    private AthleteColumnModel acm;

    private int w = Manager.getWidthWithInsets();
    private int h = Manager.getHeightWithInsets();
       
    public AthletePage() { 
        CommonSettings.panelSettings(this); 
        athModel = AthleteModel.getAthleteModelInstance(); 
        athData = athModel.getAthleteDataLink();
        setTableSettings();       
        setScrlPaneSettings();
        //display the result
        athModel.setDataSource(); 
        //set columnModel for table
        acm = new AthleteColumnModel(table); 
        acm.setTableColumnsSettings();
        setChangeBtnSettings();
        setDelBtnSettings();
        setAddBtnSettings(); 
        //set a sort
        table.setRowSorter(new TableRowSorter(athModel));
    }
    //TABLE*********************************************************************
    //table settings
    private void setTableSettings() {
        table = new JTable(athModel);
        table.setVisible(true);
        table.setOpaque(true);
        table.setRowHeight(h/20);
        table.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);
        table.setEnabled(false);
        CommonSettings.settingFontBold30(table.getTableHeader());
        CommonSettings.settingFont30(table);
        table.setDefaultRenderer(String.class, new MultiLineCell());
    }    
    public JTable getTable() {
        return this.table;
    }
    
    //SCROLL_PANE***************************************************************
    //scroll pane settings
    private void setScrlPaneSettings() {
        scrlPane = new JScrollPane(table);        
        scrlPane.setVisible(true);
        //color
        //scrlPane.setBackground(new Color(80, 80, 80, 30));
        //scrlPane.getViewport().setBackground(new Color(80, 80, 80, 30));
                
        scrlPane.setSize(15*w/16, 119*h/180);
        scrlPane.setLocation(21*w/800, 23*h/180);
        this.add(scrlPane);
    }  
    
    //BUTTONS*******************************************************************
    private void setChangeBtnSettings() {
        changeBtn = new JButton("Изменить");        
        changeBtn.setBackground(Color.LIGHT_GRAY);
        changeBtn.setSize(5*w/64, h/18);
        changeBtn.setLocation(1417*w/1600, 4*h/5);
        CommonSettings.settingFont30(changeBtn);
        this.add(changeBtn);
        changeBtn.addActionListener(new controllers.AthletePage.
                                        AthChangeBtnListener());                                        
    }    
    private void setDelBtnSettings() {
        delBtn = new JButton("Удалить");        
        delBtn.setBackground(Color.LIGHT_GRAY);
        delBtn.setSize(5*w/64, h/18);
        delBtn.setLocation(1277*w/1600, 4*h/5);
        delBtn.setVisible(false);
        CommonSettings.settingFont30(delBtn);
        this.add(delBtn);
        delBtn.addActionListener(new controllers.AthletePage.
                                     DelBtnListener());
    }     
    private void setAddBtnSettings() {
        addBtn = new JButton("Добавить");        
        addBtn.setBackground(Color.LIGHT_GRAY);
        addBtn.setSize(5*w/64, h/18);
        addBtn.setLocation(1137*w/1600, 4*h/5);
        addBtn.setVisible(false);
        CommonSettings.settingFont30(addBtn);
        this.add(addBtn);
        addBtn.addActionListener(new controllers.AthletePage.
                                     AddBtnListener());
    }     
    public void setBtnsMode(boolean mode) {
        //editable or not regime
        if (mode) {changeBtn.setText("Выйти");}
        else {changeBtn.setText("Изменить");}
        delBtn.setVisible(mode);
        addBtn.setVisible(mode);
        table.setEnabled(mode); 
    }
}
