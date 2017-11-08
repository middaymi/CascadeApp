package views;

import java.awt.Color;
import javax.swing.JButton;
import javax.swing.JPanel;

public class CommonButtonsPanel extends JPanel {
    
    private JButton settingBtn;
    private JButton toMainFrameBtn;
    private JButton backBtn;
    private JButton nextBtn;

    private int w = Manager.getWidthWithInsets();
    private int h = Manager.getHeightWithInsets();

    public CommonButtonsPanel() {
        CommonSettings.panelSettings(this);
        createSettingBtn();
        createToMainFrameBtn();
        createBackBtn();
        createNextBtn();
    }
  
    //setting button
    private void createSettingBtn () {
        settingBtn = new JButton("*");
        settingBtn.setSize(w/32, h/18);
        settingBtn.setLocation(1509*w/1600, 1507*h/1800);
        settingBtn.setBackground(Color.LIGHT_GRAY);
        CommonSettings.settingFont30(settingBtn);
        this.add(settingBtn);
    }
    //a button for jump to mainFrame 
    private void createToMainFrameBtn () {
        toMainFrameBtn = new JButton("Главная");
        toMainFrameBtn.setSize(w/16, 7*h/180);
        toMainFrameBtn.setLocation(371*w/800, h/60);
        toMainFrameBtn.setBackground(Color.LIGHT_GRAY);
        CommonSettings.settingFont30(toMainFrameBtn);
        this.add(toMainFrameBtn);
        toMainFrameBtn.addActionListener(new controllers.CommonButtons.
                                             JumpToMainFrameBtnListener());
    }  
    private void createBackBtn() {
        backBtn = new JButton("⟵");
        backBtn.setSize(w/32, 7*h/180);
        backBtn.setLocation(w/64, h/60);
        backBtn.setBackground(Color.LIGHT_GRAY);
        CommonSettings.settingFont30(backBtn);
        this.add(backBtn);
        backBtn.addActionListener(new controllers.CommonButtons.
                                      BackBtnListener());
    }
    private void createNextBtn() {
        nextBtn = new JButton("⟶");
        nextBtn.setSize(w/32, 7*h/180);
        nextBtn.setLocation(1509*w/1600, h/60);
        nextBtn.setBackground(Color.LIGHT_GRAY);
        CommonSettings.settingFont30(nextBtn);
        this.add(nextBtn);
    }            
            
    //hide or setVisible backBtn, nextBtn, toMainFrameBtn, settingBtn
    public void useBtns(int panelNumber) {
        switch(panelNumber) {
            case(0): //startPage
                getBackBtn().setVisible(false);
                getBackBtn().setEnabled(false);
                getToMainFrameBtn().setVisible(false);
                getToMainFrameBtn().setEnabled(false);
                getNextBtn().setVisible(false);
                getNextBtn().setEnabled(false);
                getSettingBtn().setVisible(true);
                getSettingBtn().setEnabled(true);
                break;
            case (10): //organizationPage
                getBackBtn().setVisible(false);
                getBackBtn().setEnabled(false);
                getToMainFrameBtn().setVisible(true);
                getToMainFrameBtn().setEnabled(true);
                getNextBtn().setVisible(false);
                getNextBtn().setEnabled(false);
                getSettingBtn().setVisible(false);
                getSettingBtn().setEnabled(false);                    
                break; 
            case (30): //PerformanceEditPage
                getBackBtn().setVisible(true);
                getBackBtn().setEnabled(true);
                getToMainFrameBtn().setVisible(true);
                getToMainFrameBtn().setEnabled(true);
                getNextBtn().setVisible(false);
                getNextBtn().setEnabled(false);
                getSettingBtn().setVisible(false);
                getSettingBtn().setEnabled(false);                    
                break; 
            default:
                getBackBtn().setVisible(false);
                getBackBtn().setEnabled(false);
                getToMainFrameBtn().setVisible(true);
                getToMainFrameBtn().setEnabled(true);
                getNextBtn().setVisible(false);
                getNextBtn().setEnabled(false);
                getSettingBtn().setVisible(false);
                getSettingBtn().setEnabled(false);               
        }
    }
    //getting btns
    public JButton getSettingBtn() {
        return settingBtn;
    }
    public JButton getToMainFrameBtn() {
        return toMainFrameBtn;
    }
    public JButton getBackBtn() {
        return backBtn;
    }
    public JButton getNextBtn() {
        return nextBtn;
    }
    
    //setting btns
    public void setSettingBtn(JButton settingBtn) {
        this.settingBtn = settingBtn;
    }
    public void setToMainFrameBtn(JButton toMainFrameBtn) {
        this.toMainFrameBtn = toMainFrameBtn;
    }
    public void setBackBtn(JButton backBtn) {
        this.backBtn = backBtn;
    }
    public void setNextBtn(JButton nextBtn) {
        this.nextBtn = nextBtn;
    }   
}
