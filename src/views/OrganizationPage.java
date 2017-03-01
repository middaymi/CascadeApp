package views;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class OrganizationPage extends JPanel {
    
    private JButton changeBtn; 
    
    private JLabel fullNameLabel;
    private JLabel phoneNameLabel;
    private JLabel siteLabel;
    private JLabel eMailLabel;
    private JLabel ogrnLabel;
    private JLabel kppLabel;
    private JLabel innLabel;
    private JLabel accountLabel;
    private JLabel legalAddressLabel;
    private JLabel actualAddressLabel;
    
    private JTextField fullNameField;
    private JTextField phoneNameField;
    private JTextField siteField;
    private JTextField eMailField;
    private JTextField ogrnField;
    private JTextField kppField;
    private JTextField innField;
    private JTextField accountField;
    private JTextField legalAddressField;
    private JTextField actualAddressField;    
    
    public OrganizationPage() { 
        organizationPagePanelSettings();
        createChangeButton(changeBtn);
        createLabels();
        createTextFields();              
    } 
    
    //PANEL_SETTINGS*************************************************************
    //organization panel settings
    private void organizationPagePanelSettings() {
        this.setLayout(null);
        this.setSize(Manager.getWidth(), 
                     Manager.getHeightWithInsets());
        this.setOpaque(false);       
    } 
    //a button for a possible to change organization panel
    private void createChangeButton(JButton btn) {
        btn = new JButton();
        btn.setSize(Manager.getWidth()/32, 
                    Manager.getHeightWithInsets()/18);
        btn.setLocation(9*Manager.getWidth()/10, 
                        302*Manager.getHeightWithInsets()/349);
        this.add(btn);
    }
    
    //LABELS********************************************************************
    private void createLabels() {         
        fullNameLabel = new JLabel("Название: ");
        phoneNameLabel = new JLabel("Контактный номер: ");
        siteLabel = new JLabel("Веб-сайт: ");
        eMailLabel = new JLabel("e-mail: ");
        ogrnLabel = new JLabel("ОГРН: ");
        kppLabel = new JLabel("КПП: ");
        innLabel = new JLabel("ИНН: ");
        accountLabel = new JLabel("Банковский счет: ");
        legalAddressLabel = new JLabel("Юридический адрес: ");
        actualAddressLabel = new JLabel("Фактический адрес: ");         
        setSizeLocationFontBorderLabel(fullNameLabel, 0);
        setSizeLocationFontBorderLabel(phoneNameLabel, 1);
        setSizeLocationFontBorderLabel(siteLabel, 2);
        setSizeLocationFontBorderLabel(eMailLabel, 3);
        setSizeLocationFontBorderLabel(ogrnLabel, 4);
        setSizeLocationFontBorderLabel(kppLabel, 5);
        setSizeLocationFontBorderLabel(innLabel, 6);
        setSizeLocationFontBorderLabel(accountLabel, 7);
        setSizeLocationFontBorderLabel(legalAddressLabel, 8);
        setSizeLocationFontBorderLabel(actualAddressLabel, 9);
    }
    private void setSizeLocationFontBorderLabel(JLabel lbl, int x) {
        CommonSettings.settingFont30(lbl);
        lbl.setSize(33*Manager.getWidth()/320, 
                    20*Manager.getHeightWithInsets()/349);
        lbl.setLocation((Manager.getWidth()/64),
                         10*Manager.getHeightWithInsets()/349 +
                         30*Manager.getHeightWithInsets()/349 * x);
        CommonSettings.settingGrayBorder(lbl);
        this.add(lbl);
    }
    
    //TEXTFIELDS****************************************************************
    private void createTextFields() {
        setSizeLocationFontBorderTextField(fullNameField, 0);
        setSizeLocationFontBorderTextField(phoneNameField, 1);
        setSizeLocationFontBorderTextField(siteField, 2);
        setSizeLocationFontBorderTextField(eMailField, 3);
        setSizeLocationFontBorderTextField(ogrnField, 4);
        setSizeLocationFontBorderTextField(kppField, 5);
        setSizeLocationFontBorderTextField(innField, 6);
        setSizeLocationFontBorderTextField(accountField, 7);
        setSizeLocationFontBorderTextField(legalAddressField, 8);
        setSizeLocationFontBorderTextField(actualAddressField, 9);
    }    
    private void setSizeLocationFontBorderTextField(JTextField txtField, int x){
        txtField = new JTextField("empty");
        CommonSettings.settingFont30(txtField);
        txtField.setSize(13*Manager.getWidth()/32, 
                         20*Manager.getHeightWithInsets()/349);
        txtField.setLocation((Manager.getWidth()/8),
                         10*Manager.getHeightWithInsets()/349 +
                         30*Manager.getHeightWithInsets()/349 * x);
        CommonSettings.settingGrayBorder(txtField);
        this.add(txtField);        
    }
}
