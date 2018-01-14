package views.TestCom;

import java.awt.Color;
import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JScrollPane;

import lombok.Data;
import models.TestCom.TestComModel;
import views.CommonSettings;
import views.Manager;

@Data
public class OfpEditPage extends JPanel {
    private JLabel welcome;
    private Manager manager;
    private TestComModel tcModel;
    private TestComPage tcPage;
    int sel;
    
    private JLabel el; 
    private JLabel athl;
    private JLabel jud;
    
    private JList elLst;
    private JList athlLst;
    private JList judLst;
    private DefaultListModel elLstModel;
    private DefaultListModel athlLstModel;
    private DefaultListModel judLstModel;
    
    private JButton elDelBtn;
    private JButton athlDelBtn;
    private JButton judDelBtn;
    
    private JButton elAddBtn;
    private JButton athlAddBtn;
    private JButton judAddBtn;
    
    private JComboBox elCombo;
    private JComboBox athlCombo;
    private JComboBox judCombo;

    private int w = Manager.getWidthWithInsets();
    private int h = Manager.getHeightWithInsets();

    public OfpEditPage() {
        CommonSettings.panelSettings(this);
        manager = Manager.getManagerInstance();
        tcModel = TestComModel.getTestComModelInstance();
        tcPage = manager.getTestCompPage();
        sel = tcModel.selRow();
        
        //create labels
        createWelcomeLabel();
        createLabel(1, el);
        createLabel(2, athl);
        createLabel(3, jud);
        
        //create lists in scrollpane
        createList(1, elLst);
        createList(2, athlLst);
        createList(3, judLst); 
        
        createDelBtn(1, elDelBtn);
        createDelBtn(2, athlDelBtn);
        createDelBtn(3, judDelBtn);
        
        createComboAndBtn(1, elCombo, elAddBtn);
        createComboAndBtn(2, athlCombo, athlAddBtn);
        createComboAndBtn(3, judCombo, judAddBtn);
    }

    private void createWelcomeLabel() {
        String str = tcModel.getValueAt(sel, 0) + ". " +
                     tcModel.getValueAt(sel, 3);
        welcome = new JLabel(str);
        welcome.setSize(w/4, 70);
        welcome.setLocation(521*w/800, 30);
        welcome.setVisible(true);
        welcome.setOpaque(true);
        welcome.setBackground(Color.LIGHT_GRAY);
        CommonSettings.settingFont30(welcome);
        CommonSettings.settingGrayBorder(welcome);
        this.add(welcome);
    }
    
     private void createLabel(int i, JLabel lbl) {
        lbl = new JLabel();
        if (i == 1) lbl.setText("Список элементов");
        if (i == 2) lbl.setText("Список спортсменов");
        if (i == 3) lbl.setText("Список судей");
        lbl.setVisible(true);
        lbl.setSize(w/4, 100);
        lbl.setLocation(521*w/800 + (i-1)*9*w/32, 200);
        CommonSettings.settingFont30(lbl);
        CommonSettings.settingGrayBorder(lbl);
        lbl.setOpaque(true);
        lbl.setBackground(Color.LIGHT_GRAY);
        this.add(lbl);
    }
    
    private void createList(int i, JList lst) {
        lst = new JList();
        CommonSettings.settingFont30(lst);
        lst.setVisible(true);        
        lst.setBackground(Color.WHITE);
        lst.setSelectedIndex(0);
        lst.setFocusable(false);  
        
        JScrollPane scrl = new JScrollPane(lst);
        scrl.setSize(w/4, 950);
        scrl.setLocation(71*w/800 + (i-1)*9*w/32, 310);
        this.add(scrl);
        if (i == 1) {
            elLstModel = new DefaultListModel();
            lst.setModel(elLstModel);
            elLst = lst;
        }
        else if (i == 2) {
            athlLstModel = new DefaultListModel();
            lst.setModel(athlLstModel);
            athlLst = lst;
        }
        else if (i == 3) {
            judLstModel = new DefaultListModel();
            lst.setModel(judLstModel);
            judLst = lst;
        }
    } 
    
    private void createDelBtn(int i, JButton btn) {
        btn = new JButton("-");
        CommonSettings.settingFont30(btn);
        btn.setFocusable(false);
        btn.setSize(w/32, 100);
        btn.setLocation(21*w/800 + i*9*w/32, 1380);
        btn.setBackground(Color.LIGHT_GRAY);
        this.add(btn);
         if (i == 1) {
            elDelBtn = btn;
            elDelBtn.addActionListener(new controllers.TestComEditPages.
                                              OfpEditPage.DelElement());
        }
        else if (i == 2) {
            athlDelBtn = btn;
            athlDelBtn.addActionListener(new controllers.TestComEditPages.
                                             OfpEditPage.DelAthlete());
        }
        else if (i == 3) {
            judDelBtn = btn;
            judDelBtn.addActionListener(new controllers.TestComEditPages.
                                                 OfpEditPage.DelJudge());
        }
    }
    
    private void createComboAndBtn(int i, JComboBox cmb, JButton btn) {
        //combo
        cmb = new JComboBox();        
        CommonSettings.settingFont30(cmb);
        cmb.setEditable(false);
        cmb.setSize(69*w/320, 100);
        cmb.setLocation(71*w/800 + (i-1)*9*w/32, 1270);
        this.add(cmb); 
        if (i == 1) elCombo = cmb;
        else if (i == 2) athlCombo = cmb;
        else if (i == 3) judCombo = cmb;
        
        //btns
        btn = new JButton("+");      
        btn.setFocusable(false);
        btn.setSize(w/32, 100);
        btn.setLocation(21*w/800 + i*9*w/32, 1270);
        CommonSettings.settingFont30(btn);
        btn.setBackground(Color.LIGHT_GRAY);
        this.add(btn);
           if (i == 1) {
            elAddBtn = btn;
            elAddBtn.addActionListener(new controllers.TestComEditPages.
                                              OfpEditPage.AddElement());
        }
        else if (i == 2) {
            athlAddBtn = btn;
            athlAddBtn.addActionListener(new controllers.TestComEditPages.
                                             OfpEditPage.AddAthlete());
        }
        else if (i == 3) {
            judAddBtn = btn;
            judAddBtn.addActionListener(new controllers.TestComEditPages.
                                                 OfpEditPage.AddJudge());
        }
    }
}
