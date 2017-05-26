package views.TestCom.StartCom;

import data.Element;
import data.Judge;
import data.MarkCellData;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.GridLayout;
import java.util.ArrayList;
import java.util.Collection;
import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import data.SportsmanResult;
import models.TestCom.StartCom.StComModel;
import models.TestCom.TestComModel;
import views.CommonSettings;

public class StComPage extends JPanel {
    private TestComModel tcModel;
    private StComModel stComModel;
    
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
        createPdfBtn();
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
        stComModel = StComModel.getStComModelInstance();
        
        mainPanel.setLayout(null);
        mainPanel.setSize(5000, 5000);            
        mainScrl = new JScrollPane(mainPanel, JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED,
                                              JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED); 
        //mainScrl.setSize(2588, 1400);
        mainScrl.setLocation(50, 177); 
        mainScrl.getViewport().setBackground(Color.ORANGE);
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
        finBtn.addActionListener(new controllers.TestComPage.StComPages.FinishCom());
    }
    
    private void createPdfBtn() {
        JButton savePdf = new JButton("<html>Сохранить<p align=center>" +
                                                        "в PDF<html>");
        savePdf.setSize(430, 100);
        savePdf.setLocation(2688, 1130);
        savePdf.setBackground(Color.LIGHT_GRAY);
        CommonSettings.settingGrayBorder(savePdf);
        CommonSettings.settingFontBold30(savePdf);
        this.add(savePdf);
        savePdf.addActionListener(new controllers.TestComPage.StComPages.SavePdf());
    }
    
    public void setSportsmanLabels(Collection<SportsmanResult> values, int j) { 
        int i = 0;  
        HeaderTextArea label = null;
        for (SportsmanResult value : values) {
            if (j == 1) {
                label = new HeaderTextArea(true, ++i + j, 
                        (i) + ". " + value.getAthlete().toString());
            }
            else {
                label = new HeaderTextArea(true, ++i, 
                        (i) + ". " + value.getAthlete().toString());
            }
            mainPanel.add(label);
        }
    }
    
    public void setElementLabels(Collection<Element> values) { 
        int i = 0;
        HeaderTextArea label = null;
        for (Element value : values) {
            String unit = value.getUnits();
            if (unit != null) {
                label = new HeaderTextArea(false, i++, (value.getFullName() +  ", (" + value.getUnits() + ")"));
            } else {
                label = new HeaderTextArea(false, i++, value.getFullName());    
            }
            mainPanel.add(label);
        }
    }
    
    public void setElementWithJudgesLabels(Collection<Element> values, Collection<Judge> judges) { 
        int k = 0; //for common location count
        int i = 0;
        for (Element value : values) {
            HeaderTextArea label = new HeaderTextArea(false, i++, value.getFullName(), 
                                       new Dimension(125 * judges.size(), 100));
            mainPanel.add(label);            
            int j = 0;        
            for (Judge judge : judges) {
                ++j;
                HeaderTextArea label1 = new HeaderTextArea(false, k++, String.valueOf(j), 100, true);  
                mainPanel.add(label1);
            }
        }                        
    }
    
    public void setFields(ArrayList<ArrayList<MarkCellData>> matrix, int top) {
        stComModel = StComModel.getStComModelInstance();
        if (matrix.size() > 0) {
            JPanel panel = new JPanel();            
            panel.setVisible(true);
            panel.setOpaque(true);
            GridLayout layout = new GridLayout(matrix.size(), matrix.get(0).size());
            panel.setLayout(layout);
            for (ArrayList<MarkCellData> values : matrix) {
                for (MarkCellData value : values) { 
                    MarkTextField field = new MarkTextField(value);
                    String strValue = String.valueOf(value.getValue());
                    if (strValue.equals("null")) {
                        field.setText("");}
                    else {
                        field.setText(strValue);
                    }
                    panel.add(field);
                    field.addActionListener(new controllers.TestComPage.StComPages.
                                                       SaveValue(field));
                }
            }
            //if glasial
            if (tcModel.getCompetitions().get(tcModel.selRow()).getKind().getId() == 3) {
                panel.setSize(125 * matrix.get(0).size(), 100 * matrix.size());
                mainPanel.setPreferredSize(new Dimension(400 + panel.getWidth(), 200 + panel.getHeight()));
            } else {
                panel.setSize(250 * matrix.get(0).size(), 100 * matrix.size());
                mainPanel.setPreferredSize(new Dimension(400 + panel.getWidth(), 100 + panel.getHeight()));
            }
            
            //crop mainScrl if it possible
            if (mainPanel.getPreferredSize().width < 2588) {
                mainScrl.setSize(mainPanel.getPreferredSize().width + 20, 1400);
            } else {
                mainScrl.setSize(2588, 1400);
            }
            if (mainPanel.getPreferredSize().height < 1400) {
                mainScrl.setSize(mainScrl.getWidth(), mainPanel.getPreferredSize().height + 20);
            } else {
                mainScrl.setSize(mainScrl.getWidth(), 1400);
            }
            
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
