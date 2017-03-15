package views;

import javax.swing.JButton;
import javax.swing.JPanel;

public class StartPage extends JPanel{
    
    private Manager manager;
    private JButton organizationBtn;
    private JButton employeeBtn;
    private JButton athleteBtn;
    private JButton performanceBtn;
    private JButton competitionBtn;
    private JButton testingBtn;
    
    public StartPage() {  
        CommonSettings.panelSettings(this);
        createButtons();
    }     
      
    //create all buttons
    private void  createButtons() { 
        //create buttons
        organizationBtn = new JButton("Организация");
        employeeBtn = new JButton("Сотрудники");
        athleteBtn = new JButton("Спортсмены");
        performanceBtn = new JButton("Постановки");
        competitionBtn = new JButton("Соревнования");
        testingBtn = new JButton("Зачеты");
                                
        //buttons settings
        setButtonsSizeLocationAdd(1, 1, organizationBtn);
        setButtonsSizeLocationAdd(1, 2, employeeBtn);
        setButtonsSizeLocationAdd(1, 3, athleteBtn);
        setButtonsSizeLocationAdd(2, 1, performanceBtn);
        setButtonsSizeLocationAdd(2, 2, competitionBtn);
        setButtonsSizeLocationAdd(2, 3, testingBtn);
               
        //add listeners
        organizationBtn.addActionListener(new controllers.StartPage.
                                              OrganizationBtnListener());        
        employeeBtn.addActionListener(new controllers.StartPage.
                                          EmployeeBtnListener());
        athleteBtn.addActionListener(new controllers.StartPage.
                                         AthleteBtnListener());
        performanceBtn.addActionListener(new controllers.StartPage.
                                             PerformanceBtnListener());
        competitionBtn.addActionListener(new controllers.StartPage.
                                             CompetitionBtnListener());
        testingBtn.addActionListener(new controllers.StartPage.
                                         TestingBtnListener());       
    }    
    //size, location, font
    private void setButtonsSizeLocationAdd(int x, int y, JButton btn) {
        //location: 2 rows(x), 3 columns(y)
        btn.setSize((3*Manager.getWidth())/16, 
                     2*Manager.getHeightWithInsets()/9);        
        CommonSettings.settingFont50(btn);
        CommonSettings.settingLightGrayBorder(btn);
        //btn's painting
        //btn.setBorderPainted(false);
        btn.setFocusPainted(false);
        btn.setContentAreaFilled(false);
        
        //pressed and rollover btn's icon
        //btn.setPressedIcon(setSizesBottomPanel(imgPr, iconPr));
        //btn.setRolloverIcon(setSizesBottomPanel(imgPr, iconPr)); 
        
        if (x == 1) {
            switch(y) {
                case 1: btn.setLocation(3*Manager.getWidth()/16,
                                          Manager.getHeightWithInsets()/4);
                        this.add(organizationBtn);
                        break;
                case 2: btn.setLocation(13*Manager.getWidth()/32,
                                           Manager.getHeightWithInsets()/4);
                        this.add(employeeBtn);
                        break;
                case 3: btn.setLocation(5*Manager.getWidth()/8, 
                                          Manager.getHeightWithInsets()/4);
                        this.add(athleteBtn);
                        break;
            }
        }
        if (x == 2) {
            switch(y) {
                case 1: btn.setLocation(3*Manager.getWidth()/16, 
                                       19*Manager.getHeightWithInsets()/36);
                        this.add(performanceBtn);
                        break;
                case 2: btn.setLocation(13*Manager.getWidth()/32, 
                                        19*Manager.getHeightWithInsets()/36);
                        this.add(competitionBtn);
                        break;
                case 3: btn.setLocation(5*Manager.getWidth()/8, 
                                       19*Manager.getHeightWithInsets()/36);
                        this.add(testingBtn);
                        break;
            }
        }
    }
}
