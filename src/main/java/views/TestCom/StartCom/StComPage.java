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
import views.Manager;

public class StComPage extends JPanel {
    private TestComModel tcModel;
    private StComModel stComModel;
    
    private JPanel mainPanel;
    private JList judLst;
    private DefaultListModel lstModel;   
    private JScrollPane mainScrl;
    private JScrollPane judScrl;
    
    private JLabel welcome;

    private int w = Manager.getWidthWithInsets();
    private int h = Manager.getHeightWithInsets();
    
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
        welcome.setSize(w/4, 7*h/180);
        welcome.setLocation(1159*w/1600, h/60);
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
        mainPanel.setSize(25*w/16, 25*h/9);
        mainScrl = new JScrollPane(mainPanel, JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED,
                                              JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
        mainScrl.setLocation(w/64, 59*h/600);
        mainScrl.getViewport().setBackground(Color.ORANGE);
        mainScrl.setVisible(true);
        this.add(mainScrl);
    }    
    
    private void createJudScrl() {
        CommonSettings.settingFont30(judLst);        
        judLst.setModel(lstModel);
        judScrl = new JScrollPane(judLst);
        judScrl.setSize(43*w/320, h/3);
        judScrl.setLocation(21*w/50, 277*h/1800);
        this.add(judScrl);
    }
    
    private void createJudgeLabel() {
        JLabel judLbl = new JLabel("Список судей");
        judLbl.setHorizontalTextPosition(JLabel.CENTER);
        judLbl.setSize(43*w/320, h/18);
        judLbl.setLocation(21*w/50, 59*h/600);
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
        finBtn.setSize(43*w/320, h/18);
        finBtn.setLocation(21*w/50, 5*h/9);
        finBtn.setBackground(Color.LIGHT_GRAY);
        CommonSettings.settingGrayBorder(finBtn);
        CommonSettings.settingFontBold30(finBtn);
        this.add(finBtn);
        finBtn.addActionListener(new controllers.TestComPage.StComPages.FinishCom());
    }
    
    private void createPdfBtn() {
        JButton savePdf = new JButton("<html>Сохранить<p align=center>" +
                                                        "в PDF<html>");
        savePdf.setSize(43*w/320, h/18);
        savePdf.setLocation(21*w/50, 113*h/180);
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
                                       new Dimension(5*w/640 * judges.size(), h/18));
            mainPanel.add(label);            
            int j = 0;        
            for (Judge judge : judges) {
                ++j;
                HeaderTextArea label1 = new HeaderTextArea(false, k++, String.valueOf(j), h/18, true);
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
                panel.setSize(5*w/640 * matrix.get(0).size(), h/18 * matrix.size());
                mainPanel.setPreferredSize(new Dimension(w/8 + panel.getWidth(), h/9 + panel.getHeight()));
            } else {
                panel.setSize(5*w/64 * matrix.get(0).size(), h/18 * matrix.size());
                mainPanel.setPreferredSize(new Dimension(w/8 + panel.getWidth(), h/18 + panel.getHeight()));
            }
            
            //crop mainScrl if it possible
            if (mainPanel.getPreferredSize().width < 647*w/800) {
                mainScrl.setSize(mainPanel.getPreferredSize().width + w/160, 7*h/9);
            } else {
                mainScrl.setSize(647*w/800, 7*h/9);
            }
            if (mainPanel.getPreferredSize().height < 7*h/9) {
                mainScrl.setSize(mainScrl.getWidth(), mainPanel.getPreferredSize().height + h/90);
            } else {
                mainScrl.setSize(mainScrl.getWidth(), 7*h/9);
            }
            
            panel.setLocation(w/8, top);
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
