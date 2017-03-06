 package views;

import data.Organization;
import java.awt.Color;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import models.OrganizationModel;

public class OrganizationPage extends JPanel {
    
    private JButton changeBtn = null; 
    
    private JLabel fullNameLabel;
    private JLabel phoneNumberLabel;
    private JLabel siteLabel;
    private JLabel eMailLabel;
    private JLabel ogrnLabel;
    private JLabel kppLabel;
    private JLabel innLabel;
    private JLabel accountLabel;
    private JLabel legalAddressLabel;
    private JLabel actualAddressLabel;
    
    private JTextField fullNameField;
    private JTextField phoneNumberField;
    private JTextField siteField;
    private JTextField eMailField;
    private JTextField ogrnField;
    private JTextField kppField;
    private JTextField innField;
    private JTextField accountField;
    private JTextField legalAddressField;
    private JTextField actualAddressField; 
    
    private Organization organizationData;
    private OrganizationModel orgModel;
        
    public OrganizationPage() {         
        orgModel = models.OrganizationModel.getOrganizationModelInstance();
        CommonSettings.panelSettings(this);
        createChangeButton();
        createLabels();
        organizationData = orgModel.getOrganizationData();        
        createTextFields();
        settingsTextFields();
        setEditableTextFiels(false);
    } 
           
    //CHANGE_BUTTON*************************************************************
    //a button for a possible to change organization panel
    private void createChangeButton() {
        changeBtn = new JButton();
        changeBtn.setBackground(Color.YELLOW);
        changeBtn.setSize(Manager.getWidth()/32, 
                    Manager.getHeightWithInsets()/18);
        changeBtn.setLocation(9*Manager.getWidth()/10, 
                        302*Manager.getHeightWithInsets()/349);
        this.add(changeBtn);
        changeBtn.addActionListener(new controllers.OrganizationPage.
                                        ChangeButtonListener());
    }
        
    //LABELS********************************************************************
    //set and apply labels
    private void createLabels() {         
        fullNameLabel = new JLabel("Название: ");
        phoneNumberLabel = new JLabel("Контактный номер: ");
        siteLabel = new JLabel("Веб-сайт: ");
        eMailLabel = new JLabel("e-mail: ");
        ogrnLabel = new JLabel("ОГРН: ");
        kppLabel = new JLabel("КПП: ");
        innLabel = new JLabel("ИНН: ");
        accountLabel = new JLabel("Банковский счет: ");
        legalAddressLabel = new JLabel("Юридический адрес: ");
        actualAddressLabel = new JLabel("Фактический адрес: ");         
        setSizeLocationFontBorderLabel(fullNameLabel, 0);
        setSizeLocationFontBorderLabel(phoneNumberLabel, 1);
        setSizeLocationFontBorderLabel(siteLabel, 2);
        setSizeLocationFontBorderLabel(eMailLabel, 3);
        setSizeLocationFontBorderLabel(ogrnLabel, 4);
        setSizeLocationFontBorderLabel(kppLabel, 5);
        setSizeLocationFontBorderLabel(innLabel, 6);
        setSizeLocationFontBorderLabel(accountLabel, 7);
        setSizeLocationFontBorderLabel(legalAddressLabel, 8);
        setSizeLocationFontBorderLabel(actualAddressLabel, 9);
    }
    //set Labels size, location, font, border
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
    //apply changes
    private void settingsTextFields() {
        setSizeLocationFontBorder(fullNameField, 0);
        setSizeLocationFontBorder(phoneNumberField, 1);
        setSizeLocationFontBorder(siteField, 2);
        setSizeLocationFontBorder(eMailField, 3);
        setSizeLocationFontBorder(ogrnField, 4);
        setSizeLocationFontBorder(kppField, 5);
        setSizeLocationFontBorder(innField, 6);
        setSizeLocationFontBorder(accountField, 7);
        setSizeLocationFontBorder(legalAddressField, 8);
        setSizeLocationFontBorder(actualAddressField, 9);        
    } 
    //set TextFields size, location, font, border
    private void setSizeLocationFontBorder(JTextField txtField, int x){
        CommonSettings.settingFont30(txtField);
        txtField.setSize(13*Manager.getWidth()/32, 
                         20*Manager.getHeightWithInsets()/349);
        txtField.setLocation((Manager.getWidth()/8),
                         10*Manager.getHeightWithInsets()/349 +
                         30*Manager.getHeightWithInsets()/349 * x);
        CommonSettings.settingGrayBorder(txtField);
        this.add(txtField);        
    } 
    //create textFields and set a text
    private void createTextFields() {
        fullNameField = new JTextField(organizationData.getFullName());
        phoneNumberField = new JTextField(organizationData.getPhoneNumber());
        siteField = new JTextField(organizationData.getSite());
        eMailField  = new JTextField(organizationData.geteMail());
        ogrnField = new JTextField(organizationData.getOGRN());
        kppField = new JTextField(organizationData.getKPP());
        innField = new JTextField(organizationData.getINN());
        accountField = new JTextField(organizationData.getAccount());
        legalAddressField = new JTextField(organizationData.getLegalAddress());
        actualAddressField = new JTextField(organizationData.getActualAddress());         
    }
    //posible to change or not    
    public void setEditableTextFiels(boolean b) {
        fullNameField.setEditable(b);
        phoneNumberField.setEditable(b);
        siteField.setEditable(b);
        eMailField.setEditable(b);
        ogrnField.setEditable(b);
        kppField.setEditable(b);
        innField.setEditable(b);
        accountField.setEditable(b);
        legalAddressField.setEditable(b);
        actualAddressField.setEditable(b);        
    }  
}
