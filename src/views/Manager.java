/*VALUES OF THE 'CURRENT PANEL':
0  - START PAGE
10 - ORGANIZATION PAGE
20 - EMPLOYEE PAGE
30 - ATHLETE PAGE
40 - PERFORMANE PAGE
     41 - PERFORMANCE_EDIT PAGE
50 - COMPETITION AND TESTING PAGE
*/

package views;

import views.Performance.PerformancePage;
import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.Toolkit;
import views.Performance.*;
import views.TestingCompetition.*;

public class Manager {
    
    private static Manager managerInstance = null;
    
    private static MainFrame mFrame = null;
    private static StartPage stPage = null;
    private static OrganizationPage orgPage = null;
    private static EmployeePage empPage = null;
    private static AthletePage athPage = null;
    private static PerformancePage perPage = null;
    private static PerformanceEditPage perEditPage = null;
    private static TestingCompetitionPage testCompPage = null;
    private static CommonButtonsPanel comBtnPanel = null;
    
    private static int width;
    private static int height;
    private static int insetsTopBottom;
    private static int insetsLeftRight;
           
    private Manager() { 
        width = getResolution().width;
        height = getResolution().height;
        mFrame = new MainFrame();
        insetsTopBottom = mFrame.getInsetBottom();
        insetsLeftRight = mFrame.getInsetLeftRight();
        createCommonBtnPanel();
        createStartPage();         
    } 
    
    public static Manager getManagerInstance() {
        if (managerInstance == null) {
            managerInstance = new Manager();
        }
        return managerInstance;
    }
      
    //GET_SCREEN_RESOLUTION*****************************************************
    private Dimension getResolution() {
      return Toolkit.getDefaultToolkit().getScreenSize();   
    }
    public static int getWidth() {
        return width;
    }
    public static int getHeight() {
        return height;
    }
    public static int getWidthWithInsets() {
        return (width - insetsLeftRight);
    }
    public static int getHeightWithInsets() {        
        return (height - insetsTopBottom);
    }
    
    //COMMON_BTN_PANEL**********************************************************
    private void createCommonBtnPanel() {
        comBtnPanel = new CommonButtonsPanel();
        getComBtnPanel().setVisible(true);
        getmFrame().getContentPane().add(getComBtnPanel(), BorderLayout.CENTER);        
    }
    
    //START_PAGE****************************************************************
    private void createStartPage(){
        stPage = new StartPage();
        getComBtnPanel().useBtns(0);
        getmFrame().getContentPane().add(getStPage(), BorderLayout.CENTER);       
    }
    
    //ORGANIZATION_PAGE*********************************************************
     private static void createOrganizationPage(){
        orgPage = new OrganizationPage();
        getmFrame().getContentPane().add(getOrgPage(), BorderLayout.CENTER);
    }
     
    //EMPLOYEE_PAGE*************************************************************
    private static void createEmployeePage() {
        empPage = new EmployeePage();
        getmFrame().getContentPane().add(getEmpPage(), BorderLayout.CENTER);
    }
    
    //ATHLETE_PAGE**************************************************************
    private static void createAthletePage() {
        athPage = new AthletePage();
        getmFrame().getContentPane().add(getAthPage(), BorderLayout.CENTER);
    }
    
    //PERFORMANCE_PAGE**********************************************************
    private static void createPerformancePage() {
        perPage = new PerformancePage();
        getmFrame().getContentPane().add(getPerPage(), BorderLayout.CENTER);
    }
    private static void createPerEditPage() {
        perEditPage = new PerformanceEditPage();
        getmFrame().getContentPane().add(getPerEditPage(), BorderLayout.CENTER);
    }

    //TESTING_AND_COMPETITION_PAGE**********************************************
     private static void createTestingCompetitionPage() {
        testCompPage = new TestingCompetitionPage();
        getmFrame().getContentPane().add(getTestCompPage(), BorderLayout.CENTER);
    }   
    
    //NOT_VISIBLE_FOR_ALL_CREATED_PANELS****************************************
    private static void hideAllPanels() {
        if (getStPage() != null) getStPage().setVisible(false);
        if (getOrgPage() != null) getOrgPage().setVisible(false);
        if (getEmpPage() != null) getEmpPage().setVisible(false);
        if (getAthPage() != null) getAthPage().setVisible(false);
        if (getPerPage() != null) getPerPage().setVisible(false);
        if (getPerEditPage() != null) getPerEditPage().setVisible(false);
        if (getTestCompPage() != null) getTestCompPage().setVisible(false);
    }
    
    //CHOOSE_PANELS*************************************************************
    public static void choosePanel(int currentNumber) {
        hideAllPanels();
        switch(currentNumber) {
            case(0):
                getStPage().setVisible(true);
                getComBtnPanel().useBtns(0);
                break;  
            case(10):
                if (getOrgPage() == null) createOrganizationPage();
                getOrgPage().setVisible(true);
                getComBtnPanel().useBtns(10);
                break;
            case(20):
                if (getEmpPage() == null) createEmployeePage();
                getEmpPage().setVisible(true); 
                getComBtnPanel().useBtns(20);
                break;
            case(30):
                if (getAthPage() == null) createAthletePage();
                getAthPage().setVisible(true);
                getComBtnPanel().useBtns(20);
                break;
            case(40):
                if (getPerPage() == null) createPerformancePage();
                getPerPage().setVisible(true);
                getComBtnPanel().useBtns(20);
                break;
            case(41):                
                if (getPerEditPage() == null) createPerEditPage();
                getPerEditPage().setVisible(true);                
                getComBtnPanel().useBtns(30);
                break;
            case(50):
                if (getPerPage() == null) createPerformancePage();
                getTestCompPage().setVisible(true);
                getComBtnPanel().useBtns(20);
                break;
        }
    } 

    //get panels
    public static MainFrame getmFrame() {
        return mFrame;
    }
    public static StartPage getStPage() {
        return stPage;
    }
    public static OrganizationPage getOrgPage() {
        return orgPage;
    }
    public static EmployeePage getEmpPage() {
        return empPage;
    }
    public static AthletePage getAthPage() {
        return athPage;
    }
    public static PerformancePage getPerPage() {
        return perPage;
    }
    public static PerformanceEditPage getPerEditPage() {
        return perEditPage;
    }            
    public static TestingCompetitionPage getTestCompPage() {
        return testCompPage;
    }
    public static CommonButtonsPanel getComBtnPanel() {
        return comBtnPanel;
    }
}
