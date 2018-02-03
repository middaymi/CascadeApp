package views.TestCom;

import java.awt.Color;
import java.awt.Dimension;
import javax.swing.JButton;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.TableRowSorter;
import models.TestCom.TestComColumnModel;
import models.TestCom.TestComModel;
import views.CommonSettings;
import views.Manager;

public class TestComPage extends JPanel {
    private JTable table;
    private JScrollPane scrlPane;
    
    private TestComColumnModel tcColModel;
    private TestComModel tcModel;    
    private JButton changeBtn;
    private JButton delBtn;
    private JButton addBtn;
    private JButton editBtn;
    
    private JButton startComBtn;    
    private JButton protocolBtn;

    private int w = Manager.getWidthWithInsets();
    private int h = Manager.getHeightWithInsets();
    
    public TestComPage() {
        tcModel = TestComModel.getTestComModelInstance();
        //panel
        CommonSettings.panelSettings(this);
        //get data
        tcModel.setDataSource();
        //table
        setTableSettings();
        //scrollPane
        setScrlPaneSettings();
        //set column model 
        tcColModel = new TestComColumnModel(table);
        
        //btns
        setChangeBtnSettings();
        setEditBtnSettings();
        setDelBtnSettings();
        setAddBtnSettings();
        
        //left btns
        setBtnStart();        
        setBtnProtocols();
    }
    
    //TABLE*********************************************************************
    public JTable getTable() {
        return this.table;
    }
    //table settings
    private void setTableSettings() {
        tcModel = 
            TestComModel.getTestComModelInstance();
        table = new JTable(tcModel);
        table.setVisible(true);
        table.setOpaque(true);
        table.setRowHeight(50);
        table.setAutoResizeMode(JTable.AUTO_RESIZE_ALL_COLUMNS);
        table.setEnabled(false);
        CommonSettings.settingFontBold30(table.getTableHeader());
        CommonSettings.settingFont30(table);
        table.setRowSorter(new TableRowSorter(tcModel));
        //width like as a scrlPane
        table.getTableHeader().setPreferredSize(new Dimension(5*w/8, 2*h/45));
    }
    //scroll pane settings
    private void setScrlPaneSettings() {
        scrlPane = new JScrollPane(table);        
        scrlPane.setVisible(true);
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
        changeBtn.addActionListener(new controllers.TestComPage.
                                        ChangeBtnListener());
    }  
        private void setEditBtnSettings() {
        editBtn = new JButton("Редактировать");        
        editBtn.setBackground(Color.LIGHT_GRAY);
        editBtn.setSize(5*w/64, h/18);
        editBtn.setLocation(1027*w/1600, 4*h/5);
        editBtn.setVisible(false);
        CommonSettings.settingFont30(editBtn);
        this.add(editBtn);       
        editBtn.addActionListener(new controllers.TestComPage.
                                        EditBtnListener());
    }     
    private void setDelBtnSettings() {
        delBtn = new JButton("Удалить");        
        delBtn.setBackground(Color.LIGHT_GRAY);
        delBtn.setSize(5*w/64, h/18);
        delBtn.setLocation(887*w/1600, 4*h/5);
        delBtn.setVisible(false);
        CommonSettings.settingFont30(delBtn);
        this.add(delBtn);
        delBtn.addActionListener(new controllers.TestComPage.
                                     DelBtnListener());
    }     
    private void setAddBtnSettings() {
        addBtn = new JButton("Добавить");        
        addBtn.setBackground(Color.LIGHT_GRAY);
        addBtn.setSize(5*w/64, h/18);
        addBtn.setLocation(747*w/1600, 4*h/5);
        addBtn.setVisible(false);
        CommonSettings.settingFont30(addBtn);
        this.add(addBtn);
        addBtn.addActionListener(new controllers.TestComPage.
                                     AddBtnListener());
    }     
    public void setBtnsMode(boolean mode) {
        //editable or not regime
        if (mode) {changeBtn.setText("Выйти");}
        else {changeBtn.setText("Изменить");}
        delBtn.setVisible(mode);
        addBtn.setVisible(mode);
        editBtn.setVisible(mode);
        table.setEnabled(mode); 
    }
    
      public void setBtnStart() {
        startComBtn = new JButton("Провести");              
        startComBtn.setBackground(Color.LIGHT_GRAY);
        startComBtn.setSize(5*w/64, h/18);
        startComBtn.setLocation(167*w/3200, 47*h/120);
        startComBtn.setVisible(true);
        CommonSettings.settingFont30(startComBtn);
        this.add(startComBtn);
        startComBtn.addActionListener(new controllers.TestComPage.StartCom());
    }
    
    public void setBtnProtocols() {
        protocolBtn = new JButton("<html>Итоговый<p align=center>"+
                                  "протокол</html>");              
        protocolBtn.setBackground(Color.LIGHT_GRAY);
        protocolBtn.setSize(5*w/64, h/18);
        protocolBtn.setLocation(167*w/3200, 167*h/360);
        protocolBtn.setVisible(true);
        CommonSettings.settingFont30(protocolBtn);
        this.add(protocolBtn);
        protocolBtn.addActionListener(new controllers.TestComPage.ViewProtocol());
    }
}
