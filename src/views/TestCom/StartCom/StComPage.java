package views.TestCom.StartCom;

import data.Element;
import data.Judge;
import data.MarkCellData;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.GridLayout;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Set;
import javax.lang.model.util.Elements;
import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import models.TestCom.StartCom.SportsmanResult;
import models.TestCom.TestComModel;
import views.CommonSettings;

public class StComPage extends JPanel {
    private TestComModel tcModel;
    
    private JPanel mainPanel;
    private JList judLst;
    private DefaultListModel lstModel;   
    private JScrollPane mainScrl;
    private JScrollPane judScrl;
    
    private JLabel welcome;
    
    public StComPage() {
        mainPanel = new JPanel();
        judLst = new JList();
        lstModel = new DefaultListModel();      
        tcModel = TestComModel.getTestComModelInstance();
        
        CommonSettings.panelSettings(this);
        createWelcomeLabel();
        createMainScrl();
        createJudScrl();
        createJudgeLabel();
        createFinishBtn();
    }

    private void createWelcomeLabel() {
        welcome = new JLabel();
        welcome.setSize(800, 70);
        welcome.setLocation(2318, 30);
        welcome.setVisible(true);
        welcome.setOpaque(true);
        welcome.setBackground(Color.LIGHT_GRAY);
        CommonSettings.settingFont30(welcome);
        CommonSettings.settingGrayBorder(welcome);
        this.add(welcome);
    } 
    
    private void createMainScrl() {
        mainPanel.setLayout(null);
        mainScrl = new JScrollPane(mainPanel);
        mainScrl.setAutoscrolls(true);
        mainScrl.setSize(2588, 1400);
        mainScrl.setLocation(50, 177);
        mainScrl.setBackground(Color.ORANGE);
        mainScrl.setVisible(true);
        this.add(mainScrl);
    }    
    
    private void createJudScrl() {
        CommonSettings.settingFont30(judLst);
        judLst.setModel(lstModel);
        judScrl = new JScrollPane(judLst);
        judScrl.setSize(430, 600);
        judScrl.setLocation(2688, 277);        
        this.add(judScrl);
    }
    
    private void createJudgeLabel() {
        JLabel judLbl = new JLabel("Список судей");
        judLbl.setHorizontalTextPosition(JLabel.CENTER);
        judLbl.setSize(430, 100);
        judLbl.setLocation(2688, 177);
        judLbl.setVisible(true);
        judLbl.setOpaque(true);
        judLbl.setBackground(Color.LIGHT_GRAY);
        CommonSettings.settingGrayBorder(judLbl);
        CommonSettings.settingFont30(judLbl);
        this.add(judLbl);
    }
    
    private void createFinishBtn() {
        JButton finBtn = new JButton("<html>Подвести<p align=center>" +
                                                        "итоги<html>");
        finBtn.setSize(430, 100);
        finBtn.setLocation(2688, 1000);
        finBtn.setBackground(Color.LIGHT_GRAY);
        CommonSettings.settingGrayBorder(finBtn);
        CommonSettings.settingFontBold30(finBtn);
        this.add(finBtn);
    } 
    
    public void setSportsmanLabels(Collection<SportsmanResult> values) { 
        int i = 0;
        for (SportsmanResult value : values) {
            HeaderLabel label = new HeaderLabel(true, ++i, (i - 1) + ". " + value.getAthlete().toString());
            mainPanel.add(label);
        }
    }
    
    public void setElementLabels(Collection<Element> values) { 
        int i = 0;
        for (Element value : values) {
            HeaderLabel label = new HeaderLabel(false, i++, value.getFullName());
            mainPanel.add(label);
        }
    }
    
    public void setElementWithJudgesLabels(Collection<Element> values, Collection<Judge> judges) { 
        int i = 0;
        for (Element value : values) {
            HeaderLabel label = new HeaderLabel(false, i++, value.getFullName(), new Dimension(300 * judges.size(), 100));
            mainPanel.add(label);
            int j = 0;        
            for (Judge judge : judges) {
                HeaderLabel label1 = new HeaderLabel(false, i++, String.valueOf(i), 100);  
                mainPanel.add(label1);
            }
        }                        
    }
    
    public void setFields(ArrayList<ArrayList<MarkCellData>> matrix, int top) {
        if (matrix.size() > 0) {
            JPanel panel = new JPanel();
            panel.setBackground(Color.ORANGE);
            panel.setVisible(true);
            panel.setOpaque(true);
            GridLayout layout = new GridLayout(matrix.size(), matrix.get(0).size());
            panel.setLayout(layout);
            for (ArrayList<MarkCellData> values : matrix) {
                for (MarkCellData value : values) { 
                    MarkTextField field = new MarkTextField(value);
                    panel.add(field);
                }
            }
            panel.setSize(300 * matrix.get(0).size(), 100 * matrix.size());
            panel.setLocation(400, top);            
            mainPanel.add(panel);
        }
    }

    public JPanel getMainPanel() {
        return mainPanel;
    }
    public JList getJudList() {
        return judLst;
    }
    public JLabel getWelcome() {
        return welcome;
    }
    public DefaultListModel getListModel() {
        return lstModel;
    }

    public void setMainPanel(JPanel mainPanel) {
        this.mainPanel = mainPanel;
    }
}
