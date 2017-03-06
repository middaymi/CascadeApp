/*VALUES OF THE 'CURRENT PANEL':
0  - START PAGE
10 - ORGANIZATION PAGE
20 - EMPLOYEE PAGE
30 - ATHLETE PAGE
40 - PERFORMANE PAGE
50 - COMPETITION PAGE
60 - TESTING PAGE
*/

package views;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.Toolkit;

public class Manager {
    
    private static Manager ManagerInstance = null;
    
    private MainFrame mFrame = null;
    private StartPage stPage = null;
    private OrganizationPage orgPage = null;
    private EmployeePage empPage = null;
    
    private static int width;
    private static int height;
    private static int insetsBottom;
           
    private Manager() { 
        width = getResolution().width;
        height = getResolution().height;
        mFrame = new MainFrame();
        insetsBottom = mFrame.getInsetBottom();
        createStartPage();     
        mFrame.setManager(this);
    }    
    public static Manager getManagerInstance() {
        if (ManagerInstance == null)
            ManagerInstance = new Manager();
        return ManagerInstance;
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
    public static int getHeightWithInsets() {
        return (height - insetsBottom);
    }
    
    //START_PAGE****************************************************************
    private void createStartPage(){
        stPage = new StartPage();
        getStPage().setManager(this);
        getmFrame().getContentPane().add(getStPage(), BorderLayout.CENTER); 
        getmFrame().setVisible(true);
    }
    
    //ORGANIZATION_PAGE*********************************************************
     private void createOrganizationPage(){
        orgPage = new OrganizationPage();
        getmFrame().getContentPane().add(getOrgPage(), BorderLayout.CENTER);
    }
     
    //EMPLOYEE_PAGE*************************************************************
    private void createEmployeePage() {
        empPage = new EmployeePage();
        getmFrame().getContentPane().add(getEmpPage(), BorderLayout.CENTER);
    }
    
    //CHOOSE_PANELS*************************************************************
    public void choosePanel(int currentNumber) {
        hideAllPanels();
        switch(currentNumber) {
            case(0):
                getStPage().setVisible(true);
                break;  
            case(10):
                if (getOrgPage() == null) createOrganizationPage();
                getOrgPage().setVisible(true);
                break;
            case(20):
                if (getEmpPage() == null) createEmployeePage();
                getEmpPage().setVisible(true);
                break;
        }
    }
    private void hideAllPanels() {
        if (getStPage() != null) getStPage().setVisible(false);
        if (getOrgPage() != null) getOrgPage().setVisible(false);
        if (getEmpPage() != null) getEmpPage().setVisible(false);
    }   

    //get panels
    public MainFrame getmFrame() {
        return mFrame;
    }
    public StartPage getStPage() {
        return stPage;
    }
    public OrganizationPage getOrgPage() {
        return orgPage;
    }
    public EmployeePage getEmpPage() {
        return empPage;
    }
}
