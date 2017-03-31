package views;

import models.Athlete.AthleteColumnModel;
import models.Athlete.AthleteModel;
import data.Athlete;
import java.awt.Color;
import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.TableRowSorter;

public class AthletePage extends JPanel {
    
    private Athlete athData;
    private models.Athlete.AthleteModel athModel;
    private JScrollPane scrlPane;
    private JTable table;
    private JButton changeBtn;
    private JButton delBtn;
    private JButton addBtn;
    private AthleteColumnModel acm;
       
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
        table.setRowHeight(50);
        table.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);
        table.setEnabled(false);
        CommonSettings.settingFontBold30(table.getTableHeader());
        CommonSettings.settingFont30(table);
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
        scrlPane.setSize(3000, 1180);
        scrlPane.setLocation(84, 230);
        this.add(scrlPane);
    }  
    
    //BUTTONS*******************************************************************
    private void setChangeBtnSettings() {
        changeBtn = new JButton("Изменить");        
        changeBtn.setBackground(Color.LIGHT_GRAY);
        changeBtn.setSize(250, 100);
        changeBtn.setLocation(2834, 1440);
        CommonSettings.settingFont30(changeBtn);
        this.add(changeBtn);
        changeBtn.addActionListener(new controllers.AthletePage.
                                        AthChangeBtnListener());                                        
    }    
    private void setDelBtnSettings() {
        delBtn = new JButton("Удалить");        
        delBtn.setBackground(Color.LIGHT_GRAY);
        delBtn.setSize(250, 100);
        delBtn.setLocation(2554, 1440);
        delBtn.setVisible(false);
        CommonSettings.settingFont30(delBtn);
        this.add(delBtn);
        delBtn.addActionListener(new controllers.AthletePage.
                                     DelBtnListener());
    }     
    private void setAddBtnSettings() {
        addBtn = new JButton("Добавить");        
        addBtn.setBackground(Color.LIGHT_GRAY);
        addBtn.setSize(250, 100);
        addBtn.setLocation(2274, 1440);
        addBtn.setVisible(false);
        CommonSettings.settingFont30(addBtn);
        this.add(addBtn);
        //delBtn.addActionListener();
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
