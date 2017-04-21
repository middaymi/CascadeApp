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

public class TestComPage extends JPanel {
    private JTable table;
    private JScrollPane scrlPane;
    private TestComModel tcModel = 
            TestComModel.getTestComModelInstance();
    private TestComColumnModel tcColModel;    
    private JButton changeBtn;
    private JButton delBtn;
    private JButton addBtn;
    private JButton editBtn;
    
    private JButton outwitBtn;
    private JButton resultBtn;
    private JButton protocolBtn;
    
    public TestComPage() {
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
        setBtnOutwit();
        setBtnResults();
        setBtnProtocols();
    }
    
    //TABLE*********************************************************************
    public JTable getTable() {
        return this.table;
    }
    //table settings
    private void setTableSettings() {
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
        table.getTableHeader().setPreferredSize(new Dimension(2000, 80));
    }
    //scroll pane settings
    private void setScrlPaneSettings() {
        scrlPane = new JScrollPane(table);        
        scrlPane.setVisible(true);
        scrlPane.setSize(2000, 1180);
        scrlPane.setLocation(584, 230);
        this.add(scrlPane);
    }
    
    //BUTTONS*******************************************************************
    public void setEditableBtnsMode() {
        
    }
    
    public void setBtnOutwit() {
        outwitBtn = new JButton("Провести");              
        outwitBtn.setBackground(Color.LIGHT_GRAY);
        outwitBtn.setSize(250, 100);
        outwitBtn.setLocation(167, 640);
        outwitBtn.setVisible(true);
        CommonSettings.settingFont30(outwitBtn);
        this.add(outwitBtn);
    }
    
    private void setChangeBtnSettings() {
        changeBtn = new JButton("Изменить");        
        changeBtn.setBackground(Color.LIGHT_GRAY);
        changeBtn.setSize(250, 100);
        changeBtn.setLocation(2334, 1440);
        CommonSettings.settingFont30(changeBtn);
        this.add(changeBtn);
        changeBtn.addActionListener(new controllers.TestComPage.
                                        ChangeBtnListener());
    }  
        private void setEditBtnSettings() {
        editBtn = new JButton("Редактировать");        
        editBtn.setBackground(Color.LIGHT_GRAY);
        editBtn.setSize(250, 100);
        editBtn.setLocation(2054, 1440);
        editBtn.setVisible(false);
        CommonSettings.settingFont30(editBtn);
        this.add(editBtn);       
        editBtn.addActionListener(new controllers.TestComPage.
                                        EditBtnListener());
    }     
    private void setDelBtnSettings() {
        delBtn = new JButton("Удалить");        
        delBtn.setBackground(Color.LIGHT_GRAY);
        delBtn.setSize(250, 100);
        delBtn.setLocation(1774, 1440);
        delBtn.setVisible(false);
        CommonSettings.settingFont30(delBtn);
        this.add(delBtn);
        delBtn.addActionListener(new controllers.TestComPage.
                                     DelBtnListener());
    }     
    private void setAddBtnSettings() {
        addBtn = new JButton("Добавить");        
        addBtn.setBackground(Color.LIGHT_GRAY);
        addBtn.setSize(250, 100);
        addBtn.setLocation(1494, 1440);
        addBtn.setVisible(false);
        CommonSettings.settingFont30(addBtn);
        this.add(addBtn);
        addBtn.addActionListener(new controllers.TestComPage.
                                     AddBtnListener());
    }     
    public void setBtnsMode(boolean mode) {
        //editable or not regime
        if (mode == true) {changeBtn.setText("Выйти");}
        else {changeBtn.setText("Изменить");}
        delBtn.setVisible(mode);
        addBtn.setVisible(mode);
        editBtn.setVisible(mode);
        table.setEnabled(mode); 
    }
        
    public void setBtnResults() {
        resultBtn = new JButton("Результаты");              
        resultBtn.setBackground(Color.LIGHT_GRAY);
        resultBtn.setSize(250, 100);
        resultBtn.setLocation(167, 770);
        resultBtn.setVisible(true);
        CommonSettings.settingFont30(resultBtn);
        this.add(resultBtn);
    }
    
    public void setBtnProtocols() {
        protocolBtn = new JButton("Протоколы");              
        protocolBtn.setBackground(Color.LIGHT_GRAY);
        protocolBtn.setSize(250, 100);
        protocolBtn.setLocation(167, 900);
        protocolBtn.setVisible(true);
        CommonSettings.settingFont30(protocolBtn);
        this.add(protocolBtn);
    }
}
