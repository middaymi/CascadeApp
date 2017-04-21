package views.TestCom;

import java.awt.Color;
import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import models.TestCom.TestComModel;
import views.CommonSettings;
import views.Manager;

public class SingleEditPage extends JPanel {
    private JLabel welcome;
    private Manager manager;
    private TestComModel tcModel;
    private TestComPage tcPage;
    int sel;
         
    private JLabel athl;
    private JLabel jud;
        
    private JList athlLst;
    private JList judLst;    
    private DefaultListModel athlLstModel;
    private DefaultListModel judLstModel;
        
    private JButton athlDelBtn;
    private JButton judDelBtn;
        
    private JButton athlAddBtn;
    private JButton judAddBtn;
        
    private JComboBox athlCombo;
    private JComboBox judCombo;
    
    public SingleEditPage() {
        CommonSettings.panelSettings(this);
        manager = Manager.getManagerInstance();
        tcModel = TestComModel.getTestComModelInstance();
        tcPage = manager.getTestCompPage();
        sel = tcModel.selRow();
        
        //create labels
        createWelcomeLabel();        
        createLabel(1, athl);
        createLabel(2, jud);
                        
        createList(1, athlLst);
        createList(2, judLst); 
                
        createDelBtn(1, athlDelBtn);
        createDelBtn(2, judDelBtn);
        
        createComboAndBtn(1, athlCombo, athlAddBtn);
        createComboAndBtn(2, judCombo, judAddBtn);
    }

    private void createWelcomeLabel() {
        String str = tcModel.getValueAt(sel, 0) + ". " +
                     tcModel.getValueAt(sel, 3);
        welcome = new JLabel(str);
        welcome.setSize(800, 70);
        welcome.setLocation(2084, 30);
        welcome.setVisible(true);
        welcome.setOpaque(true);
        welcome.setBackground(Color.LIGHT_GRAY);
        CommonSettings.settingFont30(welcome);
        CommonSettings.settingGrayBorder(welcome);
        this.add(welcome);
    }
    
     private void createLabel(int i, JLabel lbl) {
        lbl = new JLabel();
        if (i == 1) lbl.setText("Список спортсменов");
        if (i == 2) lbl.setText("Список судей");        
        lbl.setVisible(true);
        lbl.setSize(800, 100);
        lbl.setLocation(734 + (i-1)*900, 200);
        CommonSettings.settingFont30(lbl);
        CommonSettings.settingGrayBorder(lbl);
        lbl.setOpaque(true);
        lbl.setBackground(Color.LIGHT_GRAY);
        this.add(lbl);
    }
    
    private void createList(int i, JList lst) {
        lst = new JList();
        if (i == 1) {
            athlLstModel = new DefaultListModel();
            lst.setModel(athlLstModel);
        }
        else if (i == 2) {
            judLstModel = new DefaultListModel();
            lst.setModel(judLstModel);
        }
        CommonSettings.settingFont30(lst);
        lst.setVisible(true);        
        lst.setBackground(Color.WHITE);
        lst.setSelectedIndex(0);
        lst.setFocusable(false);  
        
        JScrollPane scrl = new JScrollPane(lst);
        scrl.setSize(800, 950);
        scrl.setLocation(734 + (i-1)*900, 310);
        this.add(scrl);
    } 
    
    private void createDelBtn(int i, JButton btn) {
        btn = new JButton("-");
        CommonSettings.settingFont30(btn);
        btn.setFocusable(false);
        btn.setSize(100, 100);
        btn.setLocation(734 + i*900 - 200, 1380);
        btn.setBackground(Color.LIGHT_GRAY);
        this.add(btn);
    }
    
    private void createComboAndBtn(int i, JComboBox cmb, JButton btn) {
        //combo
        cmb = new JComboBox();        
        CommonSettings.settingFont30(cmb);
        cmb.setEditable(false);
        cmb.setSize(690, 100);
        cmb.setLocation(734 + (i-1)*900, 1270);
        this.add(cmb);       
        
        //btns
        btn = new JButton("+");      
        btn.setFocusable(false);
        btn.setSize(100, 100);
        btn.setLocation(734 + i*900 - 200, 1270);
        CommonSettings.settingFont30(btn);
        btn.setBackground(Color.LIGHT_GRAY);
        this.add(btn);
    }     
}
